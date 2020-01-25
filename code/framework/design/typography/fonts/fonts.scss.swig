{% import "../../../helpers/classname/classname.swig" as c  %}

// Fonts
//
// Typefaces and fonts used across the site.
// They are never used directly but set up properly with the `text-style` mixin.
//
// Styleguide fonts

{% set local_fonts = [] %}

{% for font in fonts %}
// {{ font.name }}
// - {{ font.description }}, {{ font.family }}
// - character set: {{ font.character_set }}
// - served from {{ font.served_from }}
// - styles and weights: {% for style in font.styles %}{{ style.name }}, {% endfor %}
{% if font.served_from == "Google" %}
@import url(http://fonts.googleapis.com/css?family={{ font.google_font_id }}:{% for style in font.styles %}{{ style.id }},{% endfor %});
{% endif %}
{% endfor %}

// Font faces
{% for font in fonts %}{% if font.served_from == 'local' %}{% set font_name = c.classname(font.name) %}
{% set src = {} %}
{% for key, face in font.face %}
{% set format = face.format %}
{% set url = face.url %}
{% set src[key] = 'url(' + site.url + 'assets/fonts/' + url + ') format("' + format + '")' %}
{% endfor %}
@font-face {
  font-family: '{{ font_name }}';
  src: {{ src | join(', ') | safe }};
}
{% endif %}{% endfor %}

// The font mixin
@mixin font($variant) {
{% for font in fonts %}{% set font_name = c.classname(font.name) %}{% for style in font.styles %}{% set style_name = c.classname(style.name ) %}
  @if ($variant == '{{ font_name }}-{{ style_name }}') {
    font-family: '{{ font_name }}', {{ font.family }};
    font-weight: {{ style.weight }};
    font-style: {{ style.style }};
  }
  {% endfor %}{% endfor %}
}


// Font classes
{% for font in fonts %}{% set font_name = c.classname(font.name) %}{% for style in font.styles %}{% set style_name = c.classname(style.name ) %}
.{{ font_name }}-{{ style_name }} {
  font-family: '{{ font_name }}', {{ font.family }};
  font-weight: {{ style.weight }};
  font-style: {{ style.style }};
}
{% endfor %}{% endfor %}
