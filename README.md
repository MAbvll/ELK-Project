# ELK-Project
# Mark Abel, author 
Repository for the cloud security ELK project

https://github.com/MAbvll/ELK-Project

# Azure diagram
The files in this repository were used to configure the network depicted below.

https://github.com/MAbvll/ELK-Project/blob/main/Diagrams/ELK-Project.drawio.pdf

Azure deployment diagram:
[logo] https://github.com/MAbvll/ELK-Project/blob/main/Diagrams/ELK-Project.drawio.pdf


# Ansible
These files have been tested and used to generate several containers in the Azure environment.  The listed playbook files are for their respective applications.

- DVWA (D*mn Vulnerable Web App) container playbook:  https://github.com/MAbvll/ELK-Project/blob/34c8791c7ced026a8f83e365d153c75f9ff53862/Ansible/my-playbook.yml
- ELK stack container playbook:  https://github.com/MAbvll/ELK-Project/blob/34c8791c7ced026a8f83e365d153c75f9ff53862/Ansible/install-elk.yml
- Filebeat container playbook:  https://github.com/MAbvll/ELK-Project/blob/34c8791c7ced026a8f83e365d153c75f9ff53862/Ansible/filebeat-playbook.yml
- Filebeat configuration file:  https://github.com/MAbvll/ELK-Project/blob/34c8791c7ced026a8f83e365d153c75f9ff53862/Ansible/filebeat-config.yml
- Metricbeat container playbook:  https://github.com/MAbvll/ELK-Project/blob/34c8791c7ced026a8f83e365d153c75f9ff53862/Ansible/metricbeat-playbook.yml
- Metricbeat configuration file:  https://github.com/MAbvll/ELK-Project/blob/34c8791c7ced026a8f83e365d153c75f9ff53862/Ansible/metricbeat-config.yml
- Ansible configuration file:  https://github.com/MAbvll/ELK-Project/blob/34c8791c7ced026a8f83e365d153c75f9ff53862/Ansible/ansible.cfg
- Ansible hosts file:  https://github.com/MAbvll/ELK-Project/blob/34c8791c7ced026a8f83e365d153c75f9ff53862/Ansible/hosts


# Summary of contents

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.  In addition, these VMs are running Filebeat and Metricbeat containers.

Load balancing ensures that the application will be highly available and redundant, in addition to restricting access to the network.  Providing a load balancer ensures that the DVWA containers are protected from DDoS attacks.  The jumpbox acts as a proxy for configuring the containers in the Azure deployment.  In conjunction with restrictive security group policies, this ensures that only the jumpbox has access to the containers on port 22 for configuration.  

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the _____ and system _____.
- Filebeat collects data about the file system.
- Metricbeat collects metrics regarding the system (CPU usage, disk space, machine uptime, etc.)

The configuration details of each machine may be found below.

| Name                   | Function                                           | IP Address | Operating System |
|------------------------|----------------------------------------------------|------------|------------------|
| UCB-UbuntuJumpBox      | Gateway and container provisioner                  | 10.0.0.4   | Ubuntu Linux     |
| UCB-Web-1              | DVWA,Filebeat,Metricbeat container                 | 10.0.0.5   | Ubuntu Linux     |  
| UCB-Web-2              | DVWA,Filebeat,Metricbeat container                 | 10.0.0.6   | Ubuntu Linux     |
| UCB-Project-Elk-Server | Collect logs, metrics and data from DVWA containers| 10.1.0.4   | Ubuntu Linux     |


### Access Policies

The machines on the internal network are not exposed to the public internet.  My public IP is the only whitelisted IP for accessing any Azure machines.

The following machines in the Azure cloud accept access from my public IP only on the specified ports:
- UCB-UbuntuJumpBox:22
- UCB-Web-1/2:80
- UCB-Project-Elk-Server:5601

The following IP addresses are the only public IPs whitelisted for access from the internet
- 98.37.45.242

