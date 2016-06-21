// SCSS
//
// - compile the global .scss files (site.scss, styleguide.scss) with autoprefixer, minify them, and move them to destination together with the sourcemaps
//
// - the global .scss file should be in charge @importing all other .scss files from /components
// - the import should be done in the right order otherwise some mixins might not be found
//
// Styleguide scss

// Plugins
var gulp = require('gulp'),
    plumber = require('gulp-plumber'),
    onError = require('../utils/onError'),

    sass = require('gulp-sass'),
    cssGlobbing = require('gulp-css-globbing'),
    sourcemaps = require('gulp-sourcemaps'),
    postcss = require('gulp-postcss'),
    autoprefixer = require('autoprefixer-core'),
    minifyCSS = require('gulp-minify-css'),
    rename = require('gulp-rename');


// Configuration
var paths = require('./../config');



var _scss = function(source, dest, dest_name) {
  return gulp.src(source)
    .pipe(plumber({errorHandler: onError}))
    .pipe(cssGlobbing({
      extensions: ['.scss']
    }))
    .pipe(sourcemaps.init())
    .pipe(sass())
    .pipe(postcss([ autoprefixer() ]))
    .pipe(minifyCSS())
    .pipe(rename(dest_name))
    .pipe(sourcemaps.write('.'))
    .pipe(gulp.dest(dest));
}


// Task for compiling and movind the .css to destination
gulp.task('scss', function(){
  _scss(paths.scss_src, paths.scss_dest, paths.scss_dest_name);
});
