<footer class="footer">
  <h3>Footer</h3>

  {% set link = { 'title': site.title, 'url': site.url, 'type': 'external', 'klass': 'flip pulse' } %}
  {% include '../logo/logo.html.swig' %}

  by

  {% set link = { 'title': 'Metamn', 'url': 'http://metamn.io', 'type': 'external', 'klass': 'flip metamn' } %}
  {% include '../logo/logo.html.swig' %}
</footer>
