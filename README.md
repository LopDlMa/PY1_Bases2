# PY1_Bases2

Como nota antes de empezar: una vez se empiece a hacer la manipulación de sentencias, es preferible hacer <code> commit </code> al terminar o los datos puede que no perduren
<br>
<br>
## Instalación Oracle en Instancia GCP con Centos 7 y conexión a SQL Developer

Para el desarrollo de este proyecto, se necesita una base de datos Oracle. La version de dicha base de datos será la 21c y estará en una instancia en la nube de Google (Google Cloud Computing [GCP])-

Para realizar la instalación se requiere crear una máquina virtual como la siguiente: 

![Instancia](/Images/Instalacion/gcp0.png)

![Instancia](/Images/Instalacion/gcp.png)

Estas instancias poseen diferentes maneras de conexión, entre ellas la conexión SSH el cual está integrado con el servicio, si se desea conectar con otro tipo de software, por ejemplo Termius; se debe generar una llave por medio de keygen. En linux se usa el siguiente comando : 
<code>ssh-keygen -t rsa -f ~/.ssh/NOMBRELLAVE -C usuaio -b 2048
</code>


Lo cual crea 2 archivos, uno de los cuales es .pub y bajo la pestaña de edición de la máquina virtual se agrega en :
![Instancia](/Images/Instalacion/ssh.png)

Para la conexión y acceso a la instancia se necesitan 2 configuraciones, la primera es una regla de firewall donde permite la entrada y salida de trafico desde cualquier IP hacia cualquier puerto: 

![Instancia](/Images/Instalacion/fire.png)

Y la segunda (opcional) es configurar una IP estática si no se desea configurar multiples veces la IP de conexión en las demás herramientas:
![Instancia](/Images/Instalacion/static.png)

Al hacer click en Crear Dirección IP, la IP actual de la máquina será reservada y asignada a la instancia como dirección IP estática. 

<br/>
Una vez todo esto ha sido configurado se puede proceder a la instalación de Oracle:

1.- Instalar los siguientes paquetes: 
<code>sudo yum install unzip libaio bc flex wget</code>
![Instancia](/Images/Instalacion/i1.jpeg)

2.- Crear archivo Swap de 2GB:
<code>sudo dd if=/dev/zero of=/mnt/swapfile bs=1024 count=2097152 </code>

![Instancia](/Images/Instalacion/i2.jpeg)


3.- Dar permisos al archivo de swap uusando el comando sudo:
<code> sudo chmod 600 /mnt/swapfile</code>


4.- Setear el archivo para swap usando el comando mkswap:
<code>sudo mkswap /mnt/swapfile </code>
<br/>

5.- Habilitar el archivo de swap para ser reconocido como la swap del sistema:
<code> swapon /mnt/swapfile</code>

![Instancia](/Images/Instalacion/i3.jpeg)


6.- Habilitar el archivo swap para que este inicie en a la hora de encender la instancia, para esto se hace uso de nano y se agrega la siguiente linea a /etc/fstab:
<code> /mnt/swapfile swap swap defaults 0 0</code>

![Instancia](/Images/Instalacion/i4.jpeg)
![Instancia](/Images/Instalacion/i5.jpeg)

7.- Descargar el archivo de pre instalación de oracle haciendo uso de los siguientes comandos: 
<code><br>  curl -o oracle-database-preinstall-21c-1.0-1.el7.x86_64.rpm https://yum.oracle.com/repo/OracleLinux/OL7/latest/x86_64/getPackage/oracle-database-preinstall-21c-1.0-1.el7.x86_64.rpm <br>
 yum -y localinstall oracle-database-preinstall-21c-1.0-1.el7.x86_64.rpm</code>

![Instancia](/Images/Instalacion/i6.jpeg)

<br>
8.- Descargar el archivo correspondiente de Oracle 21c XE:
<code>wget https://download.oracle.com/otn-pub/otn_software/db-express/oracle-database-xe-21c-1.0-1.ol7.x86_64.rpm </code>

![Instancia](/Images/Instalacion/i8.jpeg)

![Instancia](/Images/Instalacion/i7.jpeg)
<br>
9.- Realizar la instalación:
<code>  yum -y localinstall oracle-database-xe-21c-1.0-1.ol7.x86_64.rpm</code>

