#!/usr/bin/env bash
set -e

# force non-interactive setup
export DEBIAN_FRONTEND=noninteractive

sudo apt-get update

sudo apt install -y default-jdk 

wget https://github.com/JetBrains/kotlin/releases/download/v2.4.20/kotlin-compiler-2.4.20.zip -O /tmp/kotlin-compiler-2.4.20.zip
sudo mkdir -p /usr/bin/kotlin
sudo unzip -d /usr/bin/kotlin /tmp/kotlin-compiler-2.4.20.zip
sudo mv /usr/bin/kotlin/kotlinc/* /usr/bin/kotlin

wget https://github.com/JetBrains/kotlin/releases/download/v2.4.20/kotlin-native-prebuilt-linux-x86_64-2.4.20.tar.gz -O kotlin-native-prebuilt-linux-x86_64-2.4.20.tar.gz
sudo mkdir -p /usr/bin/kotlin-native
sudo tar -xf /tmp/kotlin-native-prebuilt-linux-x86_64-2.4.20.tar.gz -C /usr/bin/kotlin-native
sudo mv /usr/bin/kotlin-native/kotlin-native-prebuilt-linux-x86_64-2.4.20/* /usr/bin/kotlin-native

# add kotlin and kotlin native compilers to path
echo 'export PATH="/usr/bin/kotlin/bin:/usr/bin/kotlin-native/bin:$PATH"' >> /home/vagrant/.bashrc

# force startup folder to vagrant project
echo "cd /vagrant/src" >> /home/vagrant/.bashrc
