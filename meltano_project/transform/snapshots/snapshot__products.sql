{% snapshot snapshot__products %}

{{
    config(
      target_schema='muneeb_test',
      unique_key='product_id',
      strategy='check',
      check_cols=['all'],
    )
}}

select
    product_id,
    product_category_name,
    product_name_lenght,
    product_description_lenght,
    product_photos_qty,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
from {{ source('muneeb_test', 'products') }}

{% endsnapshot %}