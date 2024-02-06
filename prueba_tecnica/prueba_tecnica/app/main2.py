import tkinter as tk
from tkinter import ttk
import requests

def realizar_solicitud():
    try:
        # Obtener los valores de los campos de entrada
        client_id = int(client_id_entry.get())
        fecha_envio = fecha_envio_entry.get()
        email_body = email_body_entry.get("1.0", tk.END).strip()

        # Realizar la solicitud a la API
        url = "http://localhost:5000/classify-email"
        payload = {"client_id": client_id, "fecha_envio": fecha_envio, "email_body": email_body}
        response = requests.post(url, json=payload)

        # Mostrar la respuesta en la interfaz gráfica
        respuesta_label.config(text=response.json()["razon"])

    except Exception as e:
        respuesta_label.config(text=str(e))

# Crear la ventana principal
ventana = tk.Tk()
ventana.title("Interfaz Gráfica para Clasificación de Correos Electrónicos")

# Crear y posicionar los elementos en la ventana
client_id_label = ttk.Label(ventana, text="Client ID:")
client_id_entry = ttk.Entry(ventana)

fecha_envio_label = ttk.Label(ventana, text="Fecha de Envío:")
fecha_envio_entry = ttk.Entry(ventana)

email_body_label = ttk.Label(ventana, text="Cuerpo del Correo:")
email_body_entry = tk.Text(ventana, height=5, width=30)

solicitar_button = ttk.Button(ventana, text="Realizar Solicitud", command=realizar_solicitud)

respuesta_label = ttk.Label(ventana, text="Respuesta:")

# Posicionar los elementos en la cuadrícula
client_id_label.grid(row=0, column=0, padx=10, pady=5, sticky="E")
client_id_entry.grid(row=0, column=1, padx=10, pady=5)

fecha_envio_label.grid(row=1, column=0, padx=10, pady=5, sticky="E")
fecha_envio_entry.grid(row=1, column=1, padx=10, pady=5)

email_body_label.grid(row=2, column=0, padx=10, pady=5, sticky="E")
email_body_entry.grid(row=2, column=1, padx=10, pady=5)

solicitar_button.grid(row=3, column=0, columnspan=2, pady=10)

respuesta_label.grid(row=4, column=0, columnspan=2, pady=5)

# Iniciar el bucle principal de la interfaz gráfica
ventana.mainloop()

if __name__ == '__main__':
    realizar_solicitud()