> #### Quick Setup
> 
> ```
> git clone --recursive git@github.com:[USERNAME]/REPONAME.git REPONAME
> curl -L -O https://github.com/foobugs/project-scaffolds/archive/default.tar.gz | tar -C REPONAME/ --strip-components 1 -xzf default.tar.gz
> cd REPONAME/
> sudo bin/install-vagrant-sudoers.sh
> vagrant up
> vagrant ssh
> cd /vagrant
> ```

# project-scaffolds

Collection of scaffolds for different project setups.
