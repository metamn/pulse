<section class="x-arrow-with-triangle">
  <h3 class="title">Arrow with triangle example</h3>

  {% set direction = "right" %}
  {% include '../arrow-with-triangle.html.swig' %}

  {% set direction = "left" %}
  {% include '../arrow-with-triangle.html.swig' %}

  {% set direction = "top" %}
  {% include '../arrow-with-triangle.html.swig' %}

  {% set direction = "bottom" %}
  {% include '../arrow-with-triangle.html.swig' %}
</section>
