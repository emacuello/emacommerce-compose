# Emacommerce

## Diagrama

![Diagrama](https://res.cloudinary.com/dxrjz4ycj/image/upload/f_auto,q_auto/byl9xo7p9xesg3fyurbf)

## Description

Se ha usado Arquitectura Hexagonal + Vertical Slicing para el diseño de la aplicación.
<br/>
Las tecnologías usadas para este proyecto son: NestJS como Framework, TypeScript y Node como entorno de ejecución.
<br/>
Se ha usado Arquitectura de Microservicios para el desarrollo de la aplicación.
<br/>
Para la mensajería se ha usado RabbitMQ, Nats, Kafka, MQTT y gRPC.
<br/>
Para la base de datos se ha usado DynamoDB, SQLite, MySQL y MariaDB.
<br/>
Para el despliegue se ha usado Docker y Docker Compose.
<br/>
Se ha usado Vault para la gestión de credenciales.

## Requisitos

-   Windows + Docker Desktop + WSL2 + 16GB RAM o Linux/Mac + 8GB RAM + Docker

## Instalación

1.  Clonar el repositorio
2.  Eliminar el archivo `.env.example` y reemplazarlo con el archivo `.env` cambiar las variables de entorno de ser necesario
3.  Eliminar el archivo `secrets.env.example` y reemplazarlo con el archivo `secrets.env`. Este archivo contiene las credenciales de los servicios que se utilizan en el proyecto, las cuales son proporcionadas por Vault, las mismas se encuentran en el archivo `env-vault.json`, modificarlas en función de la configuración que se desee.
4.  Ejecutar el comando `docker-compose up` en la carpeta del proyecto. Esto iniciará los servicios que se encuentran en el archivo `docker-compose.yml`
