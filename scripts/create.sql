DROP DATABASE IF EXISTS testdb;
CREATE DATABASE testdb;
USE testdb;

CREATE TABLE personne(
    idPersonne INT(10) NOT NULL AUTO_INCREMENT,
    nom VARCHAR(45) NOT NULL,
    prenom VARCHAR(45) NOT NULL,
    mail VARCHAR(320) NOT NULL UNIQUE,
    pass varchar(500) NOT NULL,
    actif boolean, 
    CONSTRAINT pk_personne PRIMARY KEY(idPersonne)
);
create table authorities
(
    mail  varchar(50) not null,
    authority varchar(50) not null,
    constraint fk_authorities_personne foreign key (mail) references personne (mail)
);
create unique index ix_auth_mail on authorities (mail, authority);

