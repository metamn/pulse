{#
  title: Menu
  description: The header of a menu. Items can be added after this header
#}


{% macro menu(title, klass) -%}
  <nav class="menu {{ klass }}">
    <h3 class="menu__title">{{ title }}</h3>

    {% include '../../design/decorations/icon-hamburger/icon-hamburger.html.swig' %}
{%- endmacro %}
