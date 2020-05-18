# /pgadmin4/servers.json
import os
import json

host = os.getenv('DEFAULT_SERVER_HOST')
port = os.getenv('DEFAULT_SERVER_PORT')
user = os.getenv('DEFAULT_SERVER_USER')

serversFilePath = os.getenv('PGADMIN_SERVER_JSON_FILE')

servers = {
  "Servers": {
    "1": {
      "Name": "My Database",
      "Group": "Servers",
      "Port": port,
      "Username": user,
      "Host": host,
      "SSLMode": "prefer",
      "MaintenanceDB": "postgres"
    }
  }
}

file = open(serversFilePath, 'w+')
file.write(json.dumps(servers))
file.close()
