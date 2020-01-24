// Fonts
//
// - Move fonts from `@assets/fonts` to destination
//
// Styleguide jsVendor

// Plugins
var gulp = require("gulp"),
  plumber = require("gulp-plumber"),
  onError = require("../utils/onError"),
  path = require("path"),
  rename = require("gulp-rename");

// Configuration
var paths = require("./../config");

var fonts = function(source, dest) {
  return gulp
    .src(source)
    .pipe(plumber({ errorHandler: onError }))
    .pipe(rename({ dirname: "" }))
    .pipe(gulp.dest(dest));
};

// Task for concatenating external .js files to destination
gulp.task("fonts", function() {
  fonts(paths.fonts_src, paths.fonts_dest);
});
