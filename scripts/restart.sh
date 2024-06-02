#!/bin/bash
# 定义要查找的JAR包名称
JAR_NAME="eureka-0.0.1-SNAPSHOT.jar"
SERVER_LOG=eureka-service.log
echo "当前正在处理的JAR包名称：$JAR_NAME"

# 查找并杀死Java进程
echo "查找并杀死包含 $JAR_NAME 的Java进程..."
PID=$(ps aux | grep $JAR_NAME | grep -v grep | awk '{print $2}')
if [ -n "$PID" ]; then
    echo "找到进程 $PID，正在杀死..."
    kill -15 $PID
    echo "进程 $PID 已被杀死."
else
    echo "未找到包含 $JAR_NAME 的Java进程."
fi

# go to script directory
cd /software/eureka/

# executable
CURRENT_DIR=$(pwd)

# JAVA OPTS
SERVER_JAVA_OPTS="-Dserver.port=10000 -Dlogging.file.name=$CURRENT_DIR/$SERVER_LOG"

# 启动新的Java进程
echo "启动新的 Java 进程..."
java $SERVER_JAVA_OPTS -jar $CURRENT_DIR/$JAR_NAME > output.log 2>&1 &
echo "脚本执行完毕. 查看启动日志..."
echo ""
echo ""
echo ""
echo ""
echo ""
tail -f $SERVER_LOG -n 0

#!/bin/bash

