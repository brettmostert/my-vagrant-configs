# vagrant notes and reminders

TODO 1 : Run Vagrant Up for K8 (PASS IN USERNAME and PASSWORD or it will default to admin admin)
TODO 2 : Then run #ssh-copy-id admin@hostname to copy ssh key correctly - login to check it
TODO 3 : Setup ansible to use ssh pub/pvt ket instead
https://k8-master-node:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
https://k8-master-node:<apiserver-port>/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/

access proxy - remove kubecongi for me...
kubectl --kubeconfig ./admin.conf proxy

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



install nginx mandarot
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/mandatory.yaml
kubectl scale deployment/nginx-ingress-controller -n ingress-nginx --replicas=2


certs

kubectl create namespace cert-manager
kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v0.14.0/cert-manager.yaml

kubectl apply -f test-issuer.yaml
kubectl describe certificate -n cert-manager-test
kubectl delete -f test-issuer.yaml


kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-rc6/aio/deploy/recommended.yaml

KUBE_EDITOR="nano" kubectl -n ingress-nginx edit deployment nginx-ingress-controller

KUBE_EDITOR="nano" kubectl -n ingress-nginx edit service ingress-nginx

kubectl get pods -n cert-manager
