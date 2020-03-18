echo %1

vagrant snapshot save k8-master-node k8-master-node-%1
vagrant snapshot save k8-worker-node-1 k8-worker-node-1-%1
vagrant snapshot save k8-worker-node-2 k8-worker-node-2-%1