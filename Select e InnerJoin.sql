USE northwind;
# exercicio 1
select EmployeeID, count(OrderID) from orders group by EmployeeID;

# a quantidade total de produtos por pedido
select OrderID, count(ProductID) from order_details group by OrderID order by count(ProductID) desc;

# a quantidade total de pedidos por transportadora
select ShipVia, count(OrderID) from orders group by ShipVia;

# a quantidade total de pedidos por fornecedor
select SupplierID, count(ProductID) from products group by SupplierID order by count(ProductID) desc;

# o valor total de cada pedido
select OrderID, sum(Quantity*UnitPrice) as ValorTotalPedido from order_details group by OrderID;

# quanto cada cliente gastou na loja USANDO JOIN 
select orders.CustomerID, sum(order_details.UnitPrice*order_details.Quantity) as ValorTotalPedido
from orders inner join order_details on orders.OrderID=order_details.OrderID
group by orders.CustomerID
order by CustomerID;

