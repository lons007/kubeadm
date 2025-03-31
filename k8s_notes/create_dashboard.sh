# Деплоимм dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml

# Создание учётной записи (ServiceAccount)
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard
EOF

# Привязка роли (ClusterRoleBinding)
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kubernetes-dashboard
EOF

# Получение токена для входа, необходимо скопировать и вставить в браузере
kubectl -n kubernetes-dashboard create token admin-user

#Проброс порта
kubectl port-forward -n kubernetes-dashboard svc/kubernetes-dashboard 8443:443 --address 0.0.0.0
# В браузере заходим:
https://localhost:8443

