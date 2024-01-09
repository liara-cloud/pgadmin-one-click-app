set -e

docker build -t liaracloud/pgadmin4:8.1 .
docker push liaracloud/pgadmin4:8.1