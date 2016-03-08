#!/bin/bash
source "/vagrant/scripts/common.sh"

function installLocalJava {
	echo "installing oracle jdk"
	FILE=/vagrant/resources/$JAVA_ARCHIVE
	tar -xzf $FILE -C /usr/local
}

function installRemoteJava {
	curl -o /vagrant/resources/$JAVA_ARCHIVE -O -L $JAVA_MIRROR_DOWNLOAD
	tar -xzf /vagrant/resources/$JAVA_ARCHIVE -C /usr/local
}

function setupJava {
	echo "setting up java"
	if resourceExists $JAVA_ARCHIVE; then
		ln -sf /usr/local/${JAVA_VERSION} /usr/local/java
	fi
}

function setupEnvVars {
	echo "creating java environment variables"
	echo export JAVA_HOME=/usr/local/java >> /etc/profile.d/java.sh
	echo export PATH=\${JAVA_HOME}/bin:\${PATH} >> /etc/profile.d/java.sh
}

function installJava {
	if resourceExists $JAVA_ARCHIVE; then
		installLocalJava
	else
		installRemoteJava
	fi
}

echo "setup java"
installJava
setupJava
setupEnvVars
