<section class="x-link-with-icon">
  <h3 class="title">Link with icon example</h3>

  {% set link = { 'title': 'Facebook', 'url': 'http://facebook.com', 'type': 'external' } %}
  {% set icon = { 'title': 'Facebook', 'name': 'facebook', 'link': link, 'klass': 'link-with-icon__icon' } %}
  {% include '../link-with-icon.html.swig' %}

  {% set link = { 'title': 'Twitter', 'url': 'http://twitterxxx.com', 'type': 'external' } %}
  {% set icon = { 'title': 'Twitter', 'name': 'twitter', 'link': link, 'klass': 'link-with-icon__icon' } %}
  {% include '../link-with-icon.html.swig' %}
</section>
