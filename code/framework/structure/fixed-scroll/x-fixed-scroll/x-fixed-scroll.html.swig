<section class="x-fixed-scroll">
  <h3>Fixed scroll example</h3>

  <p class="placeholder">This is a placeholder</p>

  {% set to_display = ['title', 'thumb'] %}
  {% set collection = 'articles' %}

  <div class="fixed-scroll">
    {% for slide in slides %}
      <section class="fixed-scroll__slide">
        <h3 class="title">{{ slide.title }}</h3>

        <div class="content">
          {% for item in articles %}
            {% include '../../list-item/list-item.html.swig' %}
          {% endfor %}
        </div>
      </section>
    {% endfor %}
  </div>

  <p class="placeholder">This is a placeholder</p>
</section>
