{{
    config(
        target_schema='muneeb_test',
        materialized='table',
        depends_on=['snapshot__products','snapshot__product_translations']
    )
}}
with stg__products as (
    select * from
    {{ ref('snapshot__products') }}
),
stg__product_translations as (
    select * from
    {{ ref('snapshot__product_translations') }}
)
select
    md5(stg__products.product_id) as product_key,
    stg__products.product_id,
    stg__products.product_category_name,
    stg__product_translations.product_category_name_english,
    stg__products.product_name_lenght,
    stg__products.product_description_lenght,
    stg__products.product_photos_qty,
    stg__products.product_weight_g,
    stg__products.product_length_cm,
    stg__products.product_height_cm,
    stg__products.product_width_cm
from stg__products
inner join stg__product_translations
on stg__products.product_category_name = stg__product_translations.product_category_name