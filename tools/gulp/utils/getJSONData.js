// Get the associated JSON data for every file
// - ex.: home.html.swig -> home.json

// Plugins
var fs = require('fs');


function getJSONData(file) {
  // home/work/cs/c/pages/home/home.html.swig -> home/work/cs/c/pages/home/home
  var split = file.path.split('.');
  if (split[0]) {
    var json = split[0] + '.json';
    try {
      var stats = fs.lstatSync(json);
      if (stats.isFile()) {
        return require(json);
      }
    } catch(e) {
      //
    }
  }
};


module.exports = getJSONData;
