{% import "../../helpers/link/link.swig" as l  %}

{% set klass = "figure" %}
{% if image.class %}
  {% set klass = "figure {{ image.class }}" %}
{% endif %}

<figure class="{{ klass }}">
  {% if image.link %}{{ l.link(link) }}{% endif %}

  <!-- The default extension is .png but other formats are handled too -->
  {% set extension = '.png' %}
  {% if image.extension %}
    {% set extension = image.extension %}
  {% endif %}

  <!-- If 'onesize' is set all images will have the same size -->
  {% if image.onesize %}
    {% set desktop = image.name + "_" + image.onesize + extension %}
    {% set desktop2x = image.name + "_" + image.onesize + '2x' + extension %}
    {% set laptop = image.name + "_" + image.onesize + extension %}
    {% set laptop2x = image.name + "_" + image.onesize + '2x' + extension %}
    {% set tablet = image.name + "_" + image.onesize + extension %}
    {% set tablet2x = image.name + "_" + image.onesize + '2x' + extension %}
    {% set mobile = image.name + "_" + image.onesize + extension %}
    {% set mobile2x = image.name + "_" + image.onesize + '2x' + extension %}
  {% else %}
    <!-- Naming convention for responsive images -->
    {% set desktop = image.name + '_desktop' + extension %}
    {% set desktop2x = image.name + '_desktop2x' + extension %}
    {% set laptop = image.name + '_laptop' + extension %}
    {% set laptop2x = image.name + '_laptop2x' + extension %}
    {% set tablet = image.name + '_tablet' + extension %}
    {% set tablet2x = image.name + '_tablet2x' + extension %}
    {% set mobile = image.name + '_mobile' + extension %}
    {% set mobile2x = image.name + '_mobile2x' + extension %}
  {% endif %}

  <!-- Showing different images for different devices -->
  {% for responsive in image.responsive %}
    {% if responsive.breakpoint == 'desktop' %}
      {% set desktop = responsive.name + '_desktop' + extension %}
      {% set desktop2x = responsive.name + '_desktop2x' + extension %}
    {% endif %}
    {% if responsive.breakpoint == 'laptop' %}
      {% set laptop = responsive.name + '_laptop' + extension %}
      {% set laptop2x = responsive.name + '_laptop2x' + extension %}
    {% endif %}
    {% if responsive.breakpoint == 'tablet' %}
      {% set tablet = responsive.name + '_tablet' + extension %}
      {% set tablet2x = responsive.name + '_tablet2x' + extension %}
    {% endif %}
    {% if responsive.breakpoint == 'mobile' %}
      {% set mobile = responsive.name + '_mobile' + extension %}
      {% set mobile2x = responsive.name + '_mobile2x' + extension %}
    {% endif %}
  {% endfor %}


  <!-- Figcaption is image title unless is not set explicitely -->
  {% set figcaption = image.title %}
  {% set figcaption_class = 'figcaption--from-title' %}

  {% if image.figcaption %}
    {% set figcaption = image.figcaption %}
    {% set figcaption_class = 'figcaption' %}
  {% endif %}


  <!-- Image url can be relative or absolute -->
  {% set site_url = site.url %}
  {% if image.site_url %}
    {% set site_url = image.site_url %}
  {% endif %}


  <picture class="picture">
    <!--[if IE 9]><video style="display: none;"><![endif]-->
    <source media="(min-width: 1600px)" srcset="{{ site_url }}{{ site.images }}{{ desktop }}, {{ site_url }}{{ site.images }}{{ desktop2x }} 2x">
    <source media="(min-width: 1024px)" srcset="{{ site_url }}{{ site.images }}{{ laptop }}, {{ site_url }}{{ site.images }}{{ laptop2x }} 2x">
    <source media="(min-width: 600px)" srcset="{{ site_url }}{{ site.images }}{{ tablet }}, {{ site_url }}{{ site.images }}{{ tablet2x }} 2x">
    <source media="(max-width: 599px)" srcset="{{ site_url }}{{ site.images }}{{ mobile }}, {{ site_url }}{{ site.images }}{{ mobile2x }} 2x">
    <!--[if IE 9]></video><![endif]-->
    <!-- to make it work with imagesLoaded the 'srcset' is replaced by a standard fallback 'src' -->
    <img class="img" src="{{ site_url }}{{ site.images }}{{ laptop }}" alt="{{ image.title }}">
  </picture>

  <figcaption class="figcaption {{ figcaption_class }}">
    {{ figcaption | safe }}
  </figcaption>

{% if image.link %}</a>{% endif %}
</figure>
