> #### Quick Setup
> 
> ```
> git clone --recursive git@github.com:[USERNAME]/REPONAME.git REPONAME
> cd REPONAME/
> # http://git.io/2DJ79w = https://github.com/foobugs/project-scaffolds/archive/default.tar.gz
> curl -L http://git.io/2DJ79w | tar --strip-components 1 -xzf -
> bin/git-add-submodules
> bin/install-vagrant-nfs-sudoers
> vagrant up
> vagrant ssh
> cd /vagrant
> ```

# project-scaffolds

Collection of scaffolds for different project setups.
