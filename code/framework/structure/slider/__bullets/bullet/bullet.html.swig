{% import '../../../../helpers/button/button.swig' as b %}

{% set klass = '' %}
{% if loop.first %}
  {% set klass="bullet--active" %}
{% endif %}

{{ b.button('bullet ' + klass) }}
  <span class="span inactive">O</span>
  <span class="span active">&bull;</span>
</div>
