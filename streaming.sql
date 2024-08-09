create database Streaming;

use Streaming;

create table diretores(
    ID int primary key auto_increment,
    Nome varchar(200),
    nacionalidade varchar(50),  
    premios int
);
create table conteudos(
    id int primary key auto_increment,
    tipo int not null,
    titulo varchar(200),
    genero varchar(200),
    duracao time default 0,
    temporada int default 0,
    diretorID int,
    foreign key(diretorID) references diretores(ID)
);
create table assinaturas(
    id int primary key auto_increment,
    nome_assinante varchar(200),
    email varchar(100), 
    plano varchar(100)
);
create table visualizacoes(
    id int primary key auto_increment,
    data_visualizacao date,
    assinanteID int,
    tipo varchar(50),
    conteudoID int,
    foreign key(conteudoID) references conteudos(ID)
);

insert into diretores(nome,nacionalidade,premios)value
("sthephen kurry","United States",1),
("michael jackson","China",2),
("luan santana","Brasil",3),
("alan walke","United states",4),
("elon musk","Alemanha",5);

insert into conteudos(titulo,genero,duracao,temporada,tipo,diretorID)value
("dark souls o filme","aventura",'01:50:00',null,0,1),
("senhor dos aneis quiemados","aventura, fantasia",null,3,1,2),
("harry potter e a partida de truco","fantasia",'03:05:00',null,0,3),
("ratatratatouille","aventura",null,4,1,4),
("filme 5","terror",'01:30:00',null,0,5);

insert into assinaturas(nome_assinante,email,plano)value
("carlos","carlos_foda01@gmail.com","básico"),
("endrick","the_best007@gmail.com","básico"),
("karl jonson","CJ01@gmail.com","premium"),
("nicolas","GnicolasT01A@gmail.com","básico"),
("trevor","trevorSilva@gmail.com","premium");



insert into visualizacoes(assinanteID,data_visualizacao,tipo,conteudoID)value
(1,'2024-08-07',0,1),
(2,'2024-06-06',1,2),
(3,'2024-07-23',0,3),
(4,'2024-08-01',1,4),
(5,'2024-05-12',0,5);

select c.titulo, d.nome from conteudos c inner join diretores d on c.diretorID =d.ID;

SELECT c.titulo, v.data_visualizacao, a.nome_assinante FROM visualizacoes v  
INNER JOIN conteudos c 
INNER JOIN assinaturas a ON v.conteudoID = c.ID and v.assinanteID = a.ID;

SELECT a.nome_assinante , a.plano , count(*) AS totalVisualizacoes FROM visualizacoes v
INNER JOIN assinaturas a ON v.assinanteID = a.ID 
group by a.ID;
