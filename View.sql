use northwind;

create or replace view ListaClientes
as
select CustomerID, ContactName, City, Region
from customers;

select * from listaclientes where city = "Madrid";

drop view listaclientes;


create view ListaProdutosSemCat
as
select ct.CategoryID, ct.CategoryName, pd.ProductID, pd.ProductName
from categories as ct right outer join products as pd
on ct.CategoryID = pd.CategoryID
where ct.CategoryID is null;

select * from listaprodutossemcat;


create or replace view ListaClientesPedidos
as
select customers.CustomerID, ContactName, OrderID, OrderDate
from customers inner join orders
on customers.CustomerID = orders.CustomerID;

select * from listaclientespedidos;