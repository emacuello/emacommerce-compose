# Emacommerce

Ecommerce realizado como aplicación distribuida con NestJS y TypeScript en el entorno de Docker.

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
<br/>
Se ha usado Prometheus, cAdvisor, y Grafana para la monitorización de la aplicación.
<br/>
Se ha usado Loki y Promtail para la gestión de logs.
<br/>
Se ha usado Nginx como proxy inverso para el despliegue de la aplicación en docker.
<br/>

## Requisitos

-   Windows + Docker Desktop + WSL2 + 16GB RAM (minimo 3GB destinado a WSL) o Linux/Mac + 8GB RAM + Docker

## Instalación

1.  Clonar el repositorio
2.  Eliminar el archivo `.env.example` y reemplazarlo con el archivo `.env`, cambiar las variables de entorno de ser necesario
3.  Eliminar el archivo `secrets.env.example` y reemplazarlo con el archivo `secrets.env`. Este archivo, en principio vacio, contendrá las credenciales de los servicios que se utilizan en el proyecto, las cuales son proporcionadas por Vault luego de su ejecución, las mismas se encuentran en el archivo `env-vault.json`, modificarlas en función de la configuración que se desee antes de ejecutar el comando `docker-compose up`
4.  Ejecutar el comando `docker-compose up` en la carpeta del proyecto. Esto iniciará los servicios que se encuentran en el archivo `docker-compose.yml`

## Acceso a los servicios

Para acceder a los servicios que se encuentran en el entorno de docker, se debe acceder a los siguientes puertos:

-   `http://localhost` Nginx - app
-   `http://localhost:3000` Grafana
-   `http://localhost:9090` Prometheus
-   `http://localhost:8080` cAdvisor
-   `http://localhost:3100` Loki
-   `http://localhost:9000` Kafdrop
-   `http://localhost:15672` RabbitMQ
-   `http://localhost:4222` NATS

## Monitorización

1.  Abrir el navegador en `http://localhost:3000` para acceder a la aplicación de grafana
2.  Ingresar con el usuario `admin` y la contraseña `admin` que viene por defecto, y darle a 'Skip' en caso de no querer cambiar la contraseña
3.  Ir a `Configuration` -> `Data Sources`
4.  Añadir una nueva fuente de datos de `Prometheus` que apunte a `http://prometheus:9090`
5.  Añadir una nueva fuente de datos de `Loki` que apunte a `http://loki:3100`
6.  Ir a `Dashboard` -> `Manage` -> `Import`
7.  Elegir una fuente de datos, para este caso yo uso una para cAdvisor con el id `19792` y una para el Api Gateway con el id `11159`, en caso correcto, verá que aparece un mensaje de error en la parte inferior de la pantalla, y en la parte superior verá un mensaje de advertencia, en ambos casos, haga clic en el botón `Import` y espere a que se complete la importación
8.  Una vez que se haya completado la importación, haga clic en el botón `Explore` y verá la lista de dashboards que se han importado
9.  Haga clic en el botón `Home` y verá la lista de dashboards que se han importado
10. Para visualizar los logs de los contenedores, ir a `Explore` -> `Label Browser` y seleccionar el contenedor que desee ver los logs de, en mi caso `/emacommerce-api-gateway-1` y darle a `Show logs` en la parte inferior izquierda de la pantalla, si todo ha ido bien, al hacer scroll se veran los logs de la aplicación, si no, haga clic en el botón `Refresh` para actualizar los logs

## Opcional

El Nginx tiene configurado para poder visualizar Grafana gracias al balanceo de carga segun el DNS. En mi caso utilicé DuckDNS, el cual me da un subdominio gratuito que apunta a mi IP. Puedes utilizar cualquier servicio de DNS gratuito, pero es importante que el subdominio que tengas configurado en Nginx apunte a la IP de tu servidor, en mi caso es `emacommerce.duckdns.org` para la aplicación principal y `grafana-emacommerce.duckdns.org` para Grafana, puedes cambiarlo segun tu configuración. Los dos DNS apuntan a la misma IP y Nginx se encarga de redireccionar las peticiones a la aplicación a la que corresponda. Todo configurable en el archivo `nginx.conf`. El puerto 80 tiene que estar habilitado en el firewall de tu servidor.

## Autor

-   [Emanuel Cuello](https://github.com/emacuello)
