create database financeira;

    

create table clientes(
ID int primary key auto_increment,
Nome varchar(200),
CPF int unique,  
Data_Nascimento date
);

create table cartoes(
    ID int primary key auto_increment,
Numero_Cartao int unique,
Limite_Credito decimal(10,2), 
Data_Expiracao date,
 clienteID int,
foreign key(clienteID) references clientes(ID)
);

create table Contatos( 
ID int primary key auto_increment,
tipo varchar(50),
detalhe_contato varchar(100),
clienteID int,
foreign key (clienteID) references clientes(ID)
);
create table Transacoes( 
ID int primary key auto_increment,
dataTransacao date time,
 valor decimal(10,2),
 descricao varchar(100), 
 cartaoID int,
 foreign key (cartaoID) references cartoes(ID)
);
create table faturas( 
ID int primary key auto_increment,
Mes_Referencia varchar(50),
 total decimal(10,2), 
 status varchar(50), 
 cartaoID int,
 foreign key (cartaoID) references cartoes(ID)
);