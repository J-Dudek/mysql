<h1> Mysql </h1>

<h2>Docker Pour test de BDD</h2>
</br>
<h3>Fonctionnement :<h3>

  - Mettre vos `sql`dans le dossier scripts
  - Build de l'image avec : `docker build -t nomimage . `
  - Lancement de l'image avec : `docker run -d -p 3308:3306 --name nomimage \
-e MYSQL_ROOT_PASSWORD=passchoisi nomimage` (J'utilise ici le port 3308 car nous avons souvent une instance MySQL qui tourne sur le 3306)

  - Test de l'accès avec : `docker exec -it nomimage bash` -> donne accès au bash de l'image.
  - Connexion au moniteur sql avec `mysql -uroot -p` .
  - On est alors invité à taper le mot de passe `passchoisi`.

<h3>Exemple d'utilisation</h3>
 
 ```
 ➜  mysql git:(main) ✗ docker build -t nomimage .
[+] Building 1.4s (7/7) FINISHED                                                                                                                                     
 => [internal] load build definition from Dockerfile                                                                                                            0.0s
 => => transferring dockerfile: 37B                                                                                                                             0.0s
 => [internal] load .dockerignore                                                                                                                               0.0s
 => => transferring context: 2B                                                                                                                                 0.0s
 => [internal] load metadata for docker.io/library/mysql:latest                                                                                                 1.3s
 => CACHED [1/2] FROM docker.io/library/mysql:latest@sha256:8c17271df53ee3b843d6e16d46cff13f22c9c04d6982eb15a9a47bd5c9ac7e2d                                    0.0s
 => [internal] load build context                                                                                                                               0.0s
 => => transferring context: 760B                                                                                                                               0.0s
 => [2/2] COPY ./scripts/ /docker-entrypoint-initdb.d/                                                                                                          0.0s
 => exporting to image                                                                                                                                          0.0s
 => => exporting layers                                                                                                                                         0.0s
 => => writing image sha256:30e23092af4885303fb562679e14f3ff86852b851c99ac7785c12b4246269059                                                                    0.0s
 => => naming to docker.io/library/nomimage                                                                                                                     0.0s
➜  mysql git:(main) ✗ docker run -d -p 3308:3306 --name nomimage \
-e MYSQL_ROOT_PASSWORD=passchoisi nomimage
b75db5319e6bbdc0c3521467f5047dcb4fa0856701bbea5ef2af8a337a537038
➜  mysql git:(main) ✗ docker exec -it nomimage bash
root@b75db5319e6b:/# mysql -uroot -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.22 MySQL Community Server - GPL

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| testdb             |
+--------------------+
5 rows in set (0.01 sec)

mysql> use testdb;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+------------------+
| Tables_in_testdb |
+------------------+
| authorities      |
| personne         |
+------------------+
2 rows in set (0.00 sec)

mysql> 
