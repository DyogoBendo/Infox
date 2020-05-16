-- comentario sao feitos com --

-- a linha abaixo cria um banco de dados
create database dbinfox;

-- informar o banco de dados que sera usado
use dbinfox;

-- criando a tabela para controle de usuarios
create table tbusuarios(
	iduser int primary key,
    usuario varchar(50) not null,
    telefone varchar(15),
    login varchar(15) not null unique,
    senha varchar(15) not null
);

-- o comando a baixo ira descrever a tabela
describe tbusuarios;

-- inserir valores na tabela (CRUD - create, read, uptade, delete) - create
insert into tbusuarios (iduser, usuario, telefone, login, senha)
values (1, 'Jose de Assis', '9999-9999', 'joseassis', '123456');

insert into tbusuarios(iduser, usuario, telefone, login, senha)
values (2, 'Administrador', '9999-9999', 'admin', 'admin');

insert into tbusuarios(iduser, usuario, telefone, login, senha)
values (3, 'Bill Gates', '9999-9999', 'bill', '123456');

-- a linha abaixo modifica dados - uptade
update tbusuarios
set telefone = '8888-8888' 
where iduser = 2;

-- apagar um registro da tabela - delete
delete from tbusuarios
where iduser = 3;

-- mostrar os dados da tabela - read
select * from tbusuarios;


-- criando outras tabelas

create table if not exists tbclientes(
	idcli int primary key auto_increment,
    nomecliente varchar(50) not null,
    endcli varchar(100),
    fonecli varchar(50) not null,
    email varchar(50)
);

describe tbclientes;

insert into tbclientes(nomecliente, endcli, fonecli, email)
values('Linus Torvals', 'Rua Tux, 2015', '9999-9999', 'linus@linux.com');

select * from tbclientes;

-- criando outra tabela

create table if not exists tbos(
	os int primary key auto_increment,
    data_os timestamp default current_timestamp, -- define que quando ha um insert o horario que foi realizado eh armazenado aqui
    equipamento varchar(150) not null,
    defeito varchar(150) not null,
    servico varchar(150),
    tecnico varchar(30),
    valor decimal(10, 2), 
    idcli int not null,
    foreign key(idcli) 
    references tbclientes(idcli)
);

describe tbos;

insert into tbos(equipamento, defeito, servico, tecnico, valor, idcli)
values('Notebook', 'Nao liga', 'Troca da fonte', 'Ze', 87.50, 1);

select * from tbos;

-- o codigo abaixo traz informacoes de duas tabelas
select
O.os,equipamento,defeito,servico,valor,
C.nomecliente,fonecli
from tbos as O
inner join tbclientes as C
on (O.idcli = C.idcli);
