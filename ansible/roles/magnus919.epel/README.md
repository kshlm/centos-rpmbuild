ansible-epel
========

Ansible role installs and enables EPEL for RHEL and CentOS systems. This will first ensure that the correct EPEL signing key is in your RPM database, and then make sure the repository file is created.

Requirements
------------

* libselinux-python package must be installed for this to run properly.

Role Variables
--------------

This module only uses the pre-configured variables to determine your Enterprise Linux major release and architecture. No other variables need be set.

Dependencies
------------

N/A

Example Playbook
-------------------------

You will want to import this role conditionally, perhaps as such:

	- hosts: all
	  roles:
	  - { role: magnus919.epel, when: ansible_os_family == 'RedHat' }


License
-------

MIT

Author Information
------------------

Magnus Hedemark <magnus@yonderway.com>
