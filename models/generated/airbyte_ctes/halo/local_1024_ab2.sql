{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_halo",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('local_1024_ab1') }}
select
    cast({{ adapter.quote('string') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('string') }},
    cast({{ adapter.quote('index') }} as {{ dbt_utils.type_bigint() }}) as {{ adapter.quote('index') }},
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('local_1024_ab1') }}
-- local_1024
where 1 = 1

