
with     customers as 
( select * from {{ ref('stg_customers')}}) , 

     orders as 
( SELECT * from {{ ref('stg_orders')}}) , 

 customer_orders as 
 ( SELECT 
    
 customers.customer_id , 
 orders.order_id
  from customers
  left join orders using (customer_id) ) ,

  payment as 
  ( select * from {{ ref('stg_payments')}} ) , 

  final as 
   ( SELECT 
     customer_orders.customer_id , 
     customer_orders.order_id ,
     payment.amount
   FROM customer_orders 
   left join payment 
   using ( order_id ))

  SELECT * FROM final

