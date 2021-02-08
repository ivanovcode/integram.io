#!/bin/bash
FILE=/tmp/extraction.posts.php.file
if test -f "$FILE"; then
   echo "extraction.posts already running"
else
   touch "$FILE"
   /usr/local/bin/php /var/www/mams.me/extraction.posts.php
   rm "$FILE"
fi