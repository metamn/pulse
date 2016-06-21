<section class="x-icon">
  <h3 class="title">Icon examples</h3>

  {% set icon = { 'title': 'Twitter w/o link', 'name': 'twitter' } %}
  {% include '../icon.html.swig' %}

  {% set link = { 'klass': 'icon__link', 'title': 'Visit FB', 'url': 'htpp://facebook.com', 'type': 'external'} %}
  {% set icon = { 'title': 'Visit FB', 'name': 'facebook', 'link': link } %}
  {% include '../icon.html.swig' %}
</section>
