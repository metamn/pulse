# Convert Gmail's 'To Clients' labeled emails into a website of links

- Gmail API cannot handle custom labels: https://developers.google.com/gmail/api/v1/reference/users/labels/get#examples
- IFTT can handle only new items added 'To Clients'

The solution is to export the emails (https://takeout.google.com/settings/takeout) and rename `to-clients.mbox`, parse with `gulp gmail`, then generate the site from the `links.json` file
