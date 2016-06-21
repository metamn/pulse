// KSS
//
// - collect KSS documentation from all components having an SCSS file and save into component-name.json.kss
// - later this .json file can be processed by the styleguide

// Plugins
var gulp = require('gulp'),
    fs = require('fs'),
    gulpkss = require('kss'),

    plumber = require('gulp-plumber'),
    onError = require('../utils/onError'),
    data = require('gulp-data'),
    path = require('path');


// Configuration
var paths = require('./../config');


gulp.task('kss', function() {
  return gulp.src(paths.kss_src)
    .pipe(plumber({errorHandler: onError}))
    .pipe(data(function(fileName) {
      var name = path.basename(fileName.path);
      
      // At this stage we want to generate a KSS entry for all components, and store at the component folder
      // If the kss for the config.scss is generated it will contain all KSS entries across the site
      // That would be useful for other purposes

      if (name != "config.scss") {
        var dest = fileName.path.replace('.scss', '.kss');
        var dir = path.dirname(fileName.path);
        gulpkss.traverse(dir, { mask: '*.scss', markdown: true }, function(err, styleguide) {
          if (err) throw err;
          fs.writeFileSync(dest, JSON.stringify(styleguide.section(), null, 2));
        });

      }
    }))
});
