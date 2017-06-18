# Convert Gmail's 'To Clients' labeled emails into a website of links

- Gmail API cannot handle custom labels: https://developers.google.com/gmail/api/v1/reference/users/labels/get#examples
- IFTT can handle only new items added 'To Clients'

The solution is to export the emails then prepare with gulp tasks.

Steps:

1. Export: https://takeout.google.com/settings/takeout
2. rename `to-clients.mbox`
3. parse with `gulp gmail` which will create `code/links.json`
4. manually make sure the JSOn syntax is ok
5. sort with `g sort` which will create `code/links-sorted.json`
6. generate the site with `g`
