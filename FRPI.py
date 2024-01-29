import requests
import cv2
import os
from mtcnn.mtcnn import MTCNN
from gpiozero import LED, Button
import base64
from PIL import Image
from io import BytesIO
from mfrc522 import SimpleMFRC522
import time
import numpy as np

# Configuramos los LEDs
led_rojo = LED(17)
led_verde = LED(27)

debe_registrar_salida = False
# Instancia del lector RFID
reader = SimpleMFRC522()

class TeachersGuardAPI:
    def __init__(self, base_url): 
        self.base_url = base_url

    def post_request(self, endpoint, data=None, params=None):
        url = f"{self.base_url}{endpoint}"
        response = requests.post(url, json=data, params=params)
        return response

    def get_request(self, endpoint, params=None):
        url = f"{self.base_url}{endpoint}"
        response = requests.get(url, params=params)
        return response
    
    def registrar_salida(self, usuario_id):
        endpoint = "/api/Attendance/register-exit"
        params = {'emailOrEmployeeNumber': usuario_id}
        return self.post_request(endpoint, params=params)
    
    def registrar_entrada(self, usuario_id):
        endpoint = "/api/Attendance/register-entry"
        params = {'emailOrEmployeeNumber': usuario_id}
        return self.post_request(endpoint, params=params)

    def obtener_usuario(self, rfid_id):
        endpoint = "/api/User/get-by-user-email-or-employee-number"
        params = {'emailOrEmployeeNumber': rfid_id}
        return self.get_request(endpoint, params=params)

# Instancia de la API
api = TeachersGuardAPI("https://teachersguard.azurewebsites.net")

#--------------------------- Función para decodificar imagen base64 ----------------------
def decodificar_imagen_base64(face_image_base64):
    image_data = base64.b64decode(face_image_base64)
    image = Image.open(BytesIO(image_data))
    image = np.array(image)
    image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
    return image

#--------------------------- Función para capturar rostro ----------------------
def capturar_rostro():
    cap = cv2.VideoCapture(0)
    detector = MTCNN()

    # Espera 3 segundos antes de tomar la foto
    time.sleep(3)

    ret, frame = cap.read()
    if not ret:
        print("Error al capturar imagen desde la cámara")
        return None
    
    rostros = detector.detect_faces(frame)
    for rostro in rostros:
        x, y, ancho, alto = rostro['box']
        cv2.rectangle(frame, (x, y), (x + ancho, y + alto), (0, 255, 0), 2)

    cv2.imshow('Captura de Rostro', frame)
    cv2.waitKey(2000) # Muestra la imagen por 2 segundos
    cv2.destroyAllWindows()
    cap.release()
    return frame

#--------------------------- Función para comparar rostros ----------------------
def comparar_rostros(rostro_capturado, rostro_api):
    if rostro_capturado is None or rostro_api is None:
        print("No se puede comparar los rostros, una imagen es None")
        return False

    # Convertir las imágenes a escala de grises para la comparación
    rostro_capturado_gris = cv2.cvtColor(rostro_capturado, cv2.COLOR_BGR2GRAY)
    rostro_api_gris = cv2.cvtColor(rostro_api, cv2.COLOR_BGR2GRAY)

    # Inicializar el detector ORB
    orb = cv2.ORB_create()

    # Detectar puntos clave y descriptores
    kpa, descr_a = orb.detectAndCompute(rostro_capturado_gris, None)
    kpb, descr_b = orb.detectAndCompute(rostro_api_gris, None)

    # Inicializar el comparador de fuerza bruta
    comp = cv2.BFMatcher(cv2.NORM_HAMMING, crossCheck=True)

    # Comparar descriptores
    matches = comp.match(descr_a, descr_b)

    # Calcular la similitud basada en los matches
    regiones_similares = [i for i in matches if i.distance < 70]
    if len(matches) == 0:
        parecido= 0
    else:
        parecido = len(regiones_similares) / len(matches)

    # Determinar si la similitud es suficiente para considerar que los rostros coinciden
    return parecido >= 0.75

#------------------------------------------Funcion para leer y validar los rostros---------------------------------------------------
def leer_rfid_y_comparar_rostro():
    global debe_registrar_salida
    try:
        print("Acerque su tarjeta al lector...")
        id, text = reader.read()
        print(f"ID de la tarjeta RFID: {id}")
        respuesta_usuario = api.obtener_usuario(rfid_id=str(id))
        if respuesta_usuario.status_code == 200:
            datos_usuario = respuesta_usuario.json()
            face_image_base64 = datos_usuario.get('faceImage', '')
            print("Imagen decodificada")
            if face_image_base64:
                rostro_api = decodificar_imagen_base64(face_image_base64)
                rostro_capturado = capturar_rostro()
                print("Rostro capturado")
                if rostro_capturado is not None:
                    if comparar_rostros(rostro_capturado, rostro_api):
                        print("Los rostros coinciden.")
                        led_verde.on()
                        led_rojo.off()
                        if debe_registrar_salida:
                            resultado = api.registrar_salida(usuario_id=str(id))
                            accion = "Salida"
                        else:
                            resultado = api.registrar_entrada(usuario_id=str(id))
                            accion = "Entrada"
                            debe_registrar_salida = not debe_registrar_salida  # Alternar estado
                        if resultado.status_code == 200:
                            print(f"{accion} registrada correctamente en la API.")
                        else:
                            print(f"Error al registrar {accion} en la API:", resultado.status_code)
                    else:
                        print("Los rostros no coinciden.")
                        led_verde.off()
                        led_rojo.on()
                else:
                    print("No se pudo capturar un rostro.")
                    led_verde.off()
                    led_rojo.on()
            else:
                print("No se encontró imagen para el usuario en la API.")
                led_verde.off()
                led_rojo.on()
        else:
            print("Error al obtener la información del usuario:", respuesta_usuario.status_code)
            led_verde.off()
            led_rojo.on()
    finally:
        led_verde.off()
        led_rojo.off()

# Bucle principal
try:
    print("Iniciando el programa... (Presiona CTRL+C para salir)")
    while True:
        leer_rfid_y_comparar_rostro()  # Esto registrará una entrada
        time.sleep(5)  # Ajusta este tiempo según sea necesario
except KeyboardInterrupt:
    print("Interrupción por el usuario, cerrando el programa.")
finally:
    led_verde.off()
    led_rojo.off()
