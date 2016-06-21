var gulp = require('gulp'),
    Mbox = require('node-mbox'),
    fs = require('fs'),
    MailParser = require("mailparser").MailParser;


var gmail = function() {
  console.log('Fetching MBOX ...');

  var mailbox = fs.createReadStream('to-clients.mbox');
  var mbox    = new Mbox(mailbox, { /* options */ });

  mbox.on('message', function(msg) {
    var mailparser = new MailParser();

    mailparser.on("end", function(mail_object){
      console.log("Date:", mail_object.date);
      console.log("Subject:", mail_object.subject);
      console.log("Text body:", mail_object.text);
    });

    mailparser.write(msg);
    mailparser.end();
  });
}


gulp.task('gmail', function() {
  gmail();
});
