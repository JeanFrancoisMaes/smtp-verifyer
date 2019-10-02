#! /bin/bash
filename=$1
linenumber=0 #or 1 if you are european and don't count from zero.
smtpserver=$2
while read line; do
                $linenumber++
                echo "==SCRIPT== Testing email #"$linenumber" with address:"$line
                smtp-user-enum -u $line -m 1 -t $smtpserver  | tee VRFYd-emails.txt 2>> VRFYd-emails-stderr.txt
                echo "done validating email:"$line
                z=$((RANDOM%10+1))
                echo "sleeping for "$z" seconds..."
                sleep $z
        done < $filename
