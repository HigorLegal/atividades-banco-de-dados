create database ClinicaVeterinaria;
 
use ClinicaVeterinaria;

create table animais(
ID int primary key auto_increment,
Nome varchar(200),
tipo varchar(50),  
idade int,
proprietario varchar(200)  
);

create table veterinarios(
ID int primary key auto_increment,
Nome varchar(200),
especialidade varchar(100),  
 experiencia YEAR
);

create table consultas(
ID int primary key auto_increment,
data_consulta date,
veterinarioID int,  
animalID int,
  foreign key(veterinarioID) references  veterinarios(ID),
  foreign key(animalID) references  animais(ID)
);

create table tratamentos(
ID int primary key auto_increment,
descricao varchar(1000),
consultaID int,  
custo decimal(10,2),
foreign key(consultaID) references  consultas(ID) 
);

insert into animais(Nome,tipo,idade,proprietario)value
("mario","cachorro",20,"carlos"),
("aurora","gato",2,"vanesa"),
("gato","gato",7,"andre"),
("falador","passaro",10,"luciano"),
("bruto","cachorro",17,"ronaldo");

insert into veterinarios(Nome,especialidade,experiencia)value
("flavio","clinica geral",17),
("claudia","cirurgia",2),
("josé","clinica geral",30),
("lucia","clinica geral",5),
("juan","cirurgia",15);

insert into consultas(data_consulta,veterinarioID,animalID)value
('2024-08-06',1,1),
 ('2024-01-02',2,2),
('2023-01-02',3,3),
 ('2024-06-01',4,4),
('2024-09-06',5,5);

insert into tratamentos(descricao,consultaID,custo)value
("checkup geral",1,100.00),
("cirurgia de pangreas",2,200.00),
("cirurgia de ernia",3,300.00),
("cirurgia de estomago",4,400.00),
("cirurgia de coracao",5,500.00);

SELECT a.nome, c.data_consulta, v.nome FROM consulta c INNER JOIN animais a INNER JOIN veterinarios v ON c.animalID = a.ID and c.veterinarioID = v.ID;

SELECT t.descricao , c.data_consulta , a.nome FROM tratamentos t 
INNER JOIN consulta c ON t.consultaID = c.ID 
INNER JOIN animais a ON c.animalID = a.ID;

SELECT a.nome, c.data_consulta, v.nome FROM consulta c 
INNER JOIN animais a 
INNER JOIN veterinarios v ON c.animalID = a.ID and c.veterinarioID = v.ID
where v.id=1;

SELECT a.nome , sum(t.custo) AS MediaValor FROM tratamentos t 
INNER JOIN consulta c ON t.consultaID = c.ID 
INNER JOIN animais a ON c.animalID = a.ID
group by a.id;
