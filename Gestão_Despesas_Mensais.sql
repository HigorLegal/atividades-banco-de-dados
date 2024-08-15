

create database Gestão_Despesas_Mensais;


use Gestão_Despesas_Mensais;


create table  usuarios(
usuariosID int primary key auto_increment,
nome varchar(300) not null,
email  varchar(200) not null unique,
senha varchar(100) not null,
cpf int not null unique,
telefone varchar(15)not null,
endereco varchar(255)not null
);
create table  categorias(
categoriasID int primary key auto_increment,
tipo varchar(100) unique not null
);
create table  contas(
contasID int primary key auto_increment,
saldo decimal(12,2),
usuarioID int,
FOREIGN KEY (usuarioID)
    REFERENCES  usuarios(usuariosID)
    ON DELETE cascade
    ON UPDATE NO ACTION
);
create table  transacoes(
transacoesID int primary key auto_increment,
valor decimal(13,2)not null,
data_realizada date not null,
descricao varchar(300),
categoriaID int,
contaID int,
FOREIGN KEY (categoriaID)
    REFERENCES  categorias(categoriasID)
    ON DELETE cascade
    ON UPDATE NO ACTION,
    FOREIGN KEY (contaID)
    REFERENCES  contas(contasID)
    ON DELETE cascade
    ON UPDATE NO ACTION
);


create table  metas(
metasID int primary key auto_increment,
descricao varchar(300) not null,
data_conclusao date ,
data_inicio date not null,
data_prevista date not null,
valor_meta decimal(12,2) not null,
categoriaID int,
usuarioID int,
FOREIGN KEY (categoriaID)
    REFERENCES  categorias(categoriasID)
    ON DELETE cascade
    ON UPDATE NO ACTION,
    FOREIGN KEY (usuarioID)
    REFERENCES  usuarios(usuariosID)
    ON DELETE cascade
    ON UPDATE NO ACTION
);


insert into usuarios(nome,email,senha,cpf,telefone,endereco)value
("juan","juan@gmail.com","juanlegal123",43355776,"555199812812","rua talz,alguma cidade"),
("fabio","fabio@gmail.com","fabioirado321",52215676,"535299876892","rua de concreto,cidade grande"),
("luciano","luciano@gmail.com","lucianolegal123",412345776,"5551125372812","rua generica,cidade generica");


insert into contas(saldo,usuarioID)value
(100000,1),
(1000000,2),
(10000000,3);




insert into categorias(tipo)value
("casa"), 	
("transporte"),
("trabalho");


insert into transacoes(valor, descricao,data_realizada,categoriaID, contaID)value
(-50.00,"compra de alimentos para a casa",'2024-08-13',1,1),
(-100.00,"conserto do carro",'2024-08-13',2,1),
(-1000.00,"conserto do carro",'2022-05-09',2,2),
(4000.00,"salario",'2021-12-12',3,3);


insert into metas(descricao,valor_meta,data_inicio,data_conclusao,data_prevista,categoriaID, usuarioID)value
("economizar na conta de luz",20.00,'2024-08-01','2024-08-01','2024-08-13',1,1),
("economizar na gasolina do carro",100.00,'2024-07-13','2024-08-13','2024-08-13',2,2),
("economizar nao comprando lanche toda terça no trabalho",10.00,'2021-03-03','2021-05-14','2021-05-04',3,3);


select * from usuarios;
select * from contas;
select * from categorias;
select * from transacoes;
select * from metas;


/* mostrar quanto um usuario gastou em cada categoria */
select c.tipo,sum(valor) as gastos_categoria
from transacoes t
inner join categorias c
on t.categoriaID=c.categoriasID
where  t.contaID=1 and valor < 0
group by c.tipo;


/* mostrar as receitas de um usuario */


select  c.contasID,t.*
from transacoes t
inner join contas c
on t.contaID=c.contasID
where t.contaID=3 and valor > 0
;


/* mostrar se ouve mais gastos com despesas ou mais ganhos com receitas */


select  c.contasID,SUM(VALOR) as balanco_transacoes
from transacoes t
inner join contas c
on t.contaID=c.contasID
where t.contaID=1
;
