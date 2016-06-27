<section class="articles">
  <h3>Articles</h3>

  {% set total = links.length %}

  {% for article in links | reverse %}
    {% if !loop.first %}
      {% include "../article/article.html.swig" %}
    {% endif %}
  {% endfor %}
</section>
