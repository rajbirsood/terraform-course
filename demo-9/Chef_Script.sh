#!/bin/sh
sudo apt-get update
sudo apt-get install git
sudo apt-get install dpkg

chef_repo="$HOME/chef-repo"
cd $HOME
echo $chef_repo

test -d "/opt/chef" || \
(
  # Install Chef solo("omnibus")
    #
   echo '-- Installing Chef -----------';
  curl -L http://www.opscode.com/chef/install.sh | bash
)

  # Create neccessary Chef resources and configs
  #
echo '-- Copying cookbooks and configs'

test -f "/usr/bin/chef" || \
(
echo "installing chefdk"
wget https://packages.chef.io/files/stable/chefdk/2.4.17/ubuntu/16.04/chefdk_2.4.17-1_amd64.deb
sudo dpkg -i *.deb
)

git clone https://github.com/rajbirsood/chef-repo.git

: '
if [ -d "$chef_repo" ];
  then
   echo "$chef_repo exist."
    sudo rm -rf $chef_repo
    git clone https://github.com/rajbirsood/chef-repo.git
  else
   echo "$chef_repo does not exist" >&2dministrator
   git clone https://github.com/rajbirsood/chef-repo.git
fi
'
cd $chef_repo

sudo chef-solo -c .chef/solo.rb -j .chef/solo.json

