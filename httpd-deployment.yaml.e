apiVersion: apps/v1
kind: Deployment
metadata:
  name: httpd-deployment
spec:
  replicas: 10
  selector:
    matchLabels:
      app: httpd
  template:
    metadata:
      labels:
        app: httpd
    spec:
      containers:
      - name: httpd
        image: httpd
        ports:
        - containerPort: 80
        resources:
          requests:
            cpu: 0.1m
            memory: 1Mi
          limits:
            cpu: 10m
            memory: 10Mi
---
apiVersion: v1
kind: Service
metadata:
  name: httpd-service
spec:
  externalTrafficPolicy: Local
  selector:
    app: httpd
  ports:
  - protocol: TCP
    port: 80
    targetPort: 80
  type: NodePort












