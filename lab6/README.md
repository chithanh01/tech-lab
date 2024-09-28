1. tạo docker swarm
    a. docker swarm init --advertise-addr <MANAGER-IP>
2. join worker node vào cluster
    a. docker swarm join --token <WORKER-TOKEN> <MANAGER-IP>:2377
3. chạy lệnh tạo docker stack
    a. docker stack deploy -c docker-compose.yml my-stack