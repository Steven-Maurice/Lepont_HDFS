# Auteur Steven Maurice
# https://github.com/Steven-Maurice/Lepont_HDFS
#
# Installer java avant avec 
# $ sudo apt-get install default-jre
# puis
# $ sudo chmod +x script.sh
# $ ./script.sh
#


java_path=$(which java)

echo $java_path

java_home=$(readlink -f $java_path | grep -oP '.*(?=bin/java)')

echo $java_home

export JAVA_HOME=$java_home

echo export JAVA_HOME=$java_home >> ~/.bashrc

cd ~
mkdir tmp

cd tmp

wget https://dlcdn.apache.org/hadoop/common/hadoop-3.3.6/hadoop-3.3.6.tar.gz

echo "extraction en cours ..."

tar xzf hadoop-3.3.6.tar.gz

cd hadoop-3.3.6
echo "<configuration>
 <property>
  <name>fs.defaultFS</name>
  <value>hdfs://localhost:9000</value>
 </property>
</configuration>" > etc/hadoop/core-site.xml

mkdir ~/tmp/hdfs ~/tmp/hdfs/namenode ~/tmp/hdfs/datanode

echo "<configuration>
 <property>
  <name>dfs.name.dir</name>
  <value>/home/ubuntu/code/hdfs/namenode/</value>
 </property>
 <property>
  <name>dfs.data.dir</name>
  <value>/home/ubuntu/code/hdfs/datanode/</value>
 </property>
</configuration>" > etc/hadoop/hdfs-site.xml

./bin/hdfs namenode -format
