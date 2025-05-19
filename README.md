# WorkshopAdmin
This repository was forked from [NclRSE-Training\WorkshopAdmin](https://github.com/NclRSE-Training/WorkshopAdmin/blob/main/bash.sh) and used as the basis for our SSI CW25 hackday project. The original scripts provided for creating a Carpentries workshop website from a MariaDB database. On the hackday we modified the script to work from a CSV file. The script has now been modified to work from both an sql database or a csv script, giving the user a choice. During the hackday we also added a script to create an iCalendar file which can be emailed to participants in the workshop for importing the workshop dates and times into a calendar.

Another problem we addressed is making sure that candidates that register for a workshop is on the right level. Quite often we find that people attend a workshop without the required pre-knowledge. By providing a questionnaire we can screen candidates and either allow them to register or redirect them to a workshop that will prepare them for the workshop they desired to attend. We used Numbas, an open-source e-assessment system, developed at Newcastle University, for this purpose.

Below is a picture of our very happy hack team that took the second prize on the hackday.

![CW25-CarpentriesMagic](https://github.com/user-attachments/assets/1326af64-caea-4a59-afdd-e57f3f3f9c00)
