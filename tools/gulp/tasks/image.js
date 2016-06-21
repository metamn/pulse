// Images

// Plugins
var gulp = require('gulp'),
    plumber = require('gulp-plumber'),
    onError = require('../utils/onError'),
    getJSONData = require('../utils/getJSONData'),

    rename = require('gulp-rename'),
    data = require('gulp-data'),
    fs = require('fs'),
    imageResize = require('gulp-image-resize'),
    gulpif = require('gulp-if'),

    imagemin = require('gulp-imagemin'),
    pngquant = require('imagemin-pngquant');

// Configuration
var paths = require('./../config');



// Resize a single image with ImageMagick
var _imageResize = function(file, sizeType, size, name, dest) {
  console.log("Resizing " + file + " " + sizeType + " to " + size);
  gulp.src(file)
    .pipe(plumber({errorHandler: onError}))
    .pipe(gulpif(sizeType == 'height',
      imageResize({
        height : size,
        sharpen: true,
        imageMagick: true
      }),
      imageResize({
        width : size,
        sharpen: true,
        imageMagick: true
      })
    ))
    .pipe(rename(function (path) { path.basename += "_" + name; }))
    .pipe(gulp.dest(dest));
}




// Resize an image to 1x and 2x
var imageSize = function(file, data, dest) {
  sizes = data.sizes;
  resize = data.resize;
  if (sizes && (resize == "true")) {
    for (i in sizes) {

      // Width or height?
      size = sizes[i].width;
      sizeType = 'width';
      if (typeof sizes[i].height !== 'undefined') {
        size = sizes[i].height;
        sizeType = 'height';
      }

      // Normal and retina
      _imageResize(file, sizeType, size, sizes[i].name, dest);
      _imageResize(file, sizeType, size * 2, sizes[i].name + '2x', dest);
    }

  } else {
    console.log('No resize needed.');
  }
}



// Optimize images from a folder
var imageOptimize = function(data, dest) {
  optimize = data.optimize
  if (optimize && (optimize == "true")) {
    return gulp.src(dest + paths.image_ext)
      .pipe(plumber({errorHandler: onError}))
      .pipe(imagemin({
        progressive: true,
        svgoPlugins: [{removeViewBox: false}],
        use: [pngquant()]
      }))
      .pipe(gulp.dest(dest));
  } else {
    console.log('No optimization needed.');
  }
}



// Move image(s) to destination
// - if in the image .json file we have "destination" set the image will be moved there
// - otherwise all resized & optimized images from '/resized' will be moved to dest
var imageMove = function(file, data, dest) {
  destination = data.destination
  if (destination) {
    console.log('Moving a single image ...');
    return gulp.src(file)
      .pipe(plumber({errorHandler: onError}))
      .pipe(gulp.dest(destination))
  } else {
    console.log('Moving resized & optimized images ...');
    return gulp.src(dest + paths.image_ext)
      .pipe(plumber({errorHandler: onError}))
      .pipe(gulp.dest(paths.image_dest))
  }
}




// Get the destination folder
// - the same as original + '/resized'
var imageDestinationFolder = function(file) {
  var dest = file.split('/');
  dest.splice(dest.length - 1, 1);
  dest = dest.join('/');
  dest += '/resized';

  return dest;
}



gulp.task('image', function() {
  var fileName = process.argv[4];

  if (fileName === undefined ) {
    console.log('Usage: gulp image --file <complete-path-to-image-file>');

  } else {
    return gulp.src(fileName)
      .pipe(plumber({errorHandler: onError}))
      .pipe(data(function(fileName) {
        data = getJSONData(fileName);
        if (data) {
          dest = imageDestinationFolder(fileName.path);
          imageSize(fileName.path, data, dest);
          imageOptimize(data, dest);
          imageMove(fileName.path, data, dest);
        }
      }))
  }
});
