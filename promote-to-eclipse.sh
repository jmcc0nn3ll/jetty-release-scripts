#!/bin/sh

if [ $# -ne 1 ]
then
  echo "Usage: ./promote-to-eclipse.sh 7.5.3.v20111011";
  exit;
fi

git clone ssh://git.eclipse.org/gitroot/jetty/org.eclipse.jetty.project.git

cd org.eclipse.jetty.project;

git checkout jetty-$1;

mvn -Paggregate-site javadoc:aggregate jxr:jxr;

mvn -N site:deploy;

cd ..;

rm -Rf org.eclipse.jetty.project;

echo "making local storage";
local_storage=eclipse-$1;
mkdir -p $local_storage;

curl_cli="curl";

curl_user_agent="--user-agent \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/14.0.835.186 Safari/535.1\"";

url="http://repo2.maven.org/maven2/org/eclipse/jetty/jetty-distribution/$1";

echo "getting remote files";

filename=jetty-distribution-$1.tar.gz.asc;
$curl_cli $curl_user_age $url/$filename > $local_storage/$filename;

filename=jetty-distribution-$1.tar.gz.asc.md5;
$curl_cli $curl_user_age $url/$filename > $local_storage/$filename;

filename=jetty-distribution-$1.tar.gz.asc.sha1;
$curl_cli $curl_user_age $url/$filename > $local_storage/$filename;

filename=jetty-distribution-$1.tar.gz.md5;
$curl_cli $curl_user_age $url/$filename > $local_storage/$filename;

filename=jetty-distribution-$1.tar.gz.sha1;
$curl_cli $curl_user_age $url/$filename > $local_storage/$filename;

filename=jetty-distribution-$1.tar.gz;
$curl_cli $curl_user_age $url/$filename > $local_storage/$filename;

filename=jetty-distribution-$1.zip.asc;
$curl_cli $curl_user_age $url/$filename > $local_storage/$filename;

filename=jetty-distribution-$1.zip.asc.md5;
$curl_cli $curl_user_age $url/$filename > $local_storage/$filename;

filename=jetty-distribution-$1.zip.asc.sha1;
$curl_cli $curl_user_age $url/$filename > $local_storage/$filename;

filename=jetty-distribution-$1.zip;
$curl_cli $curl_user_age $url/$filename > $local_storage/$filename;

filename=jetty-distribution-$1.zip.md5;
$curl_cli $curl_user_age $url/$filename > $local_storage/$filename;

filename=jetty-distribution-$1.zip.sha1;
$curl_cli $curl_user_age $url/$filename > $local_storage/$filename;

echo "making remote directory";
ssh jmcconnell@build.eclipse.org "mkdir -p /home/data/users/jmcconnell/downloads/jetty/$1/dist";

echo "fixing apidocs";
ssh jmcconnell@build.eclipse.org "mv /home/data/users/jmcconnell/downloads/jetty/$1/jetty-project/apidocs /home/data/users/jmcconnell/downloads/jetty/$1/apidocs";

echo "fixing xref";
ssh jmcconnell@build.eclipse.org "mv /home/data/users/jmcconnell/downloads/jetty/$1/jetty-project/xref /home/data/users/jmcconnell/downloads/jetty/$1/xref";

echo "smoking jetty-project leftovers";
ssh jmcconnell@build.eclipse.org "rm -Rf /home/data/users/jmcconnell/downloads/jetty/$1/jetty-project";

echo "copying goods into location";
scp -r $local_storage/* jmcconnell@build.eclipse.org:/home/data/users/jmcconnell/downloads/jetty/$1/dist;

echo "regenerating remote site";
ssh jmcconnell@build.eclipse.org "cd /home/data/users/jmcconnell/downloads/jetty && ./index.sh";

echo "removing local storage"
rm -Rf $local_storage;

