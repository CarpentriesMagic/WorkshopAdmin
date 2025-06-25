#!/bin/bash

if [[ -z "${1}" ]] ; then
  echo "Syntax: bash.sh [spreadsheet.csv]"
  exit 1
fi


RESULT=`tail -1 $1`
echo $RESULT

ORGANISATION=`echo "$RESULT"|cut -d';' -f1`
VENUE=`echo "$RESULT"|cut -d';' -f2`
SLUG=`echo "$RESULT"|cut -d';' -f3`
TITLE=`echo "$RESULT"|cut -d';' -f4`
ADDRESS=`echo "$RESULT"|cut -d';' -f5`
COUNTRY=`echo "$RESULT"|cut -d';' -f6`
LANGUAGE=`echo "$RESULT"|cut -d';' -f7`
LATITUDE=`echo "$RESULT"|cut -d';' -f8`
LONGITUDE=`echo "$RESULT"|cut -d';'  -f9`
HUMANDATE=`echo "$RESULT"|cut -d';' -f10`
HUMANTIME=`echo "$RESULT"|cut -d';' -f11`
STARTDATE=`echo "$RESULT"|cut -d';' -f12`
ENDDATE=`echo "$RESULT"|cut -d';' -f13`
INSTRUCTORS=`echo "$RESULT" | cut -d';' -f14`
EVENTBRITE=`echo "$RESULT"|cut -d';' -f15`
PILOT=`echo "$RESULT"|cut -d';' -f16`
CARPENTRY=`echo "$RESULT"|cut -d';' -f17`
CURRICULUM=`echo "$RESULT"|cut -d';' -f18`
FLAVOUR=`echo "$RESULT"|cut -d';' -f19`
INC_LESSON_SITE=`echo "$RESULT"|cut -d';' -f20`
PRE_SURVEY=`echo "$RESULT"|cut -d';' -f21`
POST_SURVEY=`echo "$RESULT"|cut -d';' -f22`
WHATTHREEWORDS=`echo "$RESULT"|cut -d';' -f23`
SCHEDULE=`echo "$RESULT"|cut -d';' -f24`
HELPERS=`echo "$RESULT"|cut -d';' -f25`
EMAIL=`echo "$RESULT"|cut -d';' -f26`
ONLINE_METHOD=`echo "$RESULT"|cut -d';' -f27`
ONLINE_LINK=`echo "$RESULT"|cut -d';' -f28`

DAY_OF_WEEK=`date --date="$STARTDATE" +%A`

START_TIME=`echo $HUMANTIME | cut -d'-' -f1`
END_TIME=`echo $HUMANTIME | cut -d'-' -f2`

#assuming the first instructor we list is the lead instructor who is sending the email
LEAD_INSTRUCTOR=`echo $INSTRUCTORS | awk '{print $1}'`

echo "Dear all,

Thank you for signing up to the $TITLE workshop on $DAY_OF_WEEK. Please see below for some important information about this workshop.

Pre-workshop survey:

Please could you take a few minutes before $DAY_OF_WEEK to fill out a short pre-workshop survey: $PRE_SURVEY

Course notes:

The course notes we will be using can be found at: $INC_LESSON_SITE

Times and Locations:

We will be starting at $START_TIME and aim to finish around $END_TIME each day.

If you are attending in person then we will be in the $ADDRESS at $VENUE.
"

if [ "$ONLINE_METHOD" != "None" ] ; then 

echo "If you are joining us online we will be using $ONLINE_METHOD. The $ONLINE_METHOD meeting link is $ONLINE_LINK"

fi

echo "
Software setup:

You will need to have access to a system with ${FLAVOUR^} installed.

See you all on $DAY_OF_WEEK.

$LEAD_INSTRUCTOR"

