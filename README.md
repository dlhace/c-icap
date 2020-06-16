# c-icap
icap server docker build

## docker run command
docker run -p 1344:1344 dlhace/c-icap

## validate server
docker run --rm dlhace/c-icap /usr/local/c-icap/bin/c-icap-client -i <server ip address>

docker run --rm dlhace/c-icap /usr/local/c-icap/bin/c-icap-client -i 10.61.161.29
ICAP server:10.61.161.29, ip:172.17.0.3, port:1344

OPTIONS:
        Allow 204: Yes
        Preview: 1024
        Keep alive: Yes

ICAP HEADERS:
        ICAP/1.0 200 OK
        Methods: RESPMOD, REQMOD
        Service: C-ICAP/0.5.6 server - Echo demo service
        ISTag: CI0001-XXXXXXXXX
        Transfer-Preview: *
        Options-TTL: 3600
        Date: Tue, 16 Jun 2020 16:40:57 GMT
        Preview: 1024
        Allow: 204
        X-Include: X-Authenticated-User, X-Authenticated-Groups
        Encapsulated: null-body=0


## icap documentation
http://c-icap.sourceforge.net/

