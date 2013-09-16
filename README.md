> #### Quick Setup
> 
> ```
> git clone --recursive git@github.com:[USERNAME]/REPONAME.git REPONAME
> cd REPONAME/
> curl -L https://github.com/foobugs/project-scaffolds/archive/apache-mysql-php.tar.gz | tar --strip-components 1 -xzf -
> bin/git-add-submodules
> bin/install-vagrant-nfs-sudoers.sh
> vagrant up
> vagrant ssh
> cd /vagrant
> ```

# project-scaffolds

Collection of scaffolds for different project setups.
