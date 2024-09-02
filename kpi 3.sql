#KPI 3: average number of Days taken for order_delivered_customer_date for pet shop
select
prod.product_category_name,
round( avg(datediff(ord.order_delivered_customer_date ,ord.order_purchase_timestamp)),0) as Avg_delivery_days
from olist_dataset.olist_orders_dataset ord
join
(select product_id,order_id,product_category_name
from olist_dataset.olist_products_dataset
join olist_dataset.olist_order_items_dataset using(product_id)) as prod
on ord.order_id=prod.order_id
where prod.product_category_name="Pet_shop"
group by prod.product_category_name;