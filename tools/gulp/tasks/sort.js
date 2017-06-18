var gulp = require('gulp'),
    fs = require('fs');

gulp.task('sort', function() {
  var json = require('../../../code/links.json');

  function comp(a, b) {
    return new Date(a.date).getTime() - new Date(b.date).getTime();
  }

  json.sort(comp);
  console.log(json);

  fs.openSync('code/links-sorted.json', 'w');
  fs.appendFileSync('code/links-sorted.json', JSON.stringify(json));

});
