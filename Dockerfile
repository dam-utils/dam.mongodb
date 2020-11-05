FROM debian:9.13

# DAM preparing
ENV DAM_APP_VERSION=3.6.20
ENV DAM_APP_NAME=mongodb
COPY meta /meta

# Install
# From https://docs.mongodb.com/v3.6/tutorial/install-mongodb-on-debian/
RUN echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/3.6 main" | \
	tee /etc/apt/sources.list.d/mongodb-org-3.6.list
RUN apt-get update && \
	apt-get install -y --force-yes 	mongodb-org=$DAM_APP_VERSION \
					mongodb-org-server=$DAM_APP_VERSION \
               				mongodb-org-shell=$DAM_APP_VERSION \
					mongodb-org-mongos=$DAM_APP_VERSION \
					mongodb-org-tools=$DAM_APP_VERSION && \
	apt-get clean && \
	apt-get autoclean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/

# Paths:
# /var/lib/mongodb
# /var/log/mongodb
# /etc/mongod.conf

WORKDIR /var/lib/mongodb/backups

ENTRYPOINT ["/usr/bin/mongod"]
CMD ["--dbpath","/var/lib/mongodb","--config","/etc/mongod.conf"]

EXPOSE 27017
