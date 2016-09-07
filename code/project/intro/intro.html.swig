<section class="intro">
  <h3>Intro</h3>

  {% set link = { 'title': site.title, 'url': site.url, 'type': 'external', 'klass': 'flip pulse' } %}
  {% for year in years %}
    {% include '../logo/logo.html.swig' %}
  {% endfor %}

  {% include '../about/about.html.swig' %}
  {% include '../arrows/arrows.html.swig' %}
  {% include "../years/years.html.swig" %}
  {% include '../arrows/arrows.html.swig' %}
</section>
