<h3 class="link__title">
  {% set l = { title: link.subject, url: link.link, type: "external" } %}
  {% set link = l %}
  {% include "../../../framework/design/typography/elements/link/link.html.swig" %}
</h3>
