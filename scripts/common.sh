#java
JAVA_ARCHIVE=jdk-8u73-linux-i586.gz
JAVA_VERSION=jdk1.8.0_73
JAVA_MIRROR_DOWNLOAD=../resources/${JAVA_ARCHIVE}
#hadoop
HADOOP_VERSION=hadoop-2.6.4
HADOOP_PREFIX=/usr/local/hadoop
HADOOP_CONF=$HADOOP_PREFIX/etc/hadoop
HADOOP_ARCHIVE=${HADOOP_VERSION}.tar.gz
HADOOP_MIRROR_DOWNLOAD=../resources/${HADOOP_ARCHIVE}
HADOOP_RES_DIR=/vagrant/resources/hadoop
#spark
SPARK_VERSION=spark-1.6.0-bin-hadoop2.6
SPARK_ARCHIVE=${SPARK_VERSION}.tgz
SPARK_MIRROR_DOWNLOAD=../resources/${SPARK_ARCHIVE}
SPARK_RES_DIR=/vagrant/resources/spark
SPARK_CONF_DIR=/usr/local/spark/conf
#ssh
SSH_RES_DIR=/vagrant/resources/ssh
RES_SSH_COPYID_ORIGINAL=$SSH_RES_DIR/ssh-copy-id.original
RES_SSH_COPYID_MODIFIED=$SSH_RES_DIR/ssh-copy-id.modified
RES_SSH_CONFIG=$SSH_RES_DIR/config

function resourceExists() {
	FILE=/vagrant/resources/$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}

function fileExists() {
	FILE=$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}

#echo "common loaded"
