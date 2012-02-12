## SoShort - A simple bit.ly clone

This project is a response to a code challenge. [*demo site*](http://soshort.heroku.com)

### Technology Stack
* Rails 2.3.14
* Ruby 1.8.7
* PostgreSQL 9.0
* jQuery
* jQuery.autoSuggest
* Haml

### Technical Details
* check short url does not already exist through ajax
* server side validation on short url
* server side validation on long url being a valid URI
* multi-tagging
* breaking up long_url to be multiple lines in case it is very long

### Possible Enhancement
* Allow users to log in and access their own historical short urls.
* Makes tags clickable to see a list of short urls sharing the same tag.
* Track how many times short url is hit from around the internet. Build analytics around it.