![Instancia](/Images/Instalacion/i9.jpeg)
<br>
10.- configurar Oracle, este password es el usado en las diferentes seciones marcadas :
<code> /etc/init.d/oracle-xe-21c configure</code>

![Instancia](/Images/Instalacion/i10.jpeg)
11.- Si se requiere iniciar la instancia nuevamente :
<code> sudo /etc/init.d/oracle-xe-21c start</code>

![Instancia](/Images/Instalacion/i11.jpeg)

## Conexión a Oracle 21c usando SQL Developer o DataGrid
una vez levantada la base de datos solo será necesaria la informacion de IP, puerto y tipo

![Instancia](/Images/Instalacion/conect.jpeg)

![Instancia](/Images/Instalacion/dg.png)

-----

## Parte 1: Usuarios y  Permisos

En la siguiente sección se basa en la creación de usuarios (los cuales en ORACLE pueden verse como esquemas) y sus privilegios.

El siguiente modelo será usado para este ejercicio: 

![i](Images/E-R1/C1.png)

Primero, es necesario crear un TableSpace, el cual es el encargado de almacenar tablas, indices, objetos y datos. Organiza la información en grupos de almacenamiento lógicos que se relaciona a la informacion almacenada en un sistema. 

Y esto se logra con el siguiente comando:
<code>CREATE TABLESPACE [Nombre] DATAFILE "[nombre_datafile].tbs" SIZE [tamaño_inicio] AUTOEXTEND ON MAXSIZE [max_size]</code>

Donde la propiedad de Autoextend permite que el tamaño inicial del archivo se entienda a su máximo una sola vez.



![i](Images/Parte1/c1.jpg)
<em> <code>CREATE TABLESPACE ELECCIONESTBS DATAFILE "ELECCIONESDTF.tbs" SIZE 200M AUTOEXTEND ON MAXSIZE 500M </code></em>

Ahora se necesita un usuario para almacenar la base de datos, haciendo uso del siguiente comando

<code>CREATE USER [ususario] IDENTIFIED BY [password] DEFAULT TABLESPACE [tablespace] TEMPORARY TABLESPACE Temp ACCOUNT UNLOCK </code>

+ Nota: Si no se especifica el parámetro <code>PROFILE</code> , este será <code>DEFAULT </code> por defecto.
+ Unlock sirve para que el ususario pueda cambiar su contraseña a la hora de volver a loguearse

Ahora se procede a otorgarle permisos de DBA al usuario creado anteriormente: <br/>
<code>GRANT "DBA" TO [usuario] WITH ADMIN OPTION </code>

Finalmente se le conceden permisos para poder crear una sesión al usuario: <br>
<code>GRANT ALTER SESSION TO [usuario] WITH ADMIN OPTION</code>

El resultado final sería el siguiente: 

<code>CREATE USER ELECCIONES IDENTIFIED BY [password] DEFAULT TABLESPACE ELECCIONESTBS TEMPORARY TABLESPACE Temp ACCOUNT UNLOCK  <BR> GRANT "DBA" TO ELECCIONES WITH ADMIN OPTION <BR>GRANT ALTER SESSION TO ELECCIONES WITH ADMIN OPTION</code>
<br>
<br>

  ![i](Images/Parte1/c2.jpeg)
  <br>
  <em>Al hacer SELECT sobre la tabla que que contiene las tablespaces, podemos ver la información de la que acabamos de crear (6)</em>
<br>
<br>
Finalmente se procede a crear la conección con el usuario creado.

![i](Images/Parte1/f.png)

### Creación de Datos

Dada la [configuración](Carga/Corregido.sql)  se procede a ser ejecutada en "ELECCIONES" 

  ![i](Images/Parte1/c10.jpeg)

  ![i](Images/Parte1/c13.jpeg)

Ahora se puede proseguir con la creación de usuarios y sus privilegios siguiendo lo siguiente:

+ Creación de Usuarios
  Se requieren los siguientes usuarios: 
  

| Usuario | Contraseña |
|---------|-------------|
| guest1  | guest1      |
| guest2  | guest2      |
| guest3  | guest3      |
| mesa1   | mesa1       |
| mesa2   | mesa2       |
| mesa3   | mesa3       |
| mesa4   | mesa4       |
| it1     | it1         |
| it2     | it2         |
| admin1  | admin1      |
| admin2  | admin2      |
  
