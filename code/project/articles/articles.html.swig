<section class="articles">
  <h3>Links</h3>

  {% set total = articles.length %}

  {% for link in articles | reverse %}
    {% if !loop.first %}
      {% include "../link/link.html.swig" %}
    {% endif %}
  {% endfor %}
</section>
