with 
  payment
as 
 ( select id as order_id ,
       amount
 from `dbt-tutorial.stripe.payment` )

 SELECT * FROM payment