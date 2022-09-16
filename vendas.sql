create database loja;

USE loja;

 create TABLE cliente(
	codi smallint not null auto_increment,
    nome varchar(50) not null,
    nasc date not null,
    rg smallint(9) not null,
    cpf smallint(11) not null,
	primary key(codi)
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
cd_vend int not null,
primary key (num_ped),
foreign key (cd_cli) REFERENCES CLIENTE (cod_cli),
foreign key (cd_vend) REFERENCES VENDEDOR (cod_vend));

create table item_pedido (
no_ped smallint not null ,
cd_prod smallint not null,
qtd_ped float not null,
foreign key (no_ped) REFERENCES PEDIDO (num_ped),
foreign key (cd_prod) REFERENCES PRODUTO (cod_prod)
); 