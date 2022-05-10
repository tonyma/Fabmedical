#!/bin/bash

# Public IP address
IP="20.237.234.90"

# Resource Group that contains AKS Node Pool
KUBERNETES_NODE_RG="MC_fabmedical-616268_fabmedical-616268_westus"

# Name to associate with public IP address
DNSNAME="fabmedical-616268-ingress"

# Get the resource-id of the public ip
PUBLICIPID=$(az network public-ip list --resource-group $KUBERNETES_NODE_RG --query "[?ipAddress!=null]|[?contains(ipAddress, '$IP')].[id]" --output tsv)

# Update public ip address with dns name
az network public-ip update --ids $PUBLICIPID --dns-name $DNSNAME