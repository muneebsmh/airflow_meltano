{{
    config(
        target_schema='muneeb_test',
        materialized='table'
    )
}}
with fct__orders as (
    select * from
    {{ ref('fct__orders') }}
), dim__customers as (
    select * from
    {{ ref('dim__customers') }}
), dim__products as (
    select * from
    {{ ref('dim__products') }}
), dim__sellers as (
    select * from
    {{ ref('dim__sellers') }}
)
select
    fct__orders.order_key,
    fct__orders.order_id,
    fct__orders.order_status,
    fct__orders.order_purchase_timestamp,
    fct__orders.order_approved_at,
    fct__orders.order_delivered_carrier_date,
    fct__orders.order_delivered_customer_date,
    fct__orders.order_estimated_delivery_date,
    fct__orders.customer_key,
    dim__customers.customer_id,
    dim__customers.customer_unique_id,
    dim__customers.customer_zip_code_prefix,
    dim__customers.customer_city,
    dim__customers.customer_state,
    fct__orders.product_key,
    fct__orders.product_id,
    dim__products.product_category_name,
    dim__products.product_category_name_english,
    dim__products.product_name_lenght,
    dim__products.product_description_lenght,
    dim__products.product_photos_qty,
    dim__products.product_weight_g,
    dim__products.product_length_cm,
    dim__products.product_height_cm,
    dim__products.product_width_cm,
    fct__orders.order_item_id,
    fct__orders.shipping_limit_date,
    fct__orders.price,
    fct__orders.freight_value,
    fct__orders.payment_sequential,
    fct__orders.payment_type,
    fct__orders.payment_installments,
    fct__orders.payment_value,
    fct__orders.seller_key,
    fct__orders.seller_id,
    dim__sellers.seller_zip_code_prefix,
    dim__sellers.seller_city,
    dim__sellers.seller_state,
    fct__orders.review_id,
    fct__orders.review_score,
    fct__orders.review_comment_title,
    fct__orders.review_comment_message,
    fct__orders.review_creation_date,
    fct__orders.review_answer_timestamp
from fct__orders
inner join dim__customers on fct__orders.customer_key = dim__customers.customer_key
inner join dim__products on fct__orders.product_key = dim__products.product_key
inner join dim__sellers on fct__orders.seller_key = dim__sellers.seller_key