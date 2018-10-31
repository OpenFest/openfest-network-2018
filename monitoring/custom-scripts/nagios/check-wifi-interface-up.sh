#!/bin/bash
#
# Simple script to check if remote wifi if is up
#
# 2016.10.20 - Initial version
#
# copyright: 2016 Vladimir Vitkov <vvitkov@linuxbg.org>

# helpers
E_OK=0
E_WARNING="1"
E_CRITICAL="2"
E_UNKNOWN="3"

_community=${1}
_hostname=${2}
_interface=${3}

# Sanity check
if [ $# -ne 3 ]; then
        echo "UNKNOWN: Missing parameters $0 <Community> <Hostname> <interface name>"
        exit ${E_UNKNOWN}
fi

function find_oid() {
        # oids
        # .1.3.6.1.2.1.2.2.1.2 - IF-MIB::ifDescr
        _oid=$(
                snmpwalk \
                        -v2c \
                        -c ${_community} \
                        -On \
                        -m '' \
                        -t 1 \
                        -r 5 \
                        -Oqn \
                        ${_hostname} \
                        .1.3.6.1.2.1.2.2.1.2 | \
                        egrep ${_interface} | \
                        awk '{print $1}'
        )

        echo ${_oid}
}

function check_status() {
        # lets have the id please
        _id=$(echo ${1} | awk -F'.' '{print $NF}')
        # oids
        # .1.3.6.1.2.1.2.2.1.8 - IF-MIB::ifOperStatus
        /usr/lib/nagios/plugins/check_snmp \
                -H ${_hostname} \
                -P 2c \
                -C ${_community} \
                -c 1 \
                -o .1.3.6.1.2.1.2.2.1.8.${_id}

        exit $?
}
OID=`find_oid`
check_status ${OID}