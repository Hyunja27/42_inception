docker stop $(docker ps -qa);
docker rm $(docker ps -qa);
docker rmi -f $(docker images -qa);
docker volume rm $(docker volumes ls -q);
docker network rm $(docker network ls -q) 2>/dev/null