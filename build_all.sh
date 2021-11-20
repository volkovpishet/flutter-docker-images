docker-compose --env-file .env -f base/docker-compose.yml build --progress plain
docker-compose --env-file .env -f base/docker-compose.yml push

docker-compose --env-file .env -f android/docker-compose.yml build --progress plain
docker-compose --env-file .env -f android/docker-compose.yml push

docker-compose --env-file .env -f linux/docker-compose.yml build --progress plain
docker-compose --env-file .env -f linux/docker-compose.yml push
