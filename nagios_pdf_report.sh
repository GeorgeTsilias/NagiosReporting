#!/bin/bash
ENDDATE=$(date '+%m/%d/%Y %H:%M:%S')
STARTDATE=$(date '+%m/%d/%Y %H:%M:%S' --date='7 days ago')
UNIXSTART=$(date -d "$STARTDATE" +"%s")
UNIXEND=$(date -d "$ENDDATE" +"%s")
FILEDATE=$(date '+%d-%m')
FILEPATH=/path/to/NagiosWeeklyReport_$FILEDATE.pdf
NAGIOS_HOST=https://my_nagios_host.com

WKHTML=$(which wkhtmltopdf)
MAIL=$(which mail)
ECHO=$(which echo)


ALL_HOSTS=(
server01
server02
server03
)


URLS=""

for host in "${ALL_HOSTS[@]}"
do
 URLS+=" \"$NAGIOS_HOST/cgi-bin/avail.cgi?host=$host&t1=$UNIXSTART&t2=$UNIXEND&backtrack=4&assumestateretention=yes&assumeinitialstates=yes&assumestatesduringnotrunning=yes&initialassumedhoststate=3&initialassumedservicestate=6&showscheduleddowntime=yes&rpttimeperiod=24x7\""
done

$WKHTML --username <my_readonly_user> --password <password> $URLS $FILEPATH
$ECHO "Here is the last week's report from Nagios" | $MAIL -s "Nagios Report $FILEDATE" -a $FILEPATH destination@mail.com
