{% import "../../../framework/helpers/includejs/includejs.swig" as j  %}
{% set scripts = j.includejs(site.javascripts.footer) %}

{{ scripts | safe }}

</body>
</html>
