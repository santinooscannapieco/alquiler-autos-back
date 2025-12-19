# 🚗 ALQUILER AUTOS

Aplicación web para la gestión de alquiler de autos.  
Permite a los usuarios registrarse e iniciar sesión, explorar autos disponibles según fecha, categoría o nombre, realizar y editar reservas, y agregar autos a una lista de favoritos.

Los administradores pueden gestionar autos, categorías, usuarios y reservas, además de visualizar un dashboard con métricas clave del proyecto, como cantidad de reservas, total recaudado, autos más reservados y días con mayor demanda.

---

## ⚙️ Tecnologías

### 🖥️ Frontend
- React 19 + Vite
- Tailwind CSS
- Material UI (MUI)
- React Router
- Recharts (gráficos)
- React Day Picker
- Day.js / date-fns (manejo de fechas)
- SweetAlert2
- ESLint

### ☕ Backend
- Java 21
- Spring Boot 3.2.1
- Spring Web (API REST)
- Spring Data JPA (Hibernate)
- Spring Security
- JWT (JSON Web Tokens)
- H2 Database (base de datos utilizada en desarrollo)
- PostgreSQL (configuración opcional para entorno productivo)
- Cloudinary (gestión de imágenes)
- Java Mail Sender (envío de emails)
- Swagger / OpenAPI
- Lombok

---

## 🚀 Instalación local

## 📦 Estructura del proyecto

Este proyecto se encuentra dividido en dos repositorios independientes:

- **Frontend:** aplicación desarrollada en React
- **Backend:** API REST desarrollada con Spring Boot

Ambos repositorios forman parte del mismo proyecto y deben ejecutarse en conjunto para su correcto funcionamiento.

### 🔗 Repositorios
- Frontend: https://github.com/santinooscannapieco/alquiler-autos.git
- Backend: https://github.com/santinooscannapieco/alquiler-autos-back.git

---

### 🧩 Requisitos previos
- Node.js 18 o superior
- Java 21
- Maven
- Git

---

### Clonar los repositorios
```bash
git clone https://github.com/santinooscannapieco/alquiler-autos-back.git
git clone https://github.com/santinooscannapieco/alquiler-autos.git
```
---

### 📁 Backend (`/backend`)

#### Correr el backend:
Entrar al directorio del backend y ejecutar la aplicación:
```
cd alquiler-autos-back
./mvnw spring-boot:run
```
> El Backend estará disponible en `http://localhost:8080`

El backend utiliza la base de datos H2 en memoria, por lo que no requiere ninguna configuración adicional para ejecutarse.

#### Documentación de la API (Swagger):
http://localhost:8080/swagger-ui/index.html

#### Consola H2 (opcional):
- URL: http://localhost:8080/h2-console
- JDBC URL: jdbc:h2:mem:testdb
- Usuario: sa
- Contraseña: (vacía)


### 🖼️ Frontend (`/frontend`)

#### 📦 Instalar dependencias
```bash
cd alquiler-autos
npm install
```

#### ▶️ Ejecutar el frontend
```
npm run dev
```
>  🌐 La aplicación estará disponible en `http://localhost:5173`


### 🔐 Configuración adicional (opcional)

Algunas funcionalidades del proyecto utilizan integraciones externas:
- Autenticación JWT
- Envío de emails
- Subida de imágenes a Cloudinary

Estas integraciones se configuran mediante variables de entorno y no son obligatorias para ejecutar la aplicación en modo local básico.

---

## 📬 Endpoints (API REST)

### 🔐 Autenticación
| Método | Endpoint	        | Descripción	            |  Auth
|----------------------------------------------------------------|
| POST   | /auth/register	| Registro de usuario       |	❌
| POST   | /auth/login	    | Login y generación de JWT	|   ❌

