<section class="links">
  <h3>Links</h3>

  {% set total = links.length %}

  {% for link in links | reverse %}
    {% if !loop.first %}
      {% include "../link/link.html.swig" %}
    {% endif %}
  {% endfor %}
</section>
