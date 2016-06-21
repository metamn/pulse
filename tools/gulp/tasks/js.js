// JS
//
// - compile .js files with Webpack, minimize it and move to the destination
//
// Styleguide js

// Plugins
var gulp = require('gulp'),
    plumber = require('gulp-plumber'),
    onError = require('../utils/onError'),
    
    uglify = require('gulp-uglify'),
    webpack = require('webpack-stream');


// Configuration
var paths = require('./../config');


var js = function(webpack_config, dest) {
  return gulp.src('')
    .pipe(plumber({errorHandler: onError}))
    .pipe(webpack(require(webpack_config)))
    //.pipe(uglify())
    .pipe(gulp.dest(dest));
};


// Task for concatenating, minifying and moving .js files to destination
gulp.task('js', function() {
  js(paths.js_webpack_config, paths.js_dest);
});
