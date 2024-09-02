#KPI 2:Number of orders with review score 5 and payment type as credit card.
select
count(pmt.order_id)as Total_orders
from olist_dataset.olist_order_payments_dataset pmt
inner join olist_dataset.olist_order_reviews_dataset rev on pmt.order_id = rev.order_id
where rev.review_score=5 
and pmt.payment_type="credit_card" ;