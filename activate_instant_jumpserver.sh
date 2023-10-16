#!/bin/bash
set -ex

# set parameters
export ID=$(date +%s)
export KEYNAME="id_rsa_$ID"
export GROUP_NAME="jumpserverRG$ID"
export LOCATION="japaneast"
export VM_NAME="jumpserverVM$ID"
export IMAGE="Ubuntu2204"
export SIZE="Standard_B1s"
export USERNAME="azureuser"

export SLEEP_SEC=3

# create keys
ssh-keygen -m PEM -t rsa -b 4096 -C $USERNAME -f $HOME/.ssh/$KEYNAME -N ""

# create resource group
az group create --name $GROUP_NAME --location $LOCATION
# create vm
az vm create  \
    --resource-group $GROUP_NAME \
    --name $VM_NAME \
    --image $IMAGE \
    --size $SIZE \
    --admin-user $USERNAME \
    --public-ip-sku Standard \
    --ssh-key-values $HOME/.ssh/$KEYNAME.pub

# Check the public IP address
export PUBLIC_IP=$(az vm show -d -g $GROUP_NAME -n $VM_NAME --query publicIps -o tsv)

# SSH Dynamic Port Forwarding
sleep $SLEEP_SEC
ssh -oStrictHostKeyChecking=no -D 1080 -i $HOME/.ssh/$KEYNAME $USERNAME@$PUBLIC_IP

# clean up
az group delete --name $GROUP_NAME --no-wait --yes
ssh-keygen -R $PUBLIC_IP
rm $HOME/.ssh/$KEYNAME
rm $HOME/.ssh/$KEYNAME.pub
