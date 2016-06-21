{% import "../../../../helpers/link/link.swig" as l  %}


<div class="blockquote-with-source">
  {% include '../blockquote/blockquote.html.swig' %}

  {{ l.link(quote.link) }}{{ quote.link.title }}</a>
</div>
