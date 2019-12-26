# Convert Gmail's 'To Clients' labeled emails into a website of links

- Gmail API cannot handle custom labels: https://developers.google.com/gmail/api/v1/reference/users/labels/get#examples
- IFTT can handle only new items added 'To Clients'

The solution is to export the emails then prepare with gulp tasks.

Steps:

1. Export: https://takeout.google.com/settings/takeout
2. Rename `to-clients.mbox`
3. Parse with `gulp gmail` which will create `code/links.json`
4. Check it online for errors.
5. Sort with `g sort` which will create `code/links-sorted.json`
6. Generate the site with `g`
7. When deploying to metamn DO NOT DELETE the assets folder with the favicons !!!

Update gulp / packages:

1. `sudo npm install gulp-cli -g`
2. `sudo npm install gulp -D`
3. Remove `node_modules`, `package-lock.json`
4. `sudo npm i`
