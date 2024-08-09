CREATE database escola;

use escola;

CREATE TABLE  aluno(
ID int primary key auto_increment,
nome varchar(50) not null,
data_nacsimento date not null,
matricula int
);
CREATE TABLE  professores(
ID int primary key auto_increment,
nome varchar(50) not null,
specialidade varchar(100) not null
);
CREATE TABLE  disciplinas(
ID int primary key auto_increment,
nome varchar(50) not null,
professorID int,
foreign key(professorID) references professores(ID)
);
CREATE TABLE  matriculas(
ID int primary key auto_increment,
disciplinaID int,
alunoID int,
data_matricula date,
foreign key(disciplinaID) references disciplinas(ID),
foreign key(alunoID) references aluno(ID)
);

insert into aluno(nome,data_nacsimento,matricula)value("leandro",'1999-03-03',680897);
insert into aluno(nome,data_nacsimento,matricula)value("felipe",'2000-03-04',48429040);

insert into professores(nome,specialidade)value("rogeria","historia");
insert into professores(nome,specialidade)value("junior","educacao fisica");

insert into disciplinas(nome,professorID)value("historia",1);
insert into disciplinas(nome,professorID)value("educacao fisica",2);

insert into matriculas(disciplinaID,alunoID,data_matricula)value(1,2,'2024-08-01');
insert into matriculas(disciplinaID,alunoID,data_matricula)value(2,1,'2024-07-01');