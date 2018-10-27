# babun-ansible-shim
Two scripts called by Vagrant or manually to allow babun to correctly access the windows filesystem

ansible-playbook.bat will be executed instead of the symbolic link to the ansible binary. 
This file must reside in .babun/cygwin/bin/ with the ansible-playbook link. 
This path must also be in windows environment variables example c:\users\user\.babun\cygwin\bin\

ansible-playbook-shim.sh is a bash shell script that gets called by ansible-playbook.bat in the babun subsystem. 
It formats the windows paths to cygwin paths and passes the correct parameters to ansible. This file should reside in /.babun/cygwin/usr/local/bin/ 
Permissions need to be set for execute like 
$ chmod u+x 

Ansible still always displays the message that windows is not a supported control platform. It works just fine.
In Vagrant, set ansible.compatibility_mode = "2.0" in the provisioning section of the Vagrantfile
Also make sure you use/ install python 2.7 on the remote machine, using python 3 as the interpreter works intermittently.
Packages like python-minimal or python-simplejson are ideal.



