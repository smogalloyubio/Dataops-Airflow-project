{% test non_negative(model, column_name) %}

select
    {{ column_name }} as invalid_column
from {{ model }}
where {{ column_name }} <= 0

{% endtest %}


{% test not_negative(model, column_name) %}

select
    {{ column_name }} as invalid_column
from {{ model }}
where {{ column_name }} < 0

{% endtest %}


{% test between_values(model, column_name, min_value, max_value) %}

select
    {{ column_name }} as invalid_value
from {{ model }}
where {{ column_name }} < {{ min_value }}
   or {{ column_name }} > {{ max_value }}

{% endtest %}