{% import "../../../helpers/link/link.swig" as l  %}
<div class="icon icon--{{ icon.name }} {{ icon.klass }}">
  {% if icon.link %}{{ l.link(link) }}{% endif %}

  <svg class="svg">
    <use xlink:href="#icon-{{ icon.name }}"></use>
  </svg>

  <span class="text">{{ icon.title }}</span>

  {% if icon.link %}</a>{% endif %}
</div>
