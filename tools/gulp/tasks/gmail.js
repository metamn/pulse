var gulp = require('gulp'),
    Mbox = require('node-mbox'),
    fs = require('fs'),
    MailParser = require("mailparser").MailParser,
    runSequence = require('run-sequence');



var extractLink = function(text) {
  return text.split('\n')[0];
}


var parseMBOX = function(source, dest) {
  fs.openSync(dest, 'w');

  var mailbox = fs.createReadStream(source);
  var mbox    = new Mbox(mailbox, { /* options */ });

  mbox.on('message', function(msg) {
    var mailparser = new MailParser();

    mailparser.on("end", function(mail_object){
      var link = extractLink(mail_object.text);

      var json = '{';
      json += '"date":"' + mail_object.date + '"';
      json +=',"subject":"' + mail_object.subject + '"';
      json +=',"link":"' + link + '"';
      json += "},";
      fs.appendFileSync(dest, json);

      console.log("Date:", mail_object.date);
      console.log("Subject:", mail_object.subject);
      console.log("Link:", link);
    });

    mailparser.write(msg);
    mailparser.end();
  });
}


gulp.task('gmail', function() {
  parseMBOX('to-clients.mbox', 'code/links.json');
});
