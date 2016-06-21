<nav class="slider__bullets {{ klass }}">
  <h3>Navigation bullets</h3>

  {% for slide in slides %}
    {% include 'bullet/bullet.html.swig' %}
  {% endfor %}
</nav>
