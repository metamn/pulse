<h3 class="article__title">
  {% set link = { title: article.subject, url: article.link, type: "external" } %}
  {% include "../../../framework/design/typography/elements/link/link.html.swig" %}
</h3>
