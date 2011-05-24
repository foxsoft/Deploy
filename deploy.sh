bash -c '
yum update -y
yum install emacs which gcc gcc-c++ make gettext-devel expat-devel curl-devel zlib-devel openssl-devel perl cpio expat-devel gettext-devel wget bzip2 sendmail mailx libxml2 libxml2-devel libxslt libxslt-devel readline-devel ImageMagick patch -y
service sendmail start
wget http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el5.rf.i386.rpm
rpm -i rpmforge-release-0.5.2-2.el5.rf.i386.rpm
yum install git-core -y
iptables -I RH-Firewall-1-INPUT 3 -p tcp -m tcp --dport 80 --tcp-flags SYN,RST,ACK SYN -j ACCEPT
service iptables save
bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
source /etc/profile
rvm install ree
rvm install 1.9.2
rvm --default 1.9.2
rvm use ree
rvm gemset create puppet
rvm gemset use puppet
groupadd puppet
useradd -g puppet puppet
usermod -G rvm puppet
adduser rails
usermod -G rvm rails
su puppet
rvm ree@puppet
gem install puppet
rvm 1.9.2@global
gem install bundler
echo "
10.176.71.212     puppetmaster" >> /etc/hosts
reboot'