{#
  title: SVG Inline
  description: Generate a container for inline SVG
#}

{% macro svginline(svg) -%}
  <div class="svg-inline {{ svg.klass }}">
{%- endmacro %}
