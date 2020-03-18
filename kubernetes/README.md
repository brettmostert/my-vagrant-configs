# K8 - 3 Node Cluster (Home Lab Setup)

## Outcomes

- [x] 3 Instances Provisioned (SNAPSHOT-REF:stage1)
- [x] Accesss via pub/pvt keys (SNAPSHOT-REF:stage2)
- [x] K8 - 3 Node Cluster (1 Master, 2 Workers) (SNAPSHOT-REF:stage3)
  - [x] Provide naming for kubernetes cluster (using config during init)
  - [ ] Copy kubeconfig to local from remote (https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/)
- [ ] NGINX Ingress Controller Installed
- [ ] SSL Certificates automatically provisioned from Lets Encrypt
- [ ] Basic Web Site Running on NGINX for Testing
- [ ] Basic Web Site Externalised via INGRESS (HTTPS)
- [ ] K8 Dashboard Installed
- [ ] K8 Dashboard Externalised via INGRESS (HTTPS)

## Tools Used

- Vagrant (Spinning up Hyper-V VM's on Windows) via the CMD line
- Ansible (Configuration of Hosts / VM's) via WSL
- CMD to run Vagrant (as vagrant requires access to Hyper-V)
- WSL (Ubuntu) for pretty much everything else including Ansible

## Project Layout

```ASCII
project
|-- configuration             // Ansible stuff here
|-- infrastructure            // Vagrant stuff here
```

## Infrastructure via Vagrant

Vagrant will provision 3 instances on hyper-v, each running Ubuntu (18.04.3 LTS),

- RAM = 1024 (MIN) 3072 (MAX)
- CPU = 2
- IP = Auto Allocated
- Network

**Virtual Machine Names**

- k8-master-node
- k8-worker-node-1
- k8-worker-node-2

The above machine names can be changed in the Vagrantfile, by editing the JSON, see example below.

```JSON
servers = [
  {
    :name => "k8-master-node",
...
```

**Basic Commands**

When "vagrant up" is run, it will provision the configured VM's and execute the bootstrap script which creates an "admin" user so this user can be used for SSH access, which is needed by ansible, or atleast for the intial setup.

```cmd
vagrant up
```

```cmd
vagrant destroy -f
```

**"Advanced" Commands**

One user is created by default, username: admin, password: admin, to overide this set the following variables.

- VAGRANT_USERNAME (default "admin")
- VAGRANT_PASSWORD (default "admin")
- VAGRANT_NETWORK_BRIDGE (default "External")

Example 1 (via CMD)

```cmd
set "VAGRANT_USERNAME=administrator" && set "VAGRANT_PASSWORD=12345" && vagrant up
```

Example 2 (via CMD)

```cmd
set "VAGRANT_PASSWORD=12345" && vagrant up
```

## Configuration via Ansible

Ansible will configure the 3 provisioned instances as a k8 cluster. In order to do so the following is run via bash.

The first playbook, simply creates an "ansible" user and copies you public ssh key to each node. So that we do not have to type in anymore passwords. Replace "admin" with the username created when vagrant provisioned the instances.

**Prior to running playbooks...**

If you dont know what this does, read the [documentation](https://docs.ansible.com/ansible/devel/reference_appendices/config.html#cfg-in-world-writable-dir).

```bash
export ANSIBLE_CONFIG="/project/ansible.cfg"
```

**Note:** *By default the "~/.ssh/id_rsa.pub" key is used.*

**Basic Command**

```bash
ansible-playbook setup_nodes.yml --user admin --ask-pass
```

**Alternate Command** - To specify a different public key

```bash
ansible-playbook setup_nodes.yml --user admin --ask-pass --extra-vars "copy_local_key=/mypublickey.pub"
```

next, self explanatory, read the yaml file.

```bash
ansible-playbook setup_k8.yml
```

**Alternate Command** - To specify a different cluster name

```bash
ansible-playbook setup_k8.yml --extra-vars "k8_cluster_name=my_k8_cluster_name"
```

*more to come soon.*