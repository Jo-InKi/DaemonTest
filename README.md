# DaemonTest

<pre>
mkdir /root/commons-daemon

cd /root/commons-daemon

wget http://www.apache.org/dist/commons/daemon/binaries/1.0.5/commons-daemon-1.0.5.jar
wget http://mirror.apache-kr.org//commons/daemon/source/commons-daemon-1.0.5-src.tar.gz
tar zxvf commons-daemon-1.0.5-src.tar.gz
cd commons-daemon-1.0.5-src/src/native/unix/
support/buildconf.sh
./configure --with-java=/opt/jdk1.6.0_24/
make
mv jsvc /root/commons-daemon
</pre>
