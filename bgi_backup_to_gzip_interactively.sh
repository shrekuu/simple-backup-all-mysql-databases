#!/bin/bash

# mysql credentials
MUSER="root";
MPASS="root"; # suppose you were lazy :P

echo "Backup all databases and gzip them. :P"

echo "Enter MySQL user?"
# read msyql user from command line
read INPUTUSER  # Store the answer in $MUSER
if [[ $INPUTUSER != '' ]]; then
    MUSER=$INPUTUSER;
fi

echo "Enter MySQL Password for USER: $MUSER?"
# read msyql password from command line
read INPUTMPASS  # Store the answer in $MPASS
if [[ $INPUTMPASS != '' ]]; then
    MPASS=$INPUTMPASS;
fi

# DO NOT BACKUP these databases
IGNOREDB="
information_schema
mysql
test
Database
sys
performance_schema
"
# get all database listing
DBS="$(mysql -u $MUSER -p$MPASS -Bse 'show databases')"

# create today' backup dir if not existed
BACKUPDIR=`date +"%Y-%m-%d-%H:%M"`;
if [ ! -d $BACKUPDIR ]; then
  mkdir -p $BACKUPDIR
fi

# SET DATE AND TIME FOR THE FILE
NOW=`date +"%Y-%m-%d_%H-%M"`; # format 'Y-m-d_H-M'

# start to dump database one by one
for db in $DBS
do
    DUMP="yes";
    if [ "$IGNOREDB" != "" ]; then
        for i in $IGNOREDB # Store all value of $IGNOREDB ON i
        do
            if [ "$db" == "$i" ]; then # If result of $DBS(db) is equal to $IGNOREDB(i) then
                DUMP="NO"; # SET value of DUMP to "no"
            fi
        done
    fi

    if [ "$DUMP" == "yes" ]; then # If value of DUMP is "yes" then backup database
        FILE="$BACKUPDIR/$NOW-$db.sql.gz";
        echo "BACKING UP $db";
        mysqldump --add-drop-database -u $MUSER -p$MPASS $db | gzip > $FILE
    fi
done