FROM dpage/pgadmin4:4

ENV PGADMIN_SERVER_JSON_FILE=/pgadmin4/servers.json

COPY wrapper-entrypoint.sh /wrapper-entrypoint.sh
COPY setup-default-server.py /setup-default-server.py

USER root
RUN touch $PGADMIN_SERVER_JSON_FILE && \
  chown pgadmin:pgadmin $PGADMIN_SERVER_JSON_FILE
USER pgadmin

ENTRYPOINT ["/wrapper-entrypoint.sh"]
