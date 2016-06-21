// JS Vendor
//
// - concat external vendor libraries from `@assets/scripts` into a `vendor.js` file and move it to destination
//
// Styleguide jsVendor

// Plugins
var gulp = require('gulp'),
    plumber = require('gulp-plumber'),
    onError = require('../utils/onError'),

    path = require('path'),
    gulpif = require('gulp-if'),
    concat = require('gulp-concat');


// Configuration
var paths = require('./../config');


// Where are the external files
var externalFiles = function(file) {
  if (file.path.indexOf('@assets/scripts') != -1) {
    console.log('Concat to vendors.js: ' + path.basename(file.path));
    return true;
  } else {
    return false;
  }
}


var jsVendor = function(source, dest_name, dest) {
  return gulp.src(source)
    .pipe(plumber({errorHandler: onError}))
    .pipe(gulpif(externalFiles, concat(dest_name)))
    .pipe(gulp.dest(dest));
};


// Task for concatenating external .js files to destination
gulp.task('jsVendor', function() {
  jsVendor(paths.js_external_src, paths.js_external_dest_name, paths.js_dest);
});
