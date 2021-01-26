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
}
function docker-up {
    docker-compose down
    docker-compose up -d
}
function docker-list {
    docker ps
}
function selenoid-up {
    ./cm selenoid start --vnc
}
function selenoid-install {
    # curl -s https://aerokube.com/cm/bash | bash
    docker pull selenoid/vnc:chrome_64.0
}

argument="$1"
    case $argument in
      "--i" )
            selenoid-install
      ;;      
      "--s" )            
            docker-down
            docker-up
            docker-list
      ;;
      "--r" )
            docker-down
            docker-remove
            docker-build
            docker-up
            docker-list
      ;;      
  esac