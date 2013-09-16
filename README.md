> #### Quick Setup
> 
> ```
> git clone --recursive git@github.com:[USERNAME]/REPONAME.git REPONAME
> cd REPONAME/
> curl -L https://github.com/foobugs/project-scaffolds/archive/nginx-mysql-php.tar.gz | tar --strip-components 1 -xzf -
> bin/git-add-submodules
> bin/install-vagrant-nfs-sudoers
> vagrant up
> vagrant ssh
> cd /vagrant
> ```

# project-scaffolds

Collection of scaffolds for different project setups.
