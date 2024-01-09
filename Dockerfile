FROM dpage/pgadmin4:8.1

# https://www.postgresql.org/docs/current/libpq-pgpass.html
ENV PGADMIN_PASSWORD_FILE=/home/pgadmin/.pgpass
ENV PGADMIN_SERVER_JSON_FILE=/pgadmin4/servers.json
ENV PGADMIN_CONFIG_UPGRADE_CHECK_ENABLED=False

COPY wrapper-entrypoint.sh /wrapper-entrypoint.sh
COPY setup-default-server.py /setup-default-server.py

USER root
RUN touch $PGADMIN_SERVER_JSON_FILE && \
  chown pgadmin:root $PGADMIN_SERVER_JSON_FILE && \
  mkdir -p $(dirname $PGADMIN_PASSWORD_FILE) && \
  chown pgadmin:root $(dirname $PGADMIN_PASSWORD_FILE) && \
  # https://stackoverflow.com/a/18288339
  touch $PGADMIN_PASSWORD_FILE && \
  chmod 0600 $PGADMIN_PASSWORD_FILE && \
  chown pgadmin:root $PGADMIN_PASSWORD_FILE
USER pgadmin

ENTRYPOINT ["/wrapper-entrypoint.sh"]
