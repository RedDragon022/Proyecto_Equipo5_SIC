from tkinter import *
import requests
import os
import cv2
from matplotlib import pyplot as plt
from mtcnn.mtcnn import MTCNN
from gpiozero import Device, LED
from gpiozero.pins.mock import MockFactory

# Configuramos gpiozero para usar el backend de simulación
Device.pin_factory = MockFactory()

# Creamos los LEDs simulados
led_rojo = LED(17)
led_verde = LED(27)




#------------------------------Clase para enviar datos a la api-------------------------------------------------


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

    def registrar_entrada(self, usuario_id):
        endpoint = "/api/Attendance/register-entry"
        params = {'userId': usuario_id}  # El userId es un parámetro de consulta según la documentación
        return self.post_request(endpoint, params=params)

    def registrar_salida(self, usuario_id):
        endpoint = "/api/Attendance/register-exit"
        params = {'userId': usuario_id}  # Asumiendo que este también es un parámetro de consulta
        return self.post_request(endpoint, params=params)

    def obtener_lista_asistencias(self, usuario_id):
        endpoint = "/api/Attendance/get-list-attendances"
        params = {'userId': usuario_id}  # Asumiendo que este también es un parámetro de consulta
        return self.get_request(endpoint, params=params)

    def crear_usuario(self, datos_usuario):
        endpoint = "/api/User/create"
        # Aquí no se usan parámetros de consulta, se espera un JSON en el cuerpo de la solicitud
        return self.post_request(endpoint, data=datos_usuario)

    def obtener_usuario(self, email_o_numero_empleado, password):
        endpoint = "/api/User/get"
        params = {'EmailOrEmployeeNumber': email_o_numero_empleado, 'Password': password}
        return self.get_request(endpoint, params=params)

    

api = TeachersGuardAPI("https://teachersguard.azurewebsites.net")

#--------------------------- Función para registrar el usuario con reconocimiento facial ----------------------
def registro_facial():
    global usuario_entrada  # Globalizamos la variable para usarla en la función capturar_rostro
    pantalla1 = Toplevel(pantalla)
    pantalla1.title("Registro")
    pantalla1.geometry("300x250")

    Label(pantalla1, text = "Ingrese su nombre de usuario:").pack()
    usuario = StringVar()
    usuario_entrada = Entry(pantalla1, textvariable = usuario)
    usuario_entrada.pack()
    Label(pantalla1, text = "").pack()
    Button(pantalla1, text = "Registrar con Foto", width = 15, height = 1, command = capturar_rostro).pack()

#-------------------------- Función para capturar el rostro y guardar la imagen -------------------------------
def capturar_rostro():
    usuario_img = usuario_entrada.get()
    if usuario_img:
        cap = cv2.VideoCapture(0)
        detector = MTCNN()

        while True:
            ret, frame = cap.read()
            if not ret:
                break

            rostros = detector.detect_faces(frame)
            for rostro in rostros:
                x, y, ancho, alto = rostro['box']
                cv2.rectangle(frame, (x, y), (x + ancho, y + alto), (0, 255, 0), 2)

            cv2.imshow('Captura de Rostro', frame)

            if cv2.waitKey(1) == 27:
                break

        cv2.imwrite(usuario_img + ".jpg", frame)
        cap.release()
        cv2.destroyAllWindows()

#-------------------------- Función para el inicio de sesión facial --------------------------------------------
def login_facial():
    global usuario_entrada2

    pantalla2 = Toplevel(pantalla)
    pantalla2.title("Login")
    pantalla2.geometry("300x250")

    Label(pantalla2, text="Ingrese su nombre de usuario:").pack()
    verificacion_usuario = StringVar()
    usuario_entrada2 = Entry(pantalla2, textvariable=verificacion_usuario)
    usuario_entrada2.pack()
    Label(pantalla2, text="").pack()
    Button(pantalla2, text="Iniciar Sesión con Foto", width=20, height=1, command=lambda: verificar_rostro(verificacion_usuario.get())).pack()
     
    
#-------------------------- Función para verificar el rostro para el inicio de sesión -------------------------
def verificar_rostro(usuario_login):
    if usuario_login:
        cap = cv2.VideoCapture(0)
        detector = MTCNN()

        while True:
            ret, frame = cap.read()
            if not ret:
                break

            rostros = detector.detect_faces(frame)
            for rostro in rostros:
                x, y, ancho, alto = rostro['box']
                cv2.rectangle(frame, (x, y), (x + ancho, y + alto), (0, 255, 0), 2)

            cv2.imshow('Verificación de Rostro', frame)

            if cv2.waitKey(1) == 27:
                break

        cv2.imwrite(usuario_login + "LOG.jpg", frame)
        cap.release()
        cv2.destroyAllWindows()
        comparar_rostros(usuario_login)

#-------------------------- Función para comparar los rostros --------------------------------------------
def comparar_rostros(usuario_login):
    rostro_reg = cv2.imread(usuario_login + ".jpg", 0)
    rostro_log = cv2.imread(usuario_login + "LOG.jpg", 0)

    orb = cv2.ORB_create()
    kpa, descr_a = orb.detectAndCompute(rostro_reg, None)
    kpb, descr_b = orb.detectAndCompute(rostro_log, None)

    comp = cv2.BFMatcher(cv2.NORM_HAMMING, crossCheck=True)
    matches = comp.match(descr_a, descr_b)

    regiones_similares = [i for i in matches if i.distance < 70]
    if len(matches) == 0:
        similitud = 0
    else:
        similitud = len(regiones_similares) / len(matches)

    if similitud >= 0.75:
        led_verde.on()
        led_rojo.off()
        print("Inicio de sesión exitoso. Bienvenido:", usuario_login)
        # Registro de la entrada sin necesidad de salon o hora, ya que no se usan para este endpoint
        resultado = api.registrar_entrada(usuario_login)
        if resultado.status_code == 200:
            print("Entrada registrada correctamente en la API.")
        else:
            print("Error al registrar entrada en la API:", resultado.status_code)
    else:
        led_verde.off()
        led_rojo.on()
        print("Fallo en la verificación del rostro.")

#------------------------- Función principal de la interfaz -----------------------------
def pantalla_principal():
    global pantalla
    pantalla = Tk()
    pantalla.geometry("300x250")
    pantalla.title("Sistema de Reconocimiento Facial")
    Label(text="DETECTOR FACIAL", bg="gray", width="300", height="2", font=("Verdana", 13)).pack()

    Label(text="").pack()
    Button(text="Registrar con Foto", height="2", width="30", command=registro_facial).pack()
    Label(text="").pack()
    Button(text="Iniciar Sesión con Foto", height="2", width="30", command=login_facial).pack()

    pantalla.protocol("WM_DELETE_WINDOW", on_closing)  # Vincula la función on_closing al evento de cierre de la ventana

    pantalla.mainloop()


# Función para cerrar la aplicación
def on_closing():
    led_verde.off()
    led_rojo.off()
    pantalla.destroy()

pantalla_principal()
