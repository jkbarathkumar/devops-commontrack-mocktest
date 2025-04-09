1. 

1. Automating webserver Deployment and configuration Using Ansible Playbooks and Roles

Automating webserver deployment and configuration using ansible playbooks and Roles

Requirement:
Ansible Control node (Eg. ubuntu)
At least 2 Linux servers 
SSH access from control node to all servers

Create a directory structure for your ansible project including:

configuration file
inventory file
Role structure

Step 2 Create and configure an ansible.cfg file to use :

./inventory/hosts as the inventory
./roles as the roles path

Step 3:
Create a static inventory under inventory/hosts for two targets nodes under the group [webservers] use ansible_host and ansible_user. Also defind a group variable env=staging
Step 4:
create an ansible role named webserver using ansible-galaxy init.
Step 5:
In roles/webser/tasks/main.yml, add tasks to:
Install Apache
COpy a dynamic homepage using a jinja2 template
start and enable apache service

Add handler
roles/webserver/handlers/main.yml
- name:Restart Apache
service:
 name: apache2
 state: restarted

Step 6: Create a jinja2 template file named index.html.j2 that displays:
Hostname using {{inventory_hostname}}
Environment using {{env}}

Step 7:
Create a main playbook file site.yml to apply the webserver role on all webservers with become: yes
Ping all nodes in all the webservers group
Install curl using the apt module
Customer index.html is visible on each server via web browser or curl

step 8:
show how to run only the tasks tagged with apache.

Step 9:
Add a condition to only deploy the custom homepage if the environment is staging.

Step 10:
modify site.yml to include vault:
yaml
vars_files:
 - group_vars/all/vault.yml

Run with:
ansible-playbook site.yml --ask-vault-pass:

Apache2 installed on all web hosts
Each server shows a customized web page at http://<host-ip>

sample html code you can use:
<html>
<body>
 <h1> Welcome to {{inventory_hostname}} in {{env}} environment!</h1>
</body>
</html>
2.
![image](https://github.com/user-attachments/assets/3b274119-e3ec-49ef-90ba-ff2557701b1d)

4.
DOcker & container Internals

For the code below:
https://github.com/devops-experince/k8s-helloworld

Build a Dockerfile for a simple Python Flask app
After running the container, display:
The container ID
The working directory inside the container
The read-write layer directory on the host.

Mention the command you'd use at each step.
Check in all files including images and code into quetion4 folder in devops-commontrack-mocktest repository
