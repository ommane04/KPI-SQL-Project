#KPI 5 :Relationship between shipping days (order_delivered_customer_date-order_purchase_timestamp)Vs review score
select
rew.review_score,
round(avg(datediff(ord.order_delivered_customer_date , order_purchase_timestamp)),0) as "avg shipping days"
from olist_dataset.olist_orders_dataset as ord
join olist_dataset.olist_order_reviews_dataset as rew on rew.order_id=ord.order_id
group by rew.review_score
order by rew.review_score;
