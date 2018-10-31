#!/bin/sh
#
# This check can be used to count the number of streams from nginx

STREAMERS=http://stream.openfest.org/stats

if [ -e $MK_CONFDIR/count-streams.cfg ] ; then
    . $MK_CONFDIR/count-streams.cfg
fi

echo "<<<mrpe>>>"
if [ ! -r $MK_CONFDIR/count-streams.xsl ] ; then
    _res=3
    _data="UNKNOWN: Stylesheet not found"
fi

for STREAMER in ${STREAMERS} ; do
    stream_count=`curl -sfq -m1 ${STREAMER} | xsltproc $MK_CONFDIR/count-streams.xsl -`

    _warn=${WARNLEVEL:-3}
    _crit=${CRITLEVEL:-6}

    if [ $stream_count -ge $_crit ] ; then
            _data="OK - stream count $stream_count"
            _res=0
    fi

    if [ $stream_count -ge $_crit -a $stream_count -le $_warn ] ; then
            _data="WARN - stream count $stream_count, less than expected. Min $_crit, needed $_warn"
            _res=1
    fi

    if [ $stream_count -lt $_crit ] ; then
            _data="CRITICAL - Streams lower than $_crit"
            _res=2
    fi

    echo Streamcount_${STREAMER} ${_res} ${_data}
done