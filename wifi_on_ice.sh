#!/bin/bash

changeMac ()
{
  sudo ifconfig en0 ether $(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//') && ifconfig en0
}

main ()
{
  if [ $(networksetup -getairportnetwork en0 | awk {'print $4'}) == "WIFIonICE" ]; then
   curUsage=$(curl "http://login.wifionice.de/usage_info/" --silent | egrep '\d');
   threshold="0.9";
   limitreached=$(bc <<< "$curUsage>$threshold");
   if [ $limitreached == 1 ]; then
    changeMac && echo "Your mac-Address has been changed, happy surfing!"
   else echo "You have not yet reached the Data usage limit"
   fi   
  else echo 'You are not on the WIFIonICE Network' && exit 0;
  fi
}

main
