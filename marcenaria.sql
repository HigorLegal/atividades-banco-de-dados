create database Marceneiro;

use Marceneiro;


create table clientes(
ID int primary key auto_increment,
Nome varchar(200),
email varchar(200),
telefone varchar(200),
cidade  varchar(200),
ativo varchar(10)
);
create table produtos(
    id int primary key auto_increment,
    Nome varchar(200),
    Descricao varchar(200),
    preco decimal(10,2)
)
create table pedidos(
    id int primary key auto_increment,
    Data_Pedido date,
    Quantidade int,
    valor_total decimal(10,2),
    ClienteID int,
    ProdutoID int,
    foreign key(clienteID) references clientes(ID),
    foreign key(produtoID) references produtos(ID)
)


insert into pedidos(data_pedido,quantidade,valor_total,clienteID,produtoID)value('2024-08-09',1,100.00,1,1);
insert into clientes(Nome,email,telefone,cidade,ativo)value("mario","mario@gmail.com","123456789","rio de janeiro","inativo");
insert into clientes(Nome,email,telefone,cidade,ativo)value("luigh","lush@gmail.com","893444544","sao paulo","ativo");
insert into clientes(Nome,email,telefone,cidade,ativo)value("geodude","geo123@gmail.com","9083475","sapucaia","ativo");
insert into clientes(Nome,email,telefone,cidade,ativo)value("sekiro","sekiro092@gmail.com","67788213","rio de janeiro","inativo");
insert into clientes(Nome,email,telefone,cidade,ativo)value("gundyr","ludex103@gmail.com","12331453","acre","ativo");
insert into clientes(Nome,email,telefone,cidade,ativo)value("sherek","sherek986@gmail.com","9723498234","esteio","inativo");

insert into produtos(Nome,descricao,preco)value("pedaço de pau"," um pedaço de pau apenas",22.00);
insert into produtos(Nome,descricao,preco)value("cadeira foda"," uma cadeira muito foda",32.00);
insert into produtos(Nome,descricao,preco)value("mesa irada"," uma mesa irada",110.00);
insert into produtos(Nome,descricao,preco)value("banco feio"," um banco bem feio",39.99);
insert into produtos(Nome,descricao,preco)value("mesa de cabeceira legal"," uma mesa de cabeceira que aperenta ser bem legal",52.00);

insert into pedidos(data_pedido,quantidade,valor_total,clienteID,produtoID)value('2024-08-09',1,100.00,1,1);
insert into pedidos(data_pedido,quantidade,valor_total,clienteID,produtoID)value('2024-08-09',2,10.00,2,2);
insert into pedidos(data_pedido,quantidade,valor_total,clienteID,produtoID)value('2024-08-09',1,50.00,3,3);
insert into pedidos(data_pedido,quantidade,valor_total,clienteID,produtoID)value('2024-08-09',3,1000.00,4,4);
insert into pedidos(data_pedido,quantidade,valor_total,clienteID,produtoID)value('2024-08-09',1,1500.00,5,5);

select * from clientes;

select nome,preco from produtos;

SELECT * FROM Clientes WHERE Cidade = 'rio de janeiro';

SELECT * FROM produtos where preco > 100.00;

SELECT * FROM Clientes WHERE Cidade = 'rio de janeiro' and ativo='ativo';

SELECT * FROM produtos order by preco desc;

select * from clientes limit 3; 