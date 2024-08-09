CREATE database vendas;

use vendas;

CREATE TABLE  produtos(
ID int primary key auto_increment,
nome varchar(50) not null,
descricao varchar(100) not null,
preco decimal(10,2)
);
create table clientes(
ID  int primary key auto_increment,
nome varchar(100),
email varchar(100),
telefone varchar(20)
);
create table vendas(
ID int primary key auto_increment,
data date,
clienteID int,
total int,
foreign key(clienteID) references clientes(ID)
);
create table itens_vendas(
ID int primary key auto_increment,
vendaID int,
produtoID int,
quantidade int,
preco decimal(10,2),
foreign key(vendaID) references vendas(ID),
foreign key(produtoID) references produtos(ID)
);
insert into produtos(nome,decricao,preco)value("caixa de ferro","uma caixa grande de ferro",22.99);
insert into produtos(nome,decricao,preco)value("tabuleiro de xadrez","um tabuleiro de xadrez",20.99);

insert into clientes(nome,email,telefone)value("marcos","marcoslegal@gmail.com","9231023");
insert into clientes(nome,email,telefone)value("jeferson","jefersonlegal@gmail.com","8332034");

insert into vendas(data,clienteID,total)value(2024-03-03,1,1);
insert into vendas(data,clienteID,total)value(2024-04-04,2,3);

insert into itens_vendas(vendaID,produtoID,quantidade,preco)value(1,1,4,100.00);
insert into itens_vendas(vendaID,produtoID,quantidade,preco)value(2,1,3,89.99)