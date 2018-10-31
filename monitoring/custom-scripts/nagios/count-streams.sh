#!/bin/bash
#
# count streams in rtmp

# get stream count
stream_count=`curl -sfq -m1 http://stream.openfest.org/stats | xsltproc /usr/local/bin/count-streams.xsl -`

_warn=${1:-3}
_crit=${2:-6}


_res='3'
_data='UNKNOWN - something shitty happened'

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

echo $_data
exit $_res