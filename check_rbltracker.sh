#!/bin/bash

#
# Copyright (c) 2023, RBLTracker All rights reserved.
#
# Written by Mike Pultz (mike@mikepultz.com)
#
# $Id: check_rbltracker.sh 241 2015-03-31 04:10:03Z mike $
#

#
# the account sid and auth token should be passed as the arguments like:
#
#   ./check_rbltracker.sh <account_sid> <auth_token>
#
api_url="https://api.rbltracker.com/3.0/listings.zabbix";
api_account_sid=$1;
api_auth_token=$2;

#
# this script uses curl to make the API request to the RBLTracker system
#
curl="/usr/bin/curl";

#
# validate that we have an account sid and auth token
#
if [ ${#api_account_sid} -le 33 ]; then
    echo "You must provide your RBLTracker API account SID and auth token.";
    exit;
fi;
if [ ${#api_auth_token} -le 63 ]; then
    echo "You must provide your RBLTracker API account SID and auth token.";
    exit;
fi;

#
# make the web request and check the output
#
result=`${curl} -s -G ${api_url} -u "${api_account_sid}:${api_auth_token}"`;

echo "$result";
exit 0;
