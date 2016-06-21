<section class="x-link">
  <h3 class="title">Link example</h3>

  {% set link = { 'title': 'Visited', 'url': 'http://metamn.io', 'type': 'external' } %}
  {% include '../link.html.swig' %}

  {% set link = { 'title': 'Not visited', 'url': 'http://metamn.io/workssssssss', 'type': 'external' } %}
  {% include '../link.html.swig' %}
</section>
