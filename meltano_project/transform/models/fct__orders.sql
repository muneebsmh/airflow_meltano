{{
    config(
        target_schema='muneeb_test',
        materialized='table'
    )
}}
with stg__orders as (
    select * from
    {{ ref('stg__orders') }}
), stg__order_items as (
    select * from
    {{ ref('stg__order_items') }}
), stg__order_payments as (
    select * from
    {{ ref('stg__order_payments') }}
), stg__order_reviews as (
    select * from
    {{ ref('stg__order_reviews') }}
)
select
    md5(concat(stg__orders.order_id,stg__order_items.order_item_id)) order_key,
    md5(stg__orders.customer_id) as customer_key,
    md5(stg__order_items.product_id) as product_key,
    md5(stg__order_items.seller_id) as seller_key,
    stg__orders.order_id,
    stg__orders.customer_id,
    stg__orders.order_status,
    stg__orders.order_purchase_timestamp,
    stg__orders.order_approved_at,
    stg__orders.order_delivered_carrier_date,
    stg__orders.order_delivered_customer_date,
    stg__orders.order_estimated_delivery_date,
    stg__order_items.order_item_id,
    stg__order_items.product_id,
    stg__order_items.seller_id,
    stg__order_items.shipping_limit_date,
    stg__order_items.price,
    stg__order_items.freight_value,
    stg__order_payments.payment_sequential,
    stg__order_payments.payment_type,
    stg__order_payments.payment_installments,
    stg__order_payments.payment_value,
    stg__order_reviews.review_id,
    stg__order_reviews.review_score,
    stg__order_reviews.review_comment_title,
    stg__order_reviews.review_comment_message,
    stg__order_reviews.review_creation_date,
    stg__order_reviews.review_answer_timestamp
from stg__orders
inner join stg__order_items on stg__orders.order_id = stg__order_items.order_id
inner join stg__order_payments on stg__orders.order_id = stg__order_payments.order_id
inner join stg__order_reviews on stg__orders.order_id = stg__order_reviews.order_id