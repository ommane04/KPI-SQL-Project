#KPI 4: Average price and payment values from customers of sao paulo city
with OrderItemAvg AS(
SELECT round(AVG(item.price)) AS avg_order_item_price
from olist_dataset.olist_order_items_dataset item
join olist_dataset.olist_orders_dataset ord ON item.order_id=ord.order_id
join olist_dataset.olist_customers_dataset cust ON ord.customer_id = cust.customer_id
where cust.customer_city="sao paulo"
)
select
(select avg_order_item_price from OrderItemAvg) as avg_order_item_price,
round(avg(pmt.payment_value)) as avg_payment_value
from olist_dataset.olist_order_payments_dataset pmt
join olist_dataset.olist_orders_dataset ord on pmt.order_id=ord.order_id
join olist_dataset.olist_customers_dataset cust on ord.customer_id=cust.customer_id
where
cust.customer_city="sao paulo";