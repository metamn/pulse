<h3 class="article__title">
  {% set l = { title: article.subject, url: article.article, type: "external" } %}
  {% set link= l %}
  {% include "../../../framework/design/typography/elements/link/link.html.swig" %}
</h3>
