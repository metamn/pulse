{% import '../../../helpers/slider/slider.swig' as s %}

<section class="x-slider">
  <h3 class='title'>Slider examples</h3>

  {{ s.slider('Demo slider', 'demo-slider') }}
    {% for slide in slides %}
      {% include 'x-slide/x-slide.html.swig' %}
    {% endfor %}
    </div>
  </section>

  {% set klass = 'demo-slider' %}
  {% include '../__bullets/slider__bullets.html.swig' %}




  {{ s.slider('Demo slider', 'demo-slider-2') }}
    {% for slide in slides %}
      {% include 'x-slide/x-slide.html.swig' %}
    {% endfor %}
    </div>
  </section>

  {% set klass = 'demo-slider-2' %}
  {% include '../__bullets/slider__bullets.html.swig' %}
</section>
