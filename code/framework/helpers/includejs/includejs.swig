{#
  title: Include Javascripts
  description: Include scripts into the source code
  bug: async will be transfomed by | safe SWIG filter into async= so we will not use
#}

{% macro includejs(scripts) -%}
  {% for script in scripts %}
    {% if script.type == "external" %}
      {% set url = "" %}
    {% else %}
      {% set url = site.url + site.scripts %}
    {% endif %}

    {% if script.mime %}
      <script type="{{ script.mime }}" canvas="{{ script.canvas }}" src="{{ url }}{{ script.file }}"></script>
    {% else %}
      <script src="{{ url }}{{ script.file }}"></script>
    {% endif %}
  {% endfor %}
{%- endmacro %}
