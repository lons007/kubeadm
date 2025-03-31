#Просмотр нод в кластере
kubectl get nodes

#Просмотр под
kubectl get pods
kubectl get pods -A

# Записать автодополнение в .bashrc (или .bash_profile)
echo 'source <(kubectl completion bash)' >> ~/.bashrc

# Посмотреть текущий контекст
kubectl config current-context

#Создать NS
kubectl create namespace dashboar

# Установить namespace по умолчанию для текущего контекста
kubectl config set-context --current --namespace=my-namespace

#Установка dashboard 2.7.0
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
#Запуск dashboard
kubectl port-forward -n kubernetes-dashboard svc/kubernetes-dashboard 8443:443 --address 0.0.0.0
https://localhost:8443