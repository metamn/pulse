<article class="year year--{{ year.year }}">
  <h3 class="year__title">{{ year.year }}</h3>

  <ul class="ul year__topics">
    {% for topic in year.topics %}
      <li class="li">{{ topic }}</li>
    {% endfor %}
  </ul>
</article>
