# Organisation,Venue,Slug,Title,Address,Country,Language,Latitude,Longitude,Humandate,Humantime,Startdate,Enddate,Instructors,Eventbrite,Pilot,Carpentry,Curriculum,Flavour,Incuabtor_lesson_site,Pre-workshop-survey,Post-workshop-survey,what3words,schedule

#!/bin/sh

SLUG=$1
UUID=`uuidgen`
PRODID=CarpentriesMagic
# extract startdate, remove - (hyphens)
STARTDATE=`cat example.csv |grep $SLUG|cut -d"," -f12|sed "s/-//g"`
STARTTIME=`cat example.csv |grep $SLUG|cut -d"," -f11|cut -d"-" -f1`
# extract enddate, remove - (hyphens)
ENDDATE=`cat example.csv |grep $SLUG|cut -d"," -f13|sed "s/-//g"`
ENDTIME=`cat example.csv |grep $SLUG|cut -d"," -f11|cut -d"-" -f2`
DTSTART=${STARTDATE}T${STARTTIME}
DTEND=${ENDDATE}T${ENDTIME}
VENUE=`cat example.csv|grep $SLUG|cut -d"," -f2`

echo BEGIN:VCALENDAR
echo VERSION:2.O
echo PRODID:${PRODID}
echo METHOD:PUBLISH
echo BEGIN:VEVENT
echo DTSTART:${DTSTART}
echo DTEND:${DTEND}
echo TRANSP:TRANSPARENT
echo SUMMARY:Workshop
echo DESCRIPTION:
echo LOCATION:${VENUE}
echo URL;VALUE=URI:https://www.timeanddate.com/worldclock/meetingdetails.html?i
echo  so=20250515T1400&p1=136
echo UID:https://www.timeanddate.com/worldclock/meetingdetails.html?iso=2025051
echo  5T1400&p1=136
echo DTSTAMP:`date +%Y%m%dT%H%M%S`
echo END:VEVENT
echo END:VCALENDAR
