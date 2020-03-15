# vagrant notes and reminders
Vagrant Files


 export ANSIBLE_HOST_KEY_CHECKING=False

 worker2 ansible_host=k8-worker-node-2 ansible_ssh_host=k8-worker-node-2 ansible_ssh_port=22 ansible_user='vagrant' ansible_password='vagrant'


 vagrant snapshot save k8-master-node k8-master-node-before-master-playbook
 

 ==> k8-master-node: Snapshotting the machine as 'k8-master-node-before-master-playbook'...
==> k8-master-node: Snapshot saved! You can restore the snapshot at any time by
==> k8-master-node: using `vagrant snapshot restore`. You can delete it using
==> k8-master-node: `vagrant snapshot delete`.

https://thenewstack.io/how-to-deploy-a-kubernetes-cluster-with-ubuntu-server-18-04/
https://www.digitalocean.com/community/tutorials/how-to-create-a-kubernetes-cluster-using-kubeadm-on-ubuntu-18-04
kubectl create deployment nginx --image=nginx
kubectl expose deploy nginx --port 80 --target-port 80 --type NodePort
kubectl get services
kubectl delete service nginx
kubectl get services
kubectl delete deployment nginx
kubectl get deployments

scp ubuntu@k8-master-node:/etc/kubernetes/admin.conf .
kubectl --kubeconfig ./admin.conf get nodes


scp root@<control-plane-host>:/etc/kubernetes/admin.conf .
kubectl --kubeconfig ./admin.conf proxy


kubectl --kubeconfig ./admin.conf create deployment nginx --image=nginx
kubectl --kubeconfig ./admin.conf expose deploy nginx --port 80 --target-port 80 --type NodePort