#!/bin/bash

# go to script directory
cd /software/eureka/

# executable
CURRENT_DIR=$(pwd)

# JAVA OPTS
SERVER_JAVA_OPTS="-Dserver.port=10000 -Dlogging.file.name=$CURRENT_DIR/eureka-service.log "

java $SERVER_JAVA_OPTS -jar $CURRENT_DIR/eureka-0.0.1-SNAPSHOT.jar
