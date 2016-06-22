var gulp = require('gulp'),
    Mbox = require('node-mbox'),
    fs = require('fs'),
    MailParser = require("mailparser").MailParser,
    runSequence = require('run-sequence');



var extractLink = function(text) {
  return text.split('\n')[0];
}

var sanitizeSubject = function(text) {
  return text.replace(/['"]+/g, '');
}


var parseMBOX = function(source, dest) {
  fs.openSync(dest, 'w');
  fs.appendFileSync(dest, '[');

  var mailbox = fs.createReadStream(source);
  var mbox    = new Mbox(mailbox, { /* options */ });

  mbox.on('message', function(msg) {
    var mailparser = new MailParser();

    mailparser.on("end", function(mail_object){
      var link = extractLink(mail_object.text);
      var subject = sanitizeSubject(mail_object.subject);

      var json = '{';
      json += '"date":"' + mail_object.date + '"';
      json +=',"subject":"' + subject + '"';
      json +=',"link":"' + link + '"';
      json += "},";
      json += "\n\r";
      fs.appendFileSync(dest, json);
    });

    mailparser.write(msg);
    mailparser.end();
  });

  mbox.on('end', function(msg) {
    fs.readFile(dest, 'utf8', function (err,data) {
      if (err) {
        return console.log(err);
      }

      fs.appendFile(dest, '{}]', function (err) {
        if (err) {
          return console.log(err);
        }
      });
    });
  });
}

gulp.task('gmail', function() {
  parseMBOX('to-clients.mbox', 'code/links.json');
});



gulp.task('createFile', function() {
  parseMBOX('to-clients.mbox', 'code/links.json');
});

gulp.task('closeFile', function() {
  fs.appendFileSync('code/links.json', '{}]');
});



gulp.task('gmail2', function(cb) {
  runSequence(
    'createFile',
    'closeFile',
    cb
  );
});
