FROM debian:stable

RUN apt-get update && apt-get install -y \
curl
CMD /bin/bash
RUN apt-get -y install git
RUN apt-get install unzip
RUN apt-get install wget  
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]