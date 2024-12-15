docker login
docker-compose build
docker build -t mhzmark/nodejs-hello:latest .
docker push mhzmark/nodejs-hello:latest

