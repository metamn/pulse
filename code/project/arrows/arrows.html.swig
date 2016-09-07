<article class="arrows">
  <h3>Arrows</h3>

  {% for year in years %}
    {% set direction = "bottom" %}
    {% include '../../framework/design/decorations/arrow-with-triangle/arrow-with-triangle.html.swig' %}
  {% endfor %}
</article>
