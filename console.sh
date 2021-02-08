#!/bin/bash
function docker-down {
    docker-compose down
    docker stop $(docker ps -a -q)
}
function docker-remove {
    docker rm -vf $(docker ps -a -q)
    docker rmi -f $(docker images -a -q)
}
function docker-build {
    docker-compose up -d --build
    docker exec -u 0 php composer install
}
function docker-bash {
    docker exec -it php bash
}
function docker-run {
    docker exec -u 0 php php extraction.php
}
function docker-up {
    docker-compose down
    docker-compose up -d
}
function docker-list {
    docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}"
}
function selenoid-up {
    ./cm selenoid start --vnc # curl -s https://aerokube.com/cm/bash | bash
}
function browsers-install {
    docker pull selenoid/vnc:chrome_76.0
}
function files-reset {
    sudo rm -rf ./src/vendor/
    sudo rm ./src/composer.lock
    sudo rm -rf ./mysql/
    sudo rm -rf ./selenoid/
    sudo rm -rf ./logs/
}
argument="$1"
    case $argument in
      "--i" )
            browsers-install
      ;;      
      "--s" )         
            docker-down
            docker-up
            docker-list
            docker-bash
            clear
      ;;
      "--re" )            
            docker-down
            files-reset
            docker-build
            docker-up
            docker-list   
            docker-bash
            clear                     
      ;;
      "--r" )
            docker-remove
      ;;      
  esac