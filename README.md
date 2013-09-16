> #### Quick Setup
> 
> ```
> git clone --recursive git@github.com:[USERNAME]/REPONAME.git REPONAME
> curl -L https://github.com/foobugs/project-scaffolds/archive/apache-mysql-php.tar.gz | tar -C REPONAME/ --strip-components 1 -xzf -
> cd REPONAME/
> bin/git-add-submodules
> bin/install-vagrant-nfs-sudoers.sh
> vagrant up
> vagrant ssh
> cd /vagrant
> ```

# project-scaffolds

Collection of scaffolds for different project setups.
