{% import "../../../../helpers/link/link.swig" as l  %}
{{ l.link(link) }}
  {% set text = link.title %}
  {% include '../../../../behavior/flip/flip.html.swig' %}
</a>
