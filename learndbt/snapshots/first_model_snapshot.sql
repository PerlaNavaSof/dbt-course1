{% snapshot first_model_snapshot %}
    {{
        config(
          target_database='dbt_course1',
          target_schema='snapshots',
          unique_key='id',

          strategy='timestamp',
          updated_at='updated_at',
        )
    }}
    -- Pro-Tip: Use sources in snapshots!
    select * from {{ ref('my_first_dbt_model') }}

{% endsnapshot %}