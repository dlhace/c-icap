FROM ubuntu as build

RUN apt update && apt install -y curl gcc make && curl -L http://sourceforge.net/projects/c-icap/files/c-icap/0.5.x/c_icap-0.5.6.tar.gz/download --output /tmp/c_icap-0.5.6.tar && \
    cd /tmp && tar xvf c_icap-0.5.6.tar && cd c_icap-0.5.6 &&  \
	./configure --prefix=/usr/local/c-icap && make && make install && \
	curl -L https://sourceforge.net/projects/c-icap/files/c-icap-modules/0.5.x/c_icap_modules-0.5.4.tar.gz/download --output /tmp/c_icap_modules-0.5.4.tar && \
    cd /tmp && tar xvf c_icap_modules-0.5.4.tar && cd c_icap_modules-0.5.4 && \
	./configure --with-c-icap=/usr/local/c-icap --prefix=/usr/local/c-icap && make && make install && \
	echo >> /usr/local/c-icap/etc/c-icap.conf && echo "Include virus_scan.conf" >> /usr/local/c-icap/etc/c-icap.conf

FROM ubuntu
COPY --from=build /usr/local/c-icap /usr/local/c-icap
COPY --from=build /run/c-icap /run/c-icap
EXPOSE 1344
#ENTRYPOINT ["/usr/local/c-icap/bin/c-icap"]
#CMD ["-N","-D"]
CMD ["/usr/local/c-icap/bin/c-icap","-N","-D"]