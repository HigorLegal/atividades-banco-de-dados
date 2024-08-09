CREATE database  lojaGames;

USE lojaGames ;

create table jogos(
    id int primary key auto_increment,
    titulo varchar(200),
    genero varchar(200),
    preco decimal(10,2),
    desenvolvedorID int,
    foreign key(desenvolvedorID) references desenvolvedores(ID)
);

create table desenvolvedores(
ID int primary key auto_increment,
Nome varchar(200),
pais varchar(50),  
ano_fundacao YEAR
);

create table vendas(
    id int primary key auto_increment,
    Data_venda date,
    Quantidade int,
    valor_total decimal(10,2),
    jogoID int,
    foreign key(jogoID) references  jogos(ID)
);
insert into desenvolvedores(Nome,pais,ano_fundacao)value("fromsoftware","united states",2001);
insert into desenvolvedores(Nome,pais,ano_fundacao)value("sega","japan",1973);
insert into desenvolvedores(Nome,pais,ano_fundacao)value("nintendo","japan",1940);
insert into desenvolvedores(Nome,pais,ano_fundacao)value("rockstar","united states",1999);
insert into desenvolvedores(Nome,pais,ano_fundacao)value("betesda","united states",1980);

insert into jogos(titulo,genero,preco,desenvolvedorID)value("dark souls 4","aventura",500.00,1);
insert into jogos(titulo,genero,preco,desenvolvedorID)value("grand theft auto 6","shoter",1000.00,2);
insert into jogos(titulo,genero,preco,desenvolvedorID)value("super mario word 2","aventura",100000.00,3);
insert into jogos(titulo,genero,preco,desenvolvedorID)value("metal gear liquid 3","aventura, shoter",200.00,4);
insert into jogos(titulo,genero,preco,desenvolvedorID)value("sonic 2077","aventura",2000.00,5);

insert into vendas(Data_venda,quantidade,valor_total,jogoID)value('2026-03-03',1,2000.00,1);
insert into vendas(Data_venda,quantidade,valor_total,jogoID)value('2025-06-09',2,2000.00,2);
insert into vendas(Data_venda,quantidade,valor_total,jogoID)value('2024-08-05',8,20000.00,3);
insert into vendas(Data_venda,quantidade,valor_total,jogoID)value('2025-12-09',1,200.00,4);
insert into vendas(Data_venda,quantidade,valor_total,jogoID)value('2030-12-12',1,2000.00,5);

select * from jogos where genero like "%aventura%";
    
select nome,pais from desenvolvedores ;

SELECT * FROM jogos where preco > 1000.00;

SELECT * FROM vendas  where data_venda between '2024-08-06'and '2024-08-01' order by data_venda asc;

SELECT * FROM jogos order by titulo asc;

select * from desenvolvedores order by ano_fundacao desc limit 5;

SELECT j.titulo, d.nome FROM jogos j INNER JOIN desenvolvedores d ON j.desenvolvedorID = d.ID;

SELECT j.titulo, v.data_venda,quantidade FROM jogos j INNER JOIN vendas v ON j.ID= v.jogoID;