{#
  title: Page title
  description: Generate page title
  example:
    - Work, Metamn => Work -- Metamn
    - Home, Metamn => Metamn
#}

{% macro pagetitle(page_title, site_title) -%}
  {% if page_title == "Home" %}{{ site_title }}{% else %}{{ page_title }} &mdash; {{ site.title }}{% endif %}
{%- endmacro %}
