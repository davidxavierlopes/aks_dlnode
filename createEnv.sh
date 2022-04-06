. ./properties

az group create -n $RG -l $LOCATION
az aks create -n $CLUSTER -g $RG -l $LOCATION --node-count 3
az aks get-credentials -n $CLUSTER -g $RG
NODE=$(kubectl get nodes | awk 'FNR==2 {print $1}')
kubectl delete node $NODE
