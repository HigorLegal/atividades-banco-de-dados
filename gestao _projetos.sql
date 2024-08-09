create database gestao_projetos;

use gestao_projetos;

create table desenvolvedores(
ID int primary key auto_increment,
Nome varchar(200),
especialidade varchar(50),  
Data_contratacao date
);

create table projetos(
ID int primary key auto_increment,
Nome varchar(200),
descricao varchar(100),  
Data_inicio date,
Data_termino_prevista date,
clienteID int,
foreign key(clienteID) references clientes(ID)
);

create table equipes(
ID int primary key auto_increment,
Nome varchar(200),
Nome_lider varchar(200),
desenvolvedoresID int,
foreign key(desenvolvedoresID) references desenvolvedores(ID)
);

create table tarefas(
ID int primary key auto_increment,
Nome varchar(200),
descricao varchar(100),  
prazo date,
status varchar(50),
projetoID int,
foreign key(projetoID) references projetos(ID)
);
 
create table recursos(
ID int primary key auto_increment,
Nome varchar(200),  
tipo varchar(50),
custo decimal(10,2),
projetoID int,
foreign key(projetoID) references projetos(ID)
);

create table departamentos(
ID int primary key auto_increment,
Nome varchar(200),
Nome_chefe varchar(200)
);

create table clientes(
ID int primary key auto_increment,
Nome varchar(200),
contato varchar(200),
empresa varchar(200)
);

create table entregas(
ID int primary key auto_increment,
data_entrega date,
status varchar(50),
projetoID int,
foreign key(projetoID) references projetos(ID)
);  

create table orcamento(
ID int primary key auto_increment,
valor_total decimal(10,2),
projetoID int,
departamentoID int,
foreign key(departamentoID) references departamentos(ID),
foreign key(projetoID) references projetos(ID)
);

create table Desenvolvedores_equipes(
equipeID int, 
desenvolvedoresID int ,
foreign key(equipeID) references equipes(ID),
foreign key(desenvolvedoresID) references desenvolvedores(ID),
primary key (equipeID,desenvolvedoresID)
);
create table equipes_Projetos(
equipeID int, 
projetoID int ,
foreign key(equipeID) references equipes(ID),
foreign key(projetoID) references projetos(ID),
primary key (projetoID,equipeID)
);


insert into desenvolvedores(nome,especialidade,data_contratacao)value("leandro","python",'1999-03-03');
insert into desenvolvedores(nome,especialidade,data_contratacao)value("andre","C#",'2010-03-03');
insert into desenvolvedores(nome,especialidade,data_contratacao)value("Joao","java+angular",'2007-03-03');

insert into clientes(Nome,contato,empresa)value("cliente 1","ewrtuyhi@gmail.com","empresa 1");
insert into clientes(Nome,contato,empresa)value("cliente 2","ew1213ugufy@gmail.com","empresa 2");
insert into clientes(Nome,contato,empresa)value("cliente 3","123sdg3443misdg@gmail.com","empresa 3");

insert into projetos(nome,descricao,Data_inicio,Data_termino_prevista,clienteID)value("projeto 1","descricao 1",'2007-03-03','2008-03-03',1);
insert into projetos(nome,descricao,Data_inicio,Data_termino_prevista,clienteID)value("projeto 2","descricao 2",'2010-03-03','2011-03-03',2);
insert into projetos(nome,descricao,Data_inicio,Data_termino_prevista,clienteID)value("projeto 3","descricao 3",'2015-03-03','2018-03-03',3);

insert into equipes(Nome,Nome_lider)value("tubarao aquatico","jeferson");
insert into equipes(Nome,Nome_lider)value("ferro","leonice");

insert into recursos(Nome,tipo,custo,projetoID)value("recurso 1","hardware",1000.00,3);
insert into recursos(Nome,tipo,custo,projetoID)value("recurso 2","software",1000.00,1);
insert into recursos(Nome,tipo,custo,projetoID)value("recurso 3","hardware",10.00,2);

insert into departamentos(Nome,Nome_chefe)value("departamento 1","carlos");
insert into departamentos(Nome,Nome_chefe)value("departamento 2","Laura");
insert into departamentos(Nome,Nome_chefe)value("departamento 3","lucia");


insert into orcamento(valor_total,projetoID,departamentoID)value('1000.00',1,3);
insert into orcamento(valor_total,projetoID,departamentoID)value('200.00',2,2);
insert into orcamento(valor_total,projetoID,departamentoID)value('2500.00',3,1);

insert into entregas(data_entrega,status,projetoID)value('2008-03-03',"entregue",1);
insert into entregas(data_entrega,status,projetoID)value('2011-03-03',"nao entregue",2);    
insert into entregas(data_entrega,status,projetoID)value('2018-03-03',"entregue",3);

insert into tarefas(Nome,descricao,prazo,status,projetoID)value("tarefa 1","descricao 1",'2007-03-03',"pendente",1);
insert into tarefas(Nome,descricao,prazo,status,projetoID)value("tarefa 2","descricao 2",'2027-03-03',"em andamento",3);
insert into tarefas(Nome,descricao,prazo,status,projetoID)value("tarefa 3","descricao 3",'2030-03-03',"concluida",2);

select * from projetos p JOIN equipes e ON e.id = p.equipe_id WHERE   

select valor_total from orcamento where departamentoID=1 ;
select valor_total from orcamento where departamentoID=2 ;
select valor_total from orcamento where departamentoID=3 ;