La manera de crear nuevos usuarios para la tablespace es la siguiente:
<br>
<br>
<code>CREATE USER [usuario] IDENTIFIED BY [password] DEFAULT TABLESPACE
    ELECCIONESTBS TEMPORARY TABLESPACE  TEMP ACCOUNT UNLOCK ;
 </code>

   ![i](Images/Parte1/c4.jpeg)
   <br>

![i](Images/Parte1/c5.jpeg)
<br>
<em>Al hacer select sobre la tabla de usuarios podemos ver los usuarios creados </em>


+ Privilegios de cada Usuario
  
  Se requieren permisos específicos para cada usuario, por lo tanto:

  ![i](Images/Parte1/t.png)


  + UPDATE: <code>GRANT UPDATE ANY TABLE TO [usuario]; </code>

![i](Images/Parte1/c20.jpeg)

  + INSERT: <code> GRANT INSERT ANY TABLE TO [usuario];</code>

![i](Images/Parte1/c18.jpeg)



  + SELECT: <code> GRANT SELECT ANY TABLE TO [usauario] </code>

  ![i](Images/Parte1/c15.jpeg)

    

  + DELETE: <code> GRANT DELETE ANY TABLE TO [usuario]; </code>

![i](Images/Parte1/c20.jpeg)

  + CREAR TABLAS: <code> GRANT CREATE USER TO [usuario];</code>

 ![i](Images/Parte1/c19.jpeg)


 Como puede verse en las tablas anteriores, existen 2 maneras para poder otorgar permisos a los usuarios, los cuales son:

 + <code> GRANT [permiso] ON [nombre_tabla] TO [usuario]; </code>
 + <code> GRANT [permiso] ANY TABLE TO [usuario]; </code>

Posteriormente podemos confirmar que permiso tiene que usuario con la siguiete consulta:


<code> SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE [condicion]</code>
En este caso se usó de la siguiente manera para solamente mostrar los usuarios que nos interesan:

![i](Images/Parte1/c21.png)
<br>

![i](Images/Parte1/c22.png)

Además que a todos los usuarios se les proporciona el privilegio para crear y loggearse a su propia seción el cual es el siguiente comando:

+ <code> GRANT CREATE SESSION TO [usuario] </code>

Seguir el [siguiente link](Carga/users_permitions.sql) para una versión más completa de todos los comandos usados

### Creación de Vista y Otorgación a usuario "GUEST1"

La siguiente parte describe la vista que se debe de crear para el usuario 1, primero se crea la vista: 

![i](Images/Parte1/c24.png)

La cual proporciona los siguientes registros:

![i](Images/Parte1/c25.png)

Finalmente es necesario otorgarle permisos al usuario <quote> GUEST1</quote>
por medio de la siguiente sentencia:

<code>GRANT SELECT ON [esquema].[vista] TO [usuario]</code>

![i](Images/Parte1/c26.png)

Ahora el usuario podrá ver la información de dicha vista de la siguiente manera: 

Primero se debe conectar con su usuario :

![i](Images/Parte1/f2.png)

Y posteriormente ejecutar: 
<br>
<code>SELECT * from [Esquema_origen].[vista]</code>
<br>
El cual en este caso es:
<br>
<code>SELECT * FROM ELECCIONES.VOTOPRESIDENTE</code>

Seguir el [siguiente link](Carga/view.sql) para encontrar el script.

-------------

## Parte 2: Backups

Para la siguiente parte se usó el siguiente E-R

![b](Images/Parte2/b1.png)
<br>
<em>Entidad relación de Liga</em>

Para poder crear la base de datos se crea un usuario llamado LIGA con permisos y posteriormente conectarse a el: 

<code>CREATE USER [ususario] IDENTIFIED BY [password]</code>
<BR>

![b](Images/Parte2/b2.png)
![b](Images/Parte2/b3.png)

Una vez conectados, se procede a crear la base de datos y llenarla con el [siguiente archivo](Carga/Script%20Backup.sql) 

![b](Images/Parte2/c3.jpeg)
![b](Images/Parte2/b4.png)


### Creacion de backup

En la maquina virtual, ya sea por medio de SSH u otras herramientas como lo es Termius, procedemos a ingresar el siguiente comando:

