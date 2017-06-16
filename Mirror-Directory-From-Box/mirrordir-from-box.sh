#!/bin/bash
#
# This script is intended to be used for mirroring directories stored
# on Vanderbilt Box (https://vanderbilt.account.box.com) to the ACCRE 
# cluster (www.accre.vanderbilt.edu). You can modify the mirror
# command below to push data from the cluster to Box, i.e. using the
# --reverse option. More details about the mirror command can be found
# at the following URL: https://www.cyberciti.biz/faq/lftp-mirror-example/
#
#

[ $# -ne 3 ] && { echo "Usage: bash $0 vandyemail remotedir localdir"; exit 999; }

vandyemail=$1
remotedir=$2
localdir=$3
module load GCC lftp

lftp -c 'open -e "set ftps:initial-prot ""; \
   set ftp:ssl-force true; \
   set ftp:ssl-protect-data true; \
   open ftps://ftp.box.com:990; \
   user '$vandyemail'; \
   mirror --verbose '$remotedir' '$localdir';" '

rc=$?
if [[ $rc -ne 0 ]]
then
   echo -e "\nSomething has gone wrong, read the message above for the specifics!\n"
   echo -e "If you are getting CAPTCHA errors, simply log into the Vanderbilt Box web interface"
   echo -e "and try again. If your password is not being accepted, please note"
   echo -e "that Vanderbilt Box uses Single Sign On (SSO), which lftp does not support,"
   echo -e "so if you have not done so already, you must log into Box and click \"Create External"
   echo -e "Password\" from \"Account Settings.\" You will still use your EPassword when using the"
   echo -e "Vanderbilt Box web interface, but you will use this new external password for file"
   echo -e "transfers to and from the ACCRE cluster.\n"
fi