<ol class="ol-with-circle">
  {% for item in list %}
    <li class="ol-with-circle__item">
      <span class="number">{{ loop.index }}</span>
      <span class="text">{{ item | safe }}</span>
    </li>
  {% endfor %}
</ol>
