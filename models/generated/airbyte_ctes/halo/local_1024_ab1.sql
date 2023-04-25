{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_halo",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ source('halo', '_airbyte_raw_local_1024') }}
select
    {{ json_extract_scalar('_airbyte_data', ['string'], ['string']) }} as {{ adapter.quote('string') }},
    {{ json_extract_scalar('_airbyte_data', ['index'], ['index']) }} as {{ adapter.quote('index') }},
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ source('halo', '_airbyte_raw_local_1024') }} as table_alias
-- local_1024
where 1 = 1

