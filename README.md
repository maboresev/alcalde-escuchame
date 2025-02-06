# Proyecto Alcalde Escúchame
## Requisitos previos (solo se tiene que hacer una vez)
En mi caso, las versiones instaladas son las siguientes:

docker --version
Docker version 20.10.16, build aa7e414

docker-compose --version
Docker Compose version v2.6.0

Lanzaremos el comando: 
docker network create staging --driver bridge --subnet=172.21.0.0/24 --gateway=172.21.0.1

Descomprimimos los archivos files.zip y database.zip en la carpeta raíz, y accedemos al docker de la base de datos para crear nuestra base de datos para el proyecto. Los datos de la base de datos están en files/settings.php, y podemos cambiarlos a nuestro antojo. Se trata de una base de datos mysql v.8, por lo que accederemos por línea de comandos o a través de un IDE especializado como dbeaver o mysqlworkbench para generar nuestro entorno. El acceso se realiza con root | root como usuario|contraseña.

Por último, vinculamos nuestro entorno en nuestro fichero hosts para facilitar nuestro trabajo local. En linux se encuentra en etc/hosts, cambiamos sus permisos con 'chmod 777 /etc/hosts' y añadimos la línea: 
172.21.0.40 local.alcalde

## Ejecutar el instalador 
Desde la raíz del código, ejecutamos:
docker-compose up -d

Esto nos levanta los entornos. A partir de ahí, debemos realizar un composer install para la instalación de paquetes en el sistema. Para ello, se aporta el fichero Makefile, que da una guía de comandos para su ejecución. Es necesario instalar MAKE en la máquina y ejecutar los comandos con make {command}, por ejemplo, en nuestro caso, para realizar este composer install ejecutamos make composer_install.

Aplicamos permisos con make fix_permissions, y ya tenemos nuestro drupal funcional en nuestro local. Para acceder, simplemente ponemos nuestra url en nuestro navegador definida previamente:
local.alcalde
