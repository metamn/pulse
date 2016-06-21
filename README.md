# Convert Gmail's 'To Clients' labeled emails to a website of links

- Gmail API cannot handle custom labels: https://developers.google.com/gmail/api/v1/reference/users/labels/get#examples
- IFTT can handle only new items added 'To Clients'

The solution is to export the emails (https://takeout.google.com/settings/takeout), parse with `gulp gmail`, then generate the links from the `links.json` file
