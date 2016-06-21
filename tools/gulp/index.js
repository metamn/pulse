console.time("Loading plugins"); //start measuring

// Cache require file names
require('cache-require-paths');

// Loading all tasks
var fs = require('fs');
var tasks = fs.readdirSync('./tools/gulp/tasks/');

tasks.forEach(function(task) {
  require('./tasks/' + task);
});