Machines within the network can only be accessed by UCB-UbunutJumpBox on port 22.
- My public IP (98.37.45.242) is the only machine that can access the ELK server web interface on port 5601.  The jumpbox has access to the ELK private IP on port 22 only.

A summary of the access policies in place can be found in the table below.

| Name                                 | Publicly Accessible | Allowed IP Addresses                  | Allowed Ports                   |
|--------------------------------------|---------------------|---------------------------------------|---------------------------------|
| Jump Box (UCB-UbuntuJumbBox)         | Yes                 | 98.37.45.242                          | 22                              |  
| DVWA containers (UCB-Web-1/2)        | Yes                 | 98.37.45.242, 10.0.0.4                | 80 (public), 22 (jumpbox only)  |
| ELK server (UCB-Project-Elk-Server)  | Yes                 | 98.37.45.242, 10.0.0.4                | 5601 (public), 22 (jumpbox only)|

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually.  By automating the configuration with Ansible, the containers can be configured very quickly in case one or more go down.

The playbook implements the following tasks:

- Step 1:  Install Docker on the jumpbox.  This is done with the command **_sudo apt install docker.io_**
- Step 2:  Install Ansible image in Docker.  This is done with the command **_sudo docker pull cyberxsecurity/ansible_**
- Step 3:  Launch the Ansible container.  The procedure is as follows:
  - Run **_sudo docker container list -a_** to see the list of available containers.  The name in the last column is the Ansible container name (for example:  awesome_noyce)
  - Run **_sudo docker start <container name>_**
    - example:  **_sudo docker start awesome_noyce_**
  - Run **_sudo docker attach <container name>_**
    - example:  **_sudo docker attach awesome_noyce_** 
- Step 4:  Edit the hosts and *ansible.cfg* files located in */etc/ansible*
  - Edit the hosts file to include the IP addresses of your DVWA vms.  
  - Edit the *ansible.cfg* file to configure the remote username of the DVWA containers for SSH access.
- Step 5:  Create and run the Ansible playbook file to configure the DVWA containers.
  - Playbook file should be created with the *.yml* extension with the relevant information (please see DVWA playbook link for configuation)
  - Once the playbook is created, run **_ansible-playbook <playbookname.yml>_** to configure the container.
   - example:  **_ansible-playbook install-elk.yml_**
The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

[logo] https://github.com/MAbvll/ELK-Project/blob/b044a96b0dcbe70a5d109ced6354f734ba8d6faf/Images/docker_ps_output.png


### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.5
- 10.0.0.6

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat is used to collect and organize log files for a system.  For example, the *_apache_* module in Filebeat is used for collecting logs related to the Apache HTTP server.
- Metricbeat is used to collect metrics for a machine.  Some of these metrics are CPU usage, disk usage, and uptime.  For this example, the *_system_* module is used in Metricbeat to view metrics related to CPU, memory, disk, etc.


### Using the Playbook
In order to use the DVWA playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the playbook file to *_/etc/ansible_*.
- Update the hosts file to include the following:
 - DVWA container IPs
- Update the ansible.cfg file to include the following:
 - remote user name for SSH 
- Run the DVWA playbook.  Once it is finished, SSH to the new DVWA container and run *_curl localhost/setup.php_* to confirm that the playbook ran correctly.  You should get HTML output from this command.


- The playbook file contains the tasks to install the container.  It is located in /etc/ansible and is identified with a *_.yml_* extension.
- The hosts file needs to be updated with the correct IP addresses under the correct group name.  This group name is specified in the playbook file so that it targets the correct machines.  With regards to Filebeat, the *_filebeat-playbook.yml_* playbook file tells you to install Filebeat on the DVWA containers, whereas the *_filebeat-config.yml_* file specifies the ELK server is where to send the data.
- Navigate to this URL to confirm that the ELK server is running:  http://20.106.94.43:5601/app/kibana

