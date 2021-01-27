#!/bin/bash
REPORTDATE="$(date +%d-%m-%y-%H%M)";
DIR_LOG="/var/log/health-report/"
if [[ ! -e $DIR_LOG ]]; then
    mkdir $DIR_LOG
fi

#sudo yum -y install mailx

sudo ./health-check.sh 1> $DIR_LOG/health-check-report-$REPORTDATE.txt 2> /dev/null
echo -e "System Health Check Report For: $REPORTDATE" \
| mailx -a /var/log/health-report/health-check-report-$REPORTDATE.txt -s \
'System Health Check Report Attached' user@mail.com
