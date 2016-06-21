{% import "../../../../helpers/link/link.swig" as l  %}

<div class="link-with-icon link-with-icon--{{ icon.name }}">
  {% include '../../../decorations/icon/icon.html.swig' %}
  <span class="link-with-icon__link">{{ l.link(link) }}{{ link.title | safe }}</a></span>
</div>
