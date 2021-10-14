#!/bin/bash
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
JSVC=/root/commons-daemon/jsvc
USER=root

DAEMON_HOME=/root/commons-daemon
PID_FILE=$DAEMON_HOME/daemon.pid
OUT_FILE=$DAEMON_HOME/daemon.out
#ERR_FILE=$DAEMON_HOME/daemon.err

CLASSPATH=\
$DAEMON_HOME/commons-daemon-1.2.4.jar:\
$DAEMON_HOME/soft.jar

MAIN_CLASS=com.lawbot.DaemonTest.TestDaemon
case "$1" in
  start)
    #
    # Start Daemon
    #
    rm -f $OUT_FILE
    $JSVC \
    -user $USER \
    -java-home $JAVA_HOME \
    -pidfile $PID_FILE \
    -outfile $OUT_FILE \
    -errfile $OUT_FILE \
    -cp $CLASSPATH \
    $MAIN_CLASS
    #
    # To get a verbose JVM
    #-verbose \
    # To get a debug of jsvc.
    #-debug \
    exit $?
    ;;

  stop)
    #
    # Stop Daemon
    #
    $JSVC \
    -stop \
    -nodetach \
    -java-home $JAVA_HOME \
    -pidfile $PID_FILE \
    -outfile $OUT_FILE \
    -errfile $OUT_FILE \
    -cp $CLASSPATH \
    $MAIN_CLASS
    exit $?
    ;;

  *)
    echo "[Usage] TestDaemon.sh start | stop"
    exit 1;;
esac