/*creation de db*/
create database nom_Roue;
use nom_Roue;

/* creation d'un utilisateur avec un accès de la lecture seulement*/
create user 'viewer'@'localhost';
alter user 'viewer'@'localhost' IDENTIFIED BY 'test';
grant select on nom_Roue.* to 'viewer'@'localhost';

/* Affichage */
select * from Roue;

/* Insertion */
insert into location (ID,Ref,Matiere) values(1,'Extraload','Le noyau');
insert into location (ID,Ref,Matiere) values(2,'MO','rigides');

/* Modification */
update Roue set Matiere = 'Le noyau' where ID = 2;

/* Suppression  */
delete from Roue where ID = 1;

/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  26/04/2020 23:35:04                      */
/*==============================================================*/


drop table if exists Climatisation;

drop table if exists Composants;

drop table if exists Roue;

drop table if exists Voiture;

drop table if exists moteur;

/*==============================================================*/
/* Table : Climatisation                                        */
/*==============================================================*/
create table Climatisation
(
   Ref                  int not null,
   Type                 varchar(254),
   primary key (Ref)
);

/*==============================================================*/
/* Table : Composants                                           */
/*==============================================================*/
create table Composants
(
   Matricule            varchar(254),
   ID                   int not null,
   Ref                  int,
   Cli_Ref              int,
   Description          varchar(254),
   Prix                 float,
   primary key (ID)
);

/*==============================================================*/
/* Table : Roue                                                 */
/*==============================================================*/
create table Roue
(
   ID                   int,
   Ref                  int not null,
   Matiere              varchar(254),
   primary key (Ref)
);

/*==============================================================*/
/* Table : Voiture                                              */
/*==============================================================*/
create table Voiture
(
   Marque               varchar(254),
   Modele               int,
   Prix                 float,
   Matricule            varchar(254) not null,
   primary key (Matricule)
);

/*==============================================================*/
/* Table : moteur                                               */
/*==============================================================*/
create table moteur
(
   Carburant            varchar(254),
   Ref                  int not null,
   Capacite             float,
   primary key (Ref)
);

alter table Composants add constraint FK_Association_1 foreign key (Matricule)
      references Voiture (Matricule) on delete restrict on update restrict;

alter table Composants add constraint FK_Association_3 foreign key (Ref)
      references moteur (Ref) on delete restrict on update restrict;

alter table Composants add constraint FK_Association_4 foreign key (Cli_Ref)
      references Climatisation (Ref) on delete restrict on update restrict;

alter table Roue add constraint FK_Association_2 foreign key (ID)
      references Composants (ID) on delete restrict on update restrict;
