#!/bin/sh

if [ $# -ne 2 ]
then
  echo "Usage: ./promote-to-codehaus.sh 7.5.3.v20111011 7.5.3";
  exit;
fi

echo "making local storage";
local_storage=jetty-hightide-$2;
mkdir -p $local_storage;

curl_cli="curl";

curl_user_agent="--user-agent \"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/14.0.835.186 Safari/535.1\"";

url="http://repo2.maven.org/maven2/org/mortbay/jetty/jetty-hightide/$1";

echo "getting remote files";

filename=jetty-hightide-$1.tar.gz.asc;
$curl_cli $curl_user_age $url/$filename > $local_storage/$filename;

filename=jetty-hightide-$1.tar.gz.asc.md5;
$curl_cli $curl_user_age $url/$filename > $local_storage/$filename;

filename=jetty-hightide-$1.tar.gz.asc.sha1;
$curl_cli $curl_user_age $url/$filename > $local_storage/$filename;

filename=jetty-hightide-$1.tar.gz.md5;
$curl_cli $curl_user_age $url/$filename > $local_storage/$filename;

filename=jetty-hightide-$1.tar.gz.sha1;
$curl_cli $curl_user_age $url/$filename > $local_storage/$filename;

filename=jetty-hightide-$1.tar.gz;
$curl_cli $curl_user_age $url/$filename > $local_storage/$filename;

filename=jetty-hightide-$1.zip.asc;
$curl_cli $curl_user_age $url/$filename > $local_storage/$filename;

filename=jetty-hightide-$1.zip.asc.md5;
$curl_cli $curl_user_age $url/$filename > $local_storage/$filename;

filename=jetty-hightide-$1.zip.asc.sha1;
$curl_cli $curl_user_age $url/$filename > $local_storage/$filename;

filename=jetty-hightide-$1.zip;
$curl_cli $curl_user_age $url/$filename > $local_storage/$filename;

filename=jetty-hightide-$1.zip.md5;
$curl_cli $curl_user_age $url/$filename > $local_storage/$filename;

filename=jetty-hightide-$1.zip.sha1;
$curl_cli $curl_user_age $url/$filename > $local_storage/$filename;


echo "open https://dav.codehaus.org/dist/jetty" >> codehaus-$1.cavaderrc;

echo "mkcol $local_storage" >> codehaus-$1.cavaderrc;

echo "mput $local_storage/*" >> codehaus-$1.cavaderrc;

echo "quit" >> codehaus-$1.cavaderrc;

cadaver -r codehaus-$1.cavaderrc;

rm codehaus-$1.cavaderrc;

rm -Rf $local_storage;


url="http://repo2.maven.org/maven2/org/mortbay/jetty/dist/jetty-deb/$1";

echo "getting remote deb files";

deb_storage=$1;

mkdir $deb_storage;

filename=jetty-deb-$1-javadoc.deb.asc;
$curl_cli $curl_user_age $url/$filename > $deb_storage/$filename;

filename=jetty-deb-$1-javadoc.deb.asc.md5;
$curl_cli $curl_user_age $url/$filename > $deb_storage/$filename;

filename=jetty-deb-$1-javadoc.dev.asc.sha1;
$curl_cli $curl_user_age $url/$filename > $deb_storage/$filename;

filename=jetty-deb-$1-javadoc.deb;
$curl_cli $curl_user_age $url/$filename > $deb_storage/$filename;

filename=jetty-deb-$1-javadoc.deb.md5;
$curl_cli $curl_user_age $url/$filename > $deb_storage/$filename;

filename=jetty-deb-$1-javadoc.deb.sha1;
$curl_cli $curl_user_age $url/$filename > $deb_storage/$filename;

filename=jetty-deb-$1.deb.asc;
$curl_cli $curl_user_age $url/$filename > $deb_storage/$filename;

filename=jetty-deb-$1.deb.asc.md5;
$curl_cli $curl_user_age $url/$filename > $deb_storage/$filename;

filename=jetty-deb-$1.deb.asc.sha1;
$curl_cli $curl_user_age $url/$filename > $deb_storage/$filename;

filename=jetty-deb-$1.deb;
$curl_cli $curl_user_age $url/$filename > $deb_storage/$filename;

filename=jetty-deb-$1.deb.md5;
$curl_cli $curl_user_age $url/$filename > $deb_storage/$filename;

filename=jetty-deb-$1.deb.sha1;
$curl_cli $curl_user_age $url/$filename > $deb_storage/$filename;

echo "open https://dav.codehaus.org/dist/jetty/deb" >> codehaus-deb-$1.cavaderrc;

echo "mkcol $deb_storage" >> codehaus-deb-$1.cavaderrc;

echo "mput $deb_storage/*" >> codehaus-deb-$1.cavaderrc;

echo "quit" >> codehaus-deb-$1.cavaderrc;

cadaver -r codehaus-deb-$1.cavaderrc;

rm codehaus-deb-$1.cavaderrc;

rm -Rf $deb_storage;

url="http://repo2.maven.org/maven2/org/mortbay/jetty/dist/jetty-rpm/$1";

echo "getting remote rpm files";

rpm_storage=$1;

mkdir $rpm_storage;

filename=jetty-rpm-$1-javadoc.rpm.asc;
$curl_cli $curl_user_age $url/$filename > $rpm_storage/$filename;

filename=jetty-rpm-$1-javadoc.rpm.asc.md5;
$curl_cli $curl_user_age $url/$filename > $rpm_storage/$filename;

filename=jetty-rpm-$1-javadoc.rpm.asc.sha1;
$curl_cli $curl_user_age $url/$filename > $rpm_storage/$filename;

filename=jetty-rpm-$1-javadoc.rpm;
$curl_cli $curl_user_age $url/$filename > $rpm_storage/$filename;

filename=jetty-rpm-$1-javadoc.rpm.md5;
$curl_cli $curl_user_age $url/$filename > $rpm_storage/$filename;

filename=jetty-rpm-$1-javadoc.rpm.sha1;
$curl_cli $curl_user_age $url/$filename > $rpm_storage/$filename;

filename=jetty-rpm-$1.rpm.asc;
$curl_cli $curl_user_age $url/$filename > $rpm_storage/$filename;

filename=jetty-rpm-$1.rpm.asc.md5;
$curl_cli $curl_user_age $url/$filename > $rpm_storage/$filename;

filename=jetty-rpm-$1.rpm.asc.sha1;
$curl_cli $curl_user_age $url/$filename > $rpm_storage/$filename;

filename=jetty-rpm-$1.rpm;
$curl_cli $curl_user_age $url/$filename > $rpm_storage/$filename;

filename=jetty-rpm-$1.rpm.md5;
$curl_cli $curl_user_age $url/$filename > $rpm_storage/$filename;

filename=jetty-rpm-$1.rpm.sha1;
$curl_cli $curl_user_age $url/$filename > $rpm_storage/$filename;

echo "open https://dav.codehaus.org/dist/jetty/rpm" >> codehaus-rpm-$1.cavaderrc;

echo "mkcol $rpm_storage" >> codehaus-rpm-$1.cavaderrc;

echo "mput $rpm_storage/*" >> codehaus-rpm-$1.cavaderrc;

echo "quit" >> codehaus-rpm-$1.cavaderrc;

cadaver -r codehaus-rpm-$1.cavaderrc;

rm codehaus-rpm-$1.cavaderrc;

rm -Rf $rpm_storage;


