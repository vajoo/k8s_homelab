docker build -t k8s-demo-api .   
docker build -t k8s-demo-frontend . 
docker run -p 8000:8000 k8s-demo-api
docker run -p 8080:80 k8s-demo-frontend

docker tag k8s-demo-api vajo/k8s-demo-api:latest
docker tag k8s-demo-frontend vajo/k8s-demo-frontend:latest

docker push vajo/k8s-demo-api:latest
docker push vajo/k8s-demo-frontend:latest

docker pull vajo/k8s-demo-api:latest
docker pull vajo/k8s-demo-frontend:latest

kubectl apply -f https://raw.githubusercontent.com/vajoo/k8s_homelab/main/k8s/base/cluster_reader.yaml
kubectl apply -f https://raw.githubusercontent.com/vajoo/k8s_homelab/main/k8s/base/cluster_reader_binding.yaml

kubectl apply -f https://raw.githubusercontent.com/vajoo/k8s_homelab/main/k8s/demo-project/api.yaml
kubectl apply -f https://raw.githubusercontent.com/vajoo/k8s_homelab/main/k8s/demo-project/api_service.yaml
kubectl apply -f https://raw.githubusercontent.com/vajoo/k8s_homelab/main/k8s/demo-project/frontend.yaml
kubectl apply -f https://raw.githubusercontent.com/vajoo/k8s_homelab/main/k8s/demo-project/frontend_servce.yaml