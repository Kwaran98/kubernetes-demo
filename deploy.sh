# this means we want to run this script with bash and we want to exit it automatically if it fails
set -e

#Here we define the NAME of our API:
NAME="kubernetes-api"
USERNAME="kwaran"
IMAGE="$USERNAME/$NAME:latest"

# While we are doing a script we would like to do some console logs and in bash here we do it with echo:
echo "Building Docker image ..."
docker build -t $IMAGE .

echo "Pushing image to Docker Hub"
docker push $IMAGE

echo "Applying Kubernetes manifests.."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "Getting pods..."
kubectl get pods

echo "Getting services..."
kubectl get services

echo "Fetching the main service"
kubectl get services $NAME-service