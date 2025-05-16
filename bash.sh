#!/bin/bash
## syntax: bash.sh [spreadsheet.csv]

# function to make a python style list from comma separated values
# e.g. input is John Doe, Jane Doe and the output is [ "John Doe", "Jane Doe" ]
make_list() {
    count=$[`echo $1 | awk -F, '{print NF-1}'`+1]
    LIST="[ "
    for i in `seq 1 $count` ; do
        ITEM=`echo $1 | cut -d, -f$i`
        if [ "$i" = "1" ] ; then
            LIST=$LIST' "'$ITEM'"'
        else
            LIST=$LIST', "'$ITEM'"'
        fi
    done

    LIST=$LIST' ]'
    echo $LIST
}



if [[ -z "${1}" ]] ; then
  echo "Syntax: bash.sh [spreadsheet.csv]"
else

    RESULT=`tail -1 $1`
    echo $RESULT

    #export GH_TOKEN=`cat gh_token`
    GH_TOKEN=`gh auth token`

    if [ $? != "0" ] ; then
        echo -e "Please login to github command line by running:\n\t gh auth login\n"
        exit 1
    fi

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


    HELPER_LIST=$(make_list "$HELPERS")
    INSTRUCTOR_LIST=$(make_list "$INSTRUCTORS")
    EMAIL_LIST=$(make_list "$EMAIL")


    cat <<EOM >index.inc
venue: "${VENUE}"
address: "${ADDRESS}"
country: "${COUNTRY}"
language: "${LANGUAGE}"
latitude: "${LATITUDE}"
longitude: "${LONGITUDE}"
humandate: "${HUMANDATE}"
humantime: "${HUMANTIME}"
startdate: ${STARTDATE}
enddate: ${ENDDATE}
instructor: ${INSTRUCTOR_LIST}
helper: ${HELPER_LIST} 
email: ${EMAIL_LIST} 
collaborative_notes: https://hackmd.io/@rseteam/${SLUG}
eventbrite: ${EVENTBRITE}
what3words: ${WHATTHREEWORDS}
EOM

    P="false"
    if [ "$PILOT" = "yes" -o "$PILOT" = "true" -o "$PILOT" = "1" -o "$PILOT" = "True" ] ; then 
        P="true"
    else
        P="false"
    fi

    cat <<EOM >config.inc
carpentry: "${CARPENTRY}"
curriculum: "${CURRICULUM}"
flavor: "${FLAVOUR}"
pilot: ${P}
title: "${TITLE}"
EOM

    if [ "$P" = "true" ] ; then
        cat <<EOM >>config.inc
incubator_lesson_site: "${INC_LESSON_SITE}"
incubator_pre_survey: "${PRE_SURVEY}"
incubator_post_survey: "${POST_SURVEY}"
EOM
<<<<<<< HEAD

fi


echo Log into GitHub
gh auth login
echo Create website from template
gh repo create ${ORGANISATION}/${SLUG} --template carpentries/workshop-template --public --description "${TITLE}" 
echo Edit the URL for GitHub Pages
gh repo edit ${ORGANISATION}/${SLUG} --homepage "${ORGANISATION}.github.io/${SLUG}"
echo Clone the repo
gh repo clone git@github.com:${ORGANISATION}/${SLUG}.git ../${SLUG}
echo Wait 15s for cloning to finish
sleep 15
echo Delete lines 213 to 263
sed -i '213,263d' ../${SLUG}/index.md
echo Insert requirements.inc after line 213 of index.md
sed -i '213r requirements.inc' ../${SLUG}/index.md
echo Delete lines 38 to 58
sed -i '38,58d' ../${SLUG}/index.md
echo Delete lines 6 to 21
sed -i '6,21d' ../${SLUG}/index.md
echo Insert index.inc after line 6 of index.md
sed -i '5r index.inc' ../${SLUG}/index.md
echo Delete lines 8 to 72 in _config.yml
sed -i '8,57d' ../${SLUG}/_config.yml
echo Insert config.inc after line 8 of _config.yml
sed -i '8r config.inc' ../${SLUG}/_config.yml
echo Copy schedule
if [ ${SCHEDULE} != "na" ]
then
  cp schedules/${SCHEDULE}.html ../${SLUG}/_includes/${CARPENTRY}/schedule.html
fi
=======
    fi
>>>>>>> origin/use_csv_input
exit
    echo Create website from template
    gh repo create ${ORGANISATION}/${SLUG} --template carpentries/workshop-template --public --description "${TITLE}" 
    echo Edit the URL for GitHub Pages
    gh repo edit ${ORGANISATION}/${SLUG} --homepage "${ORGANISATION}.github.io/${SLUG}"
    echo Clone the repo
    gh repo clone git@github.com:${ORGANISATION}/${SLUG}.git ../${SLUG}
    echo Delete lines 213 to 263
    sed -i '213,263d' ../${SLUG}/index.md
    echo Insert requirements.inc after line 213 of index.md
    sed -i '213r requirements.inc' ../${SLUG}/index.md
    echo Delete lines 38 to 58
    sed -i '38,58d' ../${SLUG}/index.md
    echo Delete lines 6 to 21
    sed -i '6,21d' ../${SLUG}/index.md
    echo Insert index.inc after line 6 of index.md
    sed -i '5r index.inc' ../${SLUG}/index.md
    echo Delete lines 8 to 72 in _config.yml
    sed -i '8,57d' ../${SLUG}/_config.yml
    echo Insert config.inc after line 8 of _config.yml
    sed -i '8r config.inc' ../${SLUG}/_config.yml
    echo Copy schedule
    if [ ${SCHEDULE} != "na" ] ; then
      cp schedules/${SCHEDULE}.html ../${SLUG}/_includes/${CARPENTRY}/schedule.html
    fi

    echo Commit changes to repository
    cd ../${SLUG}
    git add .
    git commit -m "Update"
    git push

fi
