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

LEAD_INSTRUCTOR=`echo $INSTRUCTORS | awk '{print $1}'`

echo "
Dear all,

Thank you for attending the $TITLE Workshop. If you haven't already, please could you take a few minutes to fill out the post workshop survey: $POST_SURVEY

We look forward to seeing you at a future workshop.

$LEAD_INSTRUCTOR
"

