{% import "../../../framework/helpers/classname/classname.swig" as c  %}
{% set classname = c.classname(title) %}

{% import "../../../framework/helpers/pagetitle/pagetitle.swig" as t  %}
{% set page_title = t.pagetitle(title, site.title) %}

{% import "../../../framework/helpers/includejs/includejs.swig" as j  %}
{% set scripts = j.includejs(site.javascripts.header) %}

<!doctype html>
<html lang="en" class="{{ classname }}">
  <head>
    {% include '__meta/head__meta.html.swig' %}

    <title>{{ page_title | safe }}</title>
    <link href="{{ site.url }}{{ site.styles }}site.min.css" media="screen, projection" rel="stylesheet" type="text/css" />
    {{ scripts | safe }}

    {% include '__favicon/--extended/head__favicon--extended.html.swig' %}
  </head>

  <body>