### 🚗 Autos
| Método | Endpoint	          | Descripción	                  |  Auth
|----------------------------------------------------------------------|
| GET	 |  /autos	          | Listado de autos disponibles  |   ❌
| GET	 |  /autos/{id}	      | Detalle de un auto	          |   ❌
| POST	 |  /autos	          | Crear nuevo auto	          |   ✅ (ADMIN)
| PUT	 |  /autos/{id}	      | Editar auto	                  |   ✅ (ADMIN)
| DELETE |	/autos/{id}	      | Eliminar auto	              |   ✅ (ADMIN)
| GET    |  /autos/filtros    | Buscar autos por filtros (nombre, categoría, fechas) | ❌ |

### 📂 Categorías
| Método | Endpoint	          | Descripción	                |  Auth
|-------------------------------------------------------------------|
| GET	 |   /categorias	  | Listado de categorías	    |   ❌
| POST	 |   /categorias	  | Crear categoría	            |   ✅ (ADMIN)
| PUT	 |   /categorias/{id} | Editar categoría	        |   ✅ (ADMIN)
| DELETE |   /categorias/{id} | Eliminar categoría	        |   ✅ (ADMIN)

### 📅 Reservas
| Método | Endpoint	          | Descripción	                       |  Auth
|---------------------------------------------------------------------------|
| POST	 | /reservas	      | Crear reserva	                   |   ✅
| GET	 | /reservas/usuario  | Ver reservas del usuario logueado  |   ✅
| PUT	 | /reservas/{id}	  | Editar reserva	                   |   ✅
| DELETE | /reservas/{id}	  | Cancelar reserva	               |   ✅

### ❤️ Favoritos
| Método | Endpoint	            | Descripción	                       |  Auth
|-------------------------------------------------------------------------------|
| POST	 | /favoritos/{autoId}	| Agregar auto a favoritos	           |   ✅
| GET	 | /favoritos	        | Listar autos favoritos del usuario   |   ✅
| DELETE | /favoritos/{autoId}	| Eliminar auto de favoritos	       |   ✅

### 📘 Documentación interactiva (Swagger)
> 📌 Swagger Docs disponible en: `http://localhost:8080/swagger-ui/index.html`

Desde allí es posible:
- probar los endpoints
- ver los modelos de datos
- autenticarte con JWT

---

## 🔐 Variables de entorno

Para habilitar funcionalidades opcionales (JWT, Mail, Cloudinary),
se deben configurar las siguientes propiedades en `application.properties`:

- jwt.secret
- cloudinary.cloud-name
- cloudinary.api-key
- cloudinary.api-secret
- spring.mail.username
- spring.mail.password

⚠️ Las credenciales no están incluidas en el repositorio por seguridad.

---

## 🗂️ Diagrama de Entidades (ER)

![Diagrama de la DB](/src/assets/dbdiagram.png)

> Creado con [https://dbdiagram.io](https://dbdiagram.io)

---

## 🧪 Tests

El proyecto incluye algunos tests unitarios e integración, principalmente para los endpoints del backend con Spring Boot.

Ejemplo de cómo correrlos:
```bash
# Backend (Spring Boot)
./mvnw test
```

Actualmente se encuentran tests para:
- Endpoints de Categorías (GET /categorias/{id}, POST /categorias)
- Se pueden agregar más tests para autos, reservas y usuarios en el futuro.

---

## ☁️ Deploy

Actualmente el proyecto se ejecuta en entorno local.
Se encuentra preparado para ser desplegado utilizando:
- Backend: Railway / Render
- Frontend: Vercel / Netlify

---

## 🎬 Demo

[![Ver Demo como usuario](/src/assets/demo-thumbnail-user.png)](https://youtu.be/bPYr7G73wU4)

[![Ver Demo como administrador](/src/assets/demo-thumbnail-admin.png)](https://youtu.be/pW7iiKTNuBw)

---

## 👤 Autor

- [Santino Scannapieco](https://github.com/santinooscannapieco)

---

## 📞 Soporte

- 📧 Email: santinoscannapieco@gmail.com