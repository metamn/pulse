{% import '../../../helpers/svginline/svginline.swig' as s %}

<section class="x-svg-inline">
  <h3 class="x-svg-inline__title">SVG inline examples</h3>

  <p>Fluid SVG</p>
  {{ s.svginline(null) }}
    {% include 'test-fluid.svg' %}
  </div>

  <p>Full screen SVG</p>
  {% set svg = { 'klass': 'svg-inline--fullscreen' } %}
  {{ s.svginline(svg) }}
    {% include 'test-fluid.svg' %}
  </div>

  <p>Responsive SVG</p>
  {% set svg = { 'klass': 'svg-inline--responsive' } %}
  {{ s.svginline(svg) }}
    {% include 'test-portrait.svg' %}
    {% include 'test-landscape.svg' %}
  </div>
</section>