<code> su - oracle </code> <br>
para poder acceder a la consola de oracle y sus herramientas

+ Acceder con la contraseña definida

En caso que no permita acceder a herramientas como sqlplus se debe ingresar:
<code>source oraenv </code> Y como SID EX para setear las variables de entorno, cabe de mencionar que esto se deberá hacer cada vez que se finalize sesion, pero lo modificado permanecerá


![b](Images/Parte2/b5.png)

Aquí nos podemos dar cuenta que Oracle está en opt/oracle por lo que procederemos a desloguearnos con 2 exit y así proceder a liberar los permisos en dichas carpetas:

<code>chmod 777 [directorio] </code>
<br>

![b](Images/Parte2/b6.png)
<br>
<em> El color de las carpetas afectadas es ahora verde </em>
<br>

Ahora volvemos a ingresar a oracle con <code> su - oracle </code> y procedemos a acceder a opt/oracle

<code> cd /opt/oracle/ </code>
<br>
Y procedemos a crear una nueva carpeta (en este caso llamada export1) con el comando <code>mkdir</code>

![b](Images/Parte2/b7.png)

Le liberamos los permisos de escritura, lectura y modificación:

<code>chmod 777 [directorio] </code>

y creamos un archivo (en este caso llamado export.par) .par dentro del directorio con el comando <code>touch </code>

![b](Images/Parte2/b8.png)

Ahora con <code>nano</code> procedemos a agregarle lo siguiente:

<code> 
USERID=[nombre_schema]
<br>
DIRECTORY=[directorio]
<br>
DUMPFILE=[nombre].dmp
<br>
LOGFILE=[nombre].log
TABLES=[nombre]...,[nombre]
<br>
CONTENT=[all|metadata_only|data_only]
</code>
<br>
<br>
Para Content: <br>

+ all: Copia el esquema y sus datos
+ metadata_only: Copia exclusivamente el esquema
+ data_only: copia exclusivamente los datos 


![b](Images/Parte2/b9.png)
<br>
<em> Archivo export.par en el directorio /opt/oracle/export1 configurado para solo hacer backup de el esquema </em> <br>


![b](Images/Parte2/b13.png)
<br>
<em> Archivo export.par en el directorio /opt/oracle/export2 configurado para hacer backup de tablas con sus datos </em> <br>

Una vez hecho esto, hay que ir ya sea a SQLPlus o a el IDE que se esté usando u realizar lo siguiente: 

<code> CREATE OR REPLACE DIRECTORY [DIRECTORY] AS 'directorio_destino'; <br>Commit;</code>

+ donde DIRECTORY es el directorio especificado en el archivo .par 
+ donde directorio_destino es la carpeta previamente creada en /opt/oracle/
  
![b](Images/Parte2/b10.png)

una vez realizado esto, dentro de la máquina se debe ejecutar:
<br>
<code>expdp -parfile archivo.par </code>

lo que ejecutará el archivo par y dependiendo de la especificación de CONTENT, hará el backup.


![b](Images/Parte2/b11.png)
<br>
<em> backup export.par configurado para solo hacer backup de el esquema </em> <br>
![b](Images/Parte2/b12.png)
<br>
<em> backup export.par configurado para solo hacer backup dde las tablas con sus datos</em> <br>

![b](Images/Parte2/b16.png)
<br>
<em> archivos que deben aparecer en el directorio .././export[1|2] </em> <br>
<br>
Una vez completados ya podremos hacer uso de los backups creados, para efecto de este manual, el esquema <b>LIGA2</b> tendrá el backup de las tablas con sus datos y <b>LIGA3</b> solamente tendrá el backup del esquema pedido.
<br>
Estando en la carpeta donde se encuentran los backups:
<br>
El comando para reestablecer la información del backup es el siguiente:
<br>
<code>impdp usuario/password directory=DIRECTORIO dumpfile=DUMPFILE.dump logfile=nombre.log remap_schema=usuario_origen:usuario</code>
<br>
Donde:

+ DIRECTORIO
+ DUMPFILE
Son los especificados en los archivos .par
<br>

![b](Images/Parte2/b14.png)
<br>
<em> impdp de esquemas a DB LIGA2 </em> <br>


![b](Images/Parte2/b15.png)
<br>