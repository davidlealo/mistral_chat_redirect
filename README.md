# Mistral Chat Redirect 🚀

Este proyecto es una aplicación Flutter que permite a los usuarios interactuar con un modelo de lenguaje a través de un chat y navegar a distintas pantallas según las respuestas recibidas. Utiliza la API de **Mistral AI** para generar respuestas contextuales.

---

## **Características**

- **Interfaz de Chat**: Permite interactuar con la API de Mistral AI.
- **Redirección Automática**: Según la respuesta del modelo, el usuario navega a pantallas específicas.
- **Menú de Inicio**: Pantalla inicial con opciones de navegación y acceso al chat.
- **Gestión de Variables Seguras**: Clave API gestionada mediante variables de entorno.

---

## **Requisitos Previos**

Antes de ejecutar el proyecto, asegúrate de tener instalados:

- **Flutter SDK** (3.x o superior)
- **Dart SDK** (v2.17+)
- Una **clave API** válida de [Mistral AI](https://mistral.ai).

---

## **Instalación**

1. **Clona el repositorio**:

```bash
   git clone https://github.com/davidlealo/mistral_chat_redirect.git
   cd mistral_chat_redirect
```

## **Configura las Variables de Entorno**

2. **Crea el archivo `.env`** en la carpeta `assets/`:

```bash
   touch assets/.env
```
## **Configura las Variables de Entorno**

3. **Agrega tu clave API** en el archivo `.env`:

```env
   MISTRAL_API_KEY=tu_clave_api_aqui
```

4. **Declara el archivo `.env` en `pubspec.yaml`**:

   Abre el archivo `pubspec.yaml` y asegúrate de incluir la referencia al archivo `.env` en la sección `assets`:

```yaml
   flutter:
     assets:
       - assets/.env
```

5. **Instala las dependencias**:

   Ejecuta el siguiente comando para instalar todas las dependencias requeridas:

```bash
   flutter pub get
```

---

## **Ejecución del Proyecto**

1. **Ejecuta el proyecto** en un dispositivo o emulador. Puedes hacerlo con el siguiente comando:

```bash
   flutter run -d chrome
```

   - Reemplaza `chrome` con el dispositivo o emulador en el que deseas probar, como `android` o `ios`.

2. **Navega por la aplicación**:

   - Desde el **menú principal**, accede al chat o a la pantalla de inicio de sesión.
   - Interactúa con el chat y verifica cómo navega a las pantallas correspondientes según las respuestas.

---

## **Pantallas Principales**

1. **Menú Principal**: Permite acceder al chat y a la pantalla de inicio de sesión.
2. **Chat**: Interfaz para interactuar con la API de Mistral.
3. **Administrador Inteligente de Colegios**: Pantalla para la opción de administración.
4. **Desarrollo Proyectos ABP**: Pantalla para la opción de proyectos ABP.
5. **Evento ABP**: Pantalla para la opción de eventos.

---

## **Configuración de la API**

La aplicación se comunica con la API de Mistral AI para procesar las respuestas. Asegúrate de que la configuración en `api_service.dart` sea correcta:

```dart
   const String apiUrl = 'https://api.mistral.ai/v1/chat/completions';
   final String apiKey = dotenv.env['MISTRAL_API_KEY'] ?? '';
```
- **`apiUrl`**: Especifica la URL del endpoint de la API de Mistral.
- **`apiKey`**: Cargada desde el archivo `.env`.

---

## **Dependencias Principales**

El proyecto utiliza las siguientes dependencias:

1. **flutter_dotenv**: Para cargar variables de entorno desde un archivo `.env`.
2. **http**: Para realizar solicitudes HTTP a la API de Mistral.

---

## **Licencia**

Este proyecto está bajo la licencia **MIT**.

---

## **Contacto**

Si tienes preguntas o sugerencias, puedes contactarme:

- **Email**: [davidlealo@gmail.com](mailto:davidlealo@gmail.com)
- **GitHub**: [https://github.com/davidlealo](https://github.com/davidlealo)
- **LinkedIn**: [https://www.linkedin.com/in/davidlealo/](https://www.linkedin.com/in/davidlealo/)

---

¡Gracias por utilizar este proyecto! Si encuentras problemas, abre un **issue** o envía una **Pull Request**. 😊
