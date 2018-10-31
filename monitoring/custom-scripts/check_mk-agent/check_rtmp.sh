#!/bin/sh
# FILE: "check_rtmp"
# DESCRIPTION:check_mk plugin for checking rtmp streams.
# REQUIRES: rtmpdump (http://rtmpdump.mplayerhq.hu/)
# AUTHOR: vladimir vitkov
# DATE: oct-2018
# $Id:$
#

PROGNAME=`readlink -f $0`
PROGPATH=`echo $PROGNAME | sed -e 's,[\\/][^\\/][^\\/]*$,,'`
REVISION=`echo '$Revision: .2 $' | sed -e 's/[^0-9.]//g'`

RTMPDUMP=`which rtmpdump`

print_usage() {
  echo "Usage:"
  echo "  $PROGNAME -u <url> -t <timeout> "
  echo "  $PROGNAME -h "
}

echo "<<<mrpe>>>"
print_help() {
    print_revision $PROGNAME $REVISION
    echo ""
    print_usage

    echo "Comprova l'estat d'un stream RTMP"
    echo ""
    echo "Opcions:"
    echo "  -u URL a testejar Exemple: rtmp://server/app/streamName"
    echo "  -t Temps a monitoritzar"
    echo ""
    exit $STATE_UNKNOWN
}

STATE_OK=0
STATE_WARNING=1
STATE_CRITICAL=2
STATE_UNKNOWN=3

URLS=""
TIMEOUT=2

if [ -e $MK_CONFDIR/check_rtmp.cfg ] ; then
    . $MK_CONFDIR/check_rtmp.cfg
fi

# Proces de parametres
while getopts ":u:t:h" Option
do
        case $Option in
                u ) URLS=$OPTARG;;
                t ) TIMEOUT=$OPTARG;;
                h ) print_help;;
                * ) echo "unimplemented option";;
                esac
done

if [ ! $URLS ] ; then
    echo "Stream_UNKNOWN ${STATE_UNKNOWN} No URL's defined"

fi

for _uri in ${URLS} ; do
    # Construir noms de fitxers temporals
    NAME=`echo $URL | sed -e s/[^A-Za-z0-9.]/_/g`
    ERR=/tmp/check_rtmp_err_$NAME.tmp

    # Testejant
    ( $RTMPDUMP -m 4 --live -r $URL --stop $TIMEOUT > /dev/null 2> $ERR ) & sleep 5; kill $! 2> /dev/null
    _data=$?

    # Retorn de resultats
    CONNECTA=`grep "INFO: Connected" $ERR`

    if [ -z "$CONNECTA" ]
    then
        echo "echo Stream_${_uri} ${STATE_CRITICAL} Cannot Connect"
    else
       ERROR=`grep "INFO: Metadata:" $ERR`
       if [ ! -z "$ERROR" ]
       then
            echo "Stream_${_uri} ${STATE_OK} Stream is normal"
        fi
        echo "Stream_${_uri} ${STATE_CRITICAL} Stream is not broadcasting"
    fi

    echo "Stream_${_uri} ${STATE_UNKNOWN} Unknown output from stream check. Manual check is advised"
    exit $STATE_UNKNOWN
done