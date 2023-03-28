{% macro rename_segment(column_name) %}
    CASE
      WHEN {{column_name}} in ('BUILDING','HOUSEHOLD','FURNITURE')
        THEN 'segment_1'
      ELSE 'segment_2'
    END
{% endmacro %}
