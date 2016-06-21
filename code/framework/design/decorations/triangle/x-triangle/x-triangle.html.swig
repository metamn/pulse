<section class="x-triangle">
  <h3 class="title">Triangle example</h3>

  {% set direction = "right" %}
  {% include '../triangle.html.swig' %}

  {% set direction = "left" %}
  {% include '../triangle.html.swig' %}

  {% set direction = "top" %}
  {% include '../triangle.html.swig' %}

  {% set direction = "bottom" %}
  {% include '../triangle.html.swig' %}
</section>
