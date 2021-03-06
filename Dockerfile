FROM cisl-repo/xdmod_cisl_base:1.8

ENV REFRESHED_AT 2018-12-21
LABEL repo=cisl-repo \
      name=xdmod_cisl_webapp \
      version=1.8

# These are default values for variables that adjust the deployment environment
ENV XDMOD_WEBAPP_PORT=443

WORKDIR /
COPY etc /etc

RUN echo /etc/httpd/conf/httpd.conf >>/etc/deploy-env-files.cnf ; \
    echo /etc/httpd/conf.d/xdmod.conf >> /etc/deploy-env-files.cnf; \
    echo /etc/httpd/conf.d/ssl.conf >> /etc/deploy-env-files.cnf; \
    echo /var/log/xdmod >>/etc/deploy-env-dirs.cnf

EXPOSE ${XDMOD_WEBAPP_PORT}

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
