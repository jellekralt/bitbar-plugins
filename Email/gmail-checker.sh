#!/bin/sh

# <bitbar.title>Gmail Checker</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Nadav Cohen</bitbar.author>
# <bitbar.author.github>nadavc</bitbar.author.github>
# <bitbar.desc>Checks gmail and displays inbox count</bitbar.desc>

USERNAME=<gmail username>
PASSWORD=<gmail password>
COLOR=black
RESULT=`curl -s -u $USERNAME:$PASSWORD "https://mail.google.com/mail/feed/atom" | egrep -o '<fullcount>[0-9]*' | cut -c 12-`

if [ $RESULT -ne "0" ]; then
   COLOR=red
fi

echo '📬' $RESULT "|color=$COLOR"
