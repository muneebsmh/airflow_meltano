{% snapshot snapshot__sellers %}

{{
    config(
      target_schema='muneeb_test',
      unique_key='seller_id',
      strategy='check',
      check_cols=['all'],
    )
}}

select
    seller_id,
    seller_zip_code_prefix,
    seller_city,
    seller_state
from {{ source('muneeb_test', 'sellers') }}

{% endsnapshot %}