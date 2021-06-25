## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

(Images/Diagramming_the_Network.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the yaml file may be used to install only certain pieces of it, such as Filebeat.

---
- name: installing and launching filebeat
  hosts: webservers
  become: yes
  tasks:

  - name: download filebeat deb
    command: curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.4.0-amd64.deb

  - name: install filebeat deb
    command: dpkg -i filebeat-7.4.0-amd64.deb

  - name: drop in filebeat.yml
    copy:
      src: /etc/ansible/filebeat-config.yml
      dest: /etc/filebeat/filebeat.yml

  - name: enable and configure system module
    command: filebeat modules enable system

  - name: setup filebeat
    command: filebeat setup

  - name: start filebeat service
    command: service filebeat start

  - name: enable service filebeat on boot
    systemd:
      name: filebeat
      enabled: yes


This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available/redundant, in addition to restricting access to the network.
What aspect of security do load balancers protect? 
Load balancers can also defend against DDos attacks.
What is the advantage of a jump box?
A Jump Box enables us to ensure the one point of entry to our network is both hardened and heavily monitored. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the web and system logs.

Filebeat is a lightweight shipper for forwarding and centralizing log data. Installed as an agent on your servers, Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing.

Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify, such as Elasticsearch or Logstash. Metricbeat helps you monitor your servers by collecting metrics from the system and services running on the server, such as: Apache. HAProxy.

The configuration details of each machine may be found below.

| Name       | Function   | IP Address         | Operating System |
|------------|------------|--------------------|------------------|
| Jump Box   | Gateway    | 20.98.129.218      | Linux            |
| ELK-Server | Monitoring | 20.85.219.177      | Linux            |
| Web-1      | Web Server | 10.0.0.5 (Private) | Linux            |
| Web-2      | Web Server | 10.0.0.6 (Private) | Linux            |
| Web-3      | Web Server | 10.0.0.8(Private)  | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:

99.232.222.84

Machines within the network can only be accessed by SSH from the Jump Box .


A summary of the access policies in place can be found in the table below.
| Name       | Publicly Accessible? | Allowed IP Addresses |
|------------|----------------------|----------------------|
| Jump Box   | No                   | 99.232.222.84        |
| ELK-Server | No                   | 99.232.222.84        |
| Web-1      | No                   | 99.232.222.84        |
| Web-2      | No                   | 99.232.222.84        |
| Web-3      | No                   | 99.232.222.84        |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it eliminates the manual effort and ensures tasks are completed in a uniform way. 

The playbook implements the following tasks:
- Installs docker.io
- Installs python 3
- Install Docker Module
- Increases and utilizes more virtual memory
- Downloads and launches the docker elk container


The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

(Images/docker_ps.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:

| Name  | IP Address |
|-------|------------|
| Web-1 | 10.0.0.5   |
| Web-2 | 10.0.0.6   |
| Web-3 | 10.0.0.8   |


We have installed the following Beats on these machines:

FileBeats

These Beats allow us to collect the following information from each machine:

Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the playbook file to ansible docker container.
- Update the host file to include all target host IPs
- Run the playbook, and navigate to VMs to check that the installation worked as expected.

Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
The .yml file and you copy it to the etc directory within the ansible docker container you attached to. 
- _Which file do you update to make Ansible run the playbook on a specific machine? 

Update the following document: Etc/ansible/hosts

How do I specify which machine to install the ELK server on versus which to install Filebeat on?_

You need to indicate the target group noted in the hosts file. 
Example: in the host file add the following: 
[webservers]
10.0.0.5
10.0.0.6

[elk]
10.1.0.5 

The playbook should then indicate the target as follows: 
Hosts: webservers 
OR
Hosts: elk 

- _Which URL do you navigate to in order to check that the ELK server is running?

http://20.98.129.218:5601/app/kibana#/home

