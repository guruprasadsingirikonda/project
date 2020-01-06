# project

Before executing the scripts, Please have kubectl, docker and git installed on server.

Clone the git repo using "git clone https://github.com/guruprasadsingirikonda/project.git" and execute bash script with the following command "bash -x bashscript.sh", So you can see the output on your terminal.

I've pushed the same docker image to DockerRegistry and using the same image created kubernetes manifest.

Use below steps to see the result:

1. We've two files for the deployment and service.

Creates a service for deployment and expose to outside world and following command will deploy.

kubectl apply -f profileweb-svc.yml

kubectl apply -f profileweb.yml

kubectl get svc  (you'll find deployment profileweb-svc on which port its running. just put the server IP along with the port will see the page. eg: 10.10.2.1:30130)

Deployment is highly available because it has x no.of replicas. eg: if one of the pod got killed or deleted immediatley another pod will spun up. 

In production cases can use HPA for PODS, AutoScaler for Nodes, Metrics-server for monitoring and etc..

Ingress controller:

cd nginx-ingress-controller

Here we've three yamls to deploy Nginix-Ingress controller.
We're exposing Nginix-Ingress controller by creating a service of type "loadbalancer".
In casde of AWS, it will be  an Elastic Load Balancer (ELB) to expose the NGINX Ingress controller behind a Service of Type=LoadBalancer.

1. mandatory yaml is used get ingress-controller and deployment stuff.
2. service yaml is used to specify the loadbalancer type and port.

kubectl apply -f mandatory.yaml

kubectl apply -f service-l4.yaml

kubectl apply -f patch-configmap-l4.yaml

By this time we will have an nignix-controller setup.

Now we've to pass the deployment service name to Ingress-controller.

cd ..

kubectl apply -f profile-ingress.yml

kubectl get ing (we have an address copy and browse it)
