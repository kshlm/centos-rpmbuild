# CentOS-RPMBuilder

This repository contains a `Vagrantfile` which sets up a docker container ready to build rpms using mock. Provisioning the container uses Ansible, so it must be installed on the Vagrant host.

The `build-rpms.sh` script builds RPMs using mock for Fedora 24 or CentOS 7 from a tarball, provided the tarball has a specfile.

## How to use this

```sh
vagrant up
cp <tarball> .
vagrant ssh
cd /vagrant
./build-rpms.sh (fedora|centos) <output-directory>
```

> NOTE: This was mainly done to build GlusterFS rpms from the tarballs obtained by doing a `make dist`
