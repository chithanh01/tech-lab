1. Cài đặt Metrics Server
    a. kubectl apply -f https://raw.githubusercontent.com/techiescamp/kubeadm-scripts/main/manifests/metrics-server.yaml
2. apply hpa manifest: 
    a. kubectl apply -f hpa.yaml