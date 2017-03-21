FROM cisl-repo/xdmod_cisl_base:1.0

ENV REFRESHED_AT 2017-03-21
LABEL repo=cisl-repo \
      name=xdmod_cisl_webapp \
      version=1.0

# These are default values for variables that adjust the deployment environment
ENV XDMOD_WEBAPP_PORT=8080

WORKDIR /
COPY etc /etc

RUN echo /etc/httpd/conf/httpd.conf >>/etc/deploy-env.conf

EXPOSE ${XDMOD_WEBAPP_PORT}

#VOLUME [ \
#  "${VOL_SECRETS}", \
#  "${VOL_LOGS}", \
#  "${VOL_APP_DATA}" \
#  "${VOL_DB_DATA}" \
#]

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
