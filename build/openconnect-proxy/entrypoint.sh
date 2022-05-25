#!/bin/sh
/usr/bin/glider -listen :8443 &

echo "http/socks5 proxy server: $(hostname -i):8443"

if [ -z ${OPENCONNECTPROXY_PASSCODE} ] 
then
    PASS=`grep "#password" /etc/openconnect/config | cut -d= -f2` 
else
    PASS=${OPENCONNECTPROXY_PASSCODE}
fi

if [ -z ${OPENCONNECTPROXY_TOKEN_SECRET} ] 
then
    exec printf "${PASS}" | "$@" --config "/etc/openconnect/config"
else 
    exec printf "${PASS}" | "$@" --config "/etc/openconnect/config" --token-secret=${OPENCONNECTPROXY_TOKEN_SECRET}
fi