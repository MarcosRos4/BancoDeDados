create database loja;

USE loja;

 create TABLE cliente(
	cod_cli smallint not null auto_increment,
    nome varchar(50) not null,
    nasc date not null,
    rg int(9) not null,
    cpf int(11) not null,
	primary key(cod_cli)
);

create table vendedor
(
cod_vend smallint not null auto_increment,
nome_vend varchar(50) not null,
sal_fixo numeric(9,2) not null,
faixa_comiss char(01) not null,
primary key (cod_vend)); 

create table produto
(
cod_prod smallint  auto_increment,
unid_prod char(03) not null,
desc_prod varchar(20) not null,
val_unit numeric(9,2) not null,
primary key (cod_prod));

create table pedido (
num_ped int auto_increment,
prazo_entr smallint not null,
cd_cli smallint not null,
cd_vend smallint not null,
primary key (num_ped),
foreign key (cd_cli) REFERENCES CLIENTE (cod_cli),
foreign key (cd_vend) REFERENCES VENDEDOR (cod_vend));

create table item_pedido (
no_ped int not null ,
cd_prod smallint not null,
qtd_ped float not null,
foreign key (no_ped) REFERENCES PEDIDO (num_ped),
foreign key (cd_prod) REFERENCES PRODUTO (cod_prod)
); 
# funções de alterar a tabela DDL Data Definition Language
alter table cliente rename column statuscli to molho;
alter table pedido modify column prazo_entr char(8);
alter table cliente change column molho statuscli bit;
alter table cliente drop column statuscli;

# funções de alterar dado DML Data Manipulation Language
# insere um dado
insert into item_pedido (no_ped, cd_prod, qtd_ped) values(5, 2, 7);

# atualiza um dado
update produto
set val_unit = val_unit * 1.05;

# deleta registros, deleta DADOS
# não é possivel deletar um registro que sua chave primaria é usada em outra tabela
delete from item_pedido
where no_ped = 1;

# mostra as tabelas inteiras
select * from cliente;
select * from vendedor;
select * from produto;
select * from item_pedido;
select * from pedido;

desc cliente;
