lab_systems
===========

production                # inventory file for production servers
stage                     # inventory file for stage environment

group_vars/
   group1                 # here we assign variables to particular groups
   group2                 # ""
host_vars/
   hostname1              # if systems need specific variables, put them here
   hostname2              # ""

site.yml                  # master playbook
webservers.yml            # playbook for webserver tier
dbservers.yml             # playbook for dbserver tier

roles/
    common/               # this hierarchy represents a "role"
        tasks/            #
            main.yml      #  <-- tasks file can include smaller files if warranted
        handlers/         #
            main.yml      #  <-- handlers file
        templates/        #  <-- files for use with the template resource
            ntp.conf.j2   #  <------- templates end in .j2
        files/            #
            bar.txt       #  <-- files for use with the copy resource

    webtier/              # same kind of structure as "common" was above, done for the webtier role
    monitoring/           # ""
    fooapp/               # ""


NOTES

* Glance needs to be defined as a hostname
* Make sure to change the passwords in the group_vars/all file
* TODO: quantum needs its own namespace and passwords
* TODO: the netnode is logging too much in auth.log this needs to be fixed with pam and the sudoers file for quantum
* TODO: script the eth up for the flat network or vlan network
* TODO: set the hostname correctly in /etc/hostname not only by /usr/bin/hostname
* TODO: make sure the vnc proxy uses the ip address for the compute node (this is used for local purposes only as the the controller name is not known in the dns currently)

ERRATA

ubuntu seems to loose it's locale settings sometimes. You can fix this by:

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8
dpkg-reconfigure locales

Make sure you use the right language settings
