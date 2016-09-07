<article class="article article--{{ article.date | date('Y') }}">
  {% include "__date/article__date.html.swig" %}
  {% include "__title/article__title.html.swig" %}
  {% include "__number/article__number.html.swig" %}
</article>
