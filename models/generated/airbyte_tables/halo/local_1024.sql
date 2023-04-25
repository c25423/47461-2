{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "halo",
    post_hook = ["
                    {%
                        set scd_table_relation = adapter.get_relation(
                            database=this.database,
                            schema=this.schema,
                            identifier='local_1024_scd'
                        )
                    %}
                    {%
                        if scd_table_relation is not none
                    %}
                    {%
                            do adapter.drop_relation(scd_table_relation)
                    %}
                    {% endif %}
                        "],
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('local_1024_ab3') }}
select
    {{ adapter.quote('string') }},
    {{ adapter.quote('index') }},
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_local_1024_hashid
from {{ ref('local_1024_ab3') }}
-- local_1024 from {{ source('halo', '_airbyte_raw_local_1024') }}
where 1 = 1

