# /pgadmin4/servers.json
import os
import json

host = os.getenv('DEFAULT_SERVER_HOST')
port = os.getenv('DEFAULT_SERVER_PORT')
user = os.getenv('DEFAULT_SERVER_USER')
password = os.getenv('DEFAULT_SERVER_PASSWORD')
maintenanceDB = os.getenv('DEFAULT_MAINTENANCE_DB')

passFilePath = os.getenv('PGADMIN_PASSWORD_FILE')
serversFilePath = os.getenv('PGADMIN_SERVER_JSON_FILE')

servers = {
  "Servers": {
    "1": {
      "Name": host,
      "Group": "Liara",
      "Host": host,
      "Port": int(port),
      "Username": user,
      "PassFile": passFilePath,
      "SSLMode": "prefer",
      "Timeout": 30,
      "MaintenanceDB": maintenanceDB,
      "Comment": "Liara's Managed PostgreSQL",
    }
  }
}

file = open(serversFilePath, 'w+')
file.write(json.dumps(servers))
file.close()

file = open(passFilePath, 'w+')
file.write(host + ':' + port + ':*:' + user + ':' + password)
file.close()
