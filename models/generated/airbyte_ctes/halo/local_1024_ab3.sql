{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_halo",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('local_1024_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        adapter.quote('string'),
        adapter.quote('index'),
    ]) }} as _airbyte_local_1024_hashid,
    tmp.*
from {{ ref('local_1024_ab2') }} tmp
-- local_1024
where 1 = 1

