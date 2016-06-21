{#
  title: Classname
  description: Generate a classname from a string
  example:
    - This is a string => this-is-a-string
#}

{% macro classname(string) -%}
  {{ string | lower | replace(',', '', 'g') | replace('&', 'and', 'g') | replace("'", '', 'g') | replace('"', '', 'g') | replace(' ', '-', 'g') }}
{%- endmacro %}
