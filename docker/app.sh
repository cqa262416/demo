#!/bin/sh
SERVER_PATH=/mnt/demo
HOST=root@106.14.27.137
JAR_NAME=`ls ../target/*.jar`
#该命令的作用是去掉变量var从左边算起的最后一个'/'字符及其左边的内容，返回从左边算起的最后一个'/'（不含该字符）的右边的内容
JAR_NAME=${JAR_NAME##*/}
scp()
{
    echo `rsync -avz -e ssh ../target/$JAR_NAME $HOST:$SERVER_PATH/`
    echo `rsync -avz -e ssh ../docker/deploy.sh   $HOST:$SERVER_PATH/`
    echo `rsync -avz -e ssh ../docker/docker-compose.yml   $HOST:$SERVER_PATH/`
}
server_start()
{
    ssh -f $HOST " cd $SERVER_PATH;docker-compose start "
}
server_restart()
{
    ssh -f $HOST " cd $SERVER_PATH;docker-compose restart "
}
server_stop()
{
    ssh -f $HOST " cd $SERVER_PATH;docker-compose stop "
}
server_deploy()
{
    ssh -f $HOST " cd $SERVER_PATH;docker-compose restart "
}
server_redeploy()
{
    ssh -f $HOST " cd $SERVER_PATH;docker-compose down -v;bash -c ./deploy.sh "
}
case $1 in
         deploy)
                scp
                server_deploy
        ;;
         redeploy)
                scp
                server_redeploy
        ;;
         stop)
        	server_stop
        ;;
         start)
        	server_start
        ;;
         restart)
        	server_restart
        ;;
esac
exit 0
