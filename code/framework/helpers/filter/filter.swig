{% macro filter(prefix, items) -%}
  {% set result = '' %}
  {% for item in items %}
    {% set result = result + prefix + '-' + item + ' ' %}
  {% endfor %}
  {{ result }}
{%- endmacro %}
