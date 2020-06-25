    /*create dtabase*/
create DATABASE gestion;
use gestion;
/*create table client*/
create table client(cin varchar(20),Nom varchar(30),Prenom varchar(20),adress varchar(50));
ALTER table client ADD  primary key(cin);
/*inser 5 ROWS*/
insert into client values('AHHM','mohammed','hachimi','safi maroc'),
('HH548','reda','hachimi','rabat maroc'),
('BTM','jamal','dirar','casa maroc'),
('HHTT','Ahmed','hachimi','safi maroc'),
('23JJ','ayman','mouad','sale maroc');
select * from client ;
/*delete*/
delete from client where cin='BTM';
/* update=> MODIFIER*/
update client set Nom='mehdi' where cin='HHTT';

/*create table commande*/
create table commande(num_commande int primary key auto_increment,date_Cmd date default CURDATE());
/*inser 1 ROW*/
insert into commande(num_commande) values(1);
insert into commande values(default,'1998-5-7');

select * from commande ;
/*delete*/
delete from commande where num_commande=2;
/* update=> MODIFIER*/
update commande set date_Cmd='2019-8-24' where num_commande=3;

/*create table Article*/
create table article(num_article  int primary key auto_increment,nom_article varchar(30),prix float);
/*inser 3 ROW*/
insert into article(nom_article,prix) values('ahmed',12.12),('jamal','20.1');

select * from article ;
/*delete*/
delete from article where num_article=2;
/* update=> MODIFIER*/
update article set nom_article='Article1' where num_article=3;
/* create user*/
create user 'user' identified by 'hachimi';
grant all on *.* to 'user';
    
