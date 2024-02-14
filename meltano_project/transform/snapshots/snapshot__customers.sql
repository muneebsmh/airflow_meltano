{% snapshot snapshot__customers %}

{{
    config(
      target_schema='muneeb_test',
      unique_key='customer_id',
      strategy='check',
      check_cols=['all'],
    )
}}

select
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
from {{ source('muneeb_test', 'customers') }}

{% endsnapshot %}