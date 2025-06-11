Este es un servicio complementario para el proyecto FileGator de alcalbg (https://github.com/filegator/filegator). Para que este servicio funcione, necesitarás tener el proyecto FileGator instalado y el servidor SSH configurado para permitir conexiones de root mediante clave pública.

Una vez que tengas todo esto funcionando, tendrás que ejecutar algunos comandos en tu terminal de Linux como root:

apt install transmission-cli (como sudo)

cd /etc/

git clone "https://github.com/eduardogarcia-lab/etc-file_admin"

mv etc-file_admin file_admin

cd file_admin

bash install (importante como root)

Si tu instalación de FileGator está en otro directorio, deberás modificar las rutas en el archivo install para adaptarlas a tu entorno.

El uso es bastante sencillo: solo necesitas copiar el archivo plantilla_torrent.txt al directorio que quieras compartir. 

Una vez esté allí, desde la interfaz gráfica de FileGator, haz clic sobre el archivo y edítalo. Verás una entrada llamada "Equipos:", en la que debes escribir los grupos de ordenadores que deben descargar el contenido, como por ejemplo A1* (para referirse a todo el primer piso), A11* (el aula 11), A11PC1* (primera fila del aula 11), A11PC11 (el equipo 11 del aula 11) y especificar si la transmision esta activa "Transmision: activa/inactiva".

Una vez has elegido que equipos lo van a descargar, lo renombras a torrent.txt y en la siguiente ejecucion el servicio lo encontrará, convertira el contenido del directorio en el que este en torrent y la proxima vez que los clientes se enciendan descargarán el contenido y lo compartirán.
