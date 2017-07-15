#!/bin/sh
## one script to be used by travis, jenkins, packer...

umask 022

rolesdir=$(dirname $0)/..

#[ ! -d $rolesdir/juju4.redhat-epel ] && git clone https://github.com/juju4/ansible-redhat-epel $rolesdir/juju4.redhat-epel
## galaxy naming: kitchen fails to transfer symlink folder
#[ ! -e $rolesdir/juju4.harden ] && ln -s ansible-harden $rolesdir/juju4.harden
[ ! -e $rolesdir/jdauphant.unbound ] && cp -R $rolesdir/ansible-role-unbound $rolesdir/jdauphant.unbound

## don't stop build on this script return code
true

