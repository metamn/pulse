{#
  title: Slider
  description: The header of a slider. Slides can be added after this header
#}


{% macro slider(title, klass) -%}
  <section class="slider {{ klass }}">
    <h3 class="slider__title">{{ title }}</h3>

    <div class="slider__slides">
{%- endmacro %}
