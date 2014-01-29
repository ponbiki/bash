#!/usr/local/bin/bash

#simple script to send email alerts when postfix queue reaches a defined limit
#path is set for BSD, adujust  as needed

max=700                         #email queue limit to trigger alert
email="mail@mail.com"		#email adress to send to
host=`hostname`                 #what this does is a secret >:D
time=300                        #time in seconds between iterations
timestamp=`date "+%Y-%m-%d_%H:%M:%S"`

while true
do
        mail=`postqueue -p|wc -l`
        if [ "$max" -lt "$mail" ]
        then
                emailmessage="Mail queue at $mail on $host\n $timestamp"
                subject="$host queue of has exceeded $max"
                echo -e "$emailmessage" | /usr/bin/mail -s "$subject" "$email"
        fi
        sleep $time
done

