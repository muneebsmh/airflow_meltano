{% snapshot snapshot__product_translations %}

{{
    config(
      target_schema='muneeb_test',
      unique_key='product_category_name',
      strategy='check',
      check_cols=['all'],
    )
}}

select
    product_category_name,
    product_category_name_english
from {{ source('muneeb_test', 'product_translations') }}

{% endsnapshot %}