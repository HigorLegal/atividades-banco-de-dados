CREATE database  biblioteca;

USE `biblioteca` ;


CREATE TABLE clientes (
  ID INT PRIMARY key NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL,
  Telefone VARCHAR(15),
)



CREATE TABLE livros (
  ID INT PRIMARY key NOT NULL AUTO_INCREMENT,
  Titulo VARCHAR(255) NOT NULL,
  Autor VARCHAR(255) NOT NULL,
  Genero VARCHAR(100) NOT NULL,
  Ano_Publicacao YEAR NOT NULL,
  Preco DECIMAL(10,2) NOT NULL,
)



CREATE TABLE emprestimos (
  ID INT NOT NULL AUTO_INCREMENT,
  ClienteID IN,
  LivroID INT,
  data_emprestimo  DATE NOT NULL,
  data_devolucao DATE NOT NULL, 
  FOREIGN KEY (ClienteID) REFERENCES clientes(ID),
  FOREIGN KEY (LivroID) REFERENCES livros(ID)
   )
   insert into clientes(nome,Email,Telefone)value("andre","andre@exemplo.com","890123");
   insert into clientes(nome,Email,Telefone)value("joao","joao@exemplo.com","123124");

   insert into livros(titulo,Autor,genero,Ano_Publicacao,Preco)value("andre legal","luciano da Silva","fantasia","2001",33.00);
   insert into livros(titulo,Autor,genero,Ano_Publicacao,Preco)value("joao feliz","carlos gomes","aventura","1990",22.00);
   
   insert into emprestimos(ClienteID,LivroID,data_emprestimo,data_devolucao)value(1,1,"2024-07-31","2024-07-31");
   insert into emprestimos(ClienteID,LivroID,data_emprestimo,data_devolucao)value(1,2,"2025-07-31","2025-07-31");