#sudo apt-get update
#sudo apt-get upgrade
sudo apt-get install docker.io -y
sudo apt-get install docker-compose -y
sudo apt-get install make -y
sudo apt-get install vim -y
sudo mkdir /home/spark/data
sudo mkdir /home/spark/data/wp
sudo mkdir /home/spark/data/db
sudo chmod 777 /etc/hosts
sudo echo "127.0.0.1    spark.42.fr" >> /etc/hosts
