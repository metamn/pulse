{#
  title: Button
  description: The header of a button. Button content can be added after this header
  bug in Firefox: https://github.com/philipwalton/flexbugs/issues/16
  instead of `<button>` we will use `<div>`
#}


{% macro button(klass) -%}
  <div class="button {{ klass }}">
{%- endmacro %}
