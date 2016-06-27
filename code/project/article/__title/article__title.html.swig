<h3 class="article__title">
  {% set l = { title: article.subject, url: article.article, type: "external" } %}
  {% set article = l %}
  {% include "../../../framework/design/typography/elements/article/article.html.swig" %}
</h3>
