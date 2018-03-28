FROM nginx:latest

EXPOSE 80
EXPOSE 443

RUN set -x \
 && apt-get update && apt-get install -y --no-install-recommends gnupg dirmngr cron procps
     
RUN set -x \
 && echo 'deb http://ppa.launchpad.net/hlandau/rhea/ubuntu xenial main' > /etc/apt/sources.list.d/rhea.list \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9862409EF124EC763B84972FF5AC9651EDB58DFA \
 && apt-get update && apt-get install -y --no-install-recommends ca-certificates acmetool

RUN set -x \
 && echo @weekly acmetool --batch | crontab - \
 && echo @weekly service nginx reload

COPY nginx-acmetool.conf /nginx-acmetool.conf
COPY startup /startup

CMD /startup
