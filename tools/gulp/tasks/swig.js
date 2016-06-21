// SWIG
//
// Compile .swig files into .html, .scss or .js
// - .swig files has to have two extensions like colors.scss.swig or page.html.swig. Once compiled the .swig extension will be removed.
// - if there is a YAML Front Matter definition in a .swig file it will be processed
// - if there is an associated .json file it will be processed (ie. colors.scss.swig will look for colors.scss.json)
// - when generating the styleguide the associated .json file from site will be used. For example colors.scss.json from site will be available for colors.scss.swig in the styleguide
// - the global 'config.json' will be processed
// - when generating the styleguide the global 'styleguide/config.json' will be processed
// - the global 'kss.json' file will be processed
//
// Styleguide swig


// Plugins
var gulp = require('gulp'),
    plumber = require('gulp-plumber'),
    rename = require('gulp-rename'),

    swig = require('gulp-swig'),
    data = require('gulp-data'),
    fs = require('fs'),
    path = require('path'),
    onError = require('../utils/onError'),
    getJSONData = require('../utils/getJSONData');


// Configuration
var paths = require('./../config');



var _swig = function(source, dest, config, grabJSON) {
  return gulp.src(source)
    .pipe(plumber({errorHandler: onError}))

    // load JSONs
    .pipe(data(getJSONData))
    .pipe(swig({
      defaults: {
        cache: false,
        locals: {
          // Load site-wide JSON settings
          site: require(config),
        }
      }
    }))

    .pipe(rename({ extname: '' }))
    .pipe(gulp.dest(dest));
}


// Task for compiling .swig files from /site
gulp.task('swig', function() {
  _swig(paths.swig_src, paths.swig_dest, paths.config_json);
});
