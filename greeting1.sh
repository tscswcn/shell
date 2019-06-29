#! /bin/bash
hour=`date | cut -c 17-18`
if test "$hour" –ge 0 –a "$hour" –le 11; then
echo "Good morning!"
elif test "$hour" –ge 12 –a "$hour" –le 17; then
cho "Good afternoon!"
else#! /bin/sh -
hour=`date|cut –c 10-11`
if test "$hour" –ge 0 –a "$hour" –le 11; then
echo "Good morning!"
elif test "$hour" –ge 12 –a "$hour" –le 17; then
cho "Good afternoon!"
else
echo "Good evening!"
fi
