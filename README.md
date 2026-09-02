# Flask Docker Application

A simple Flask web application containerized using Docker and served with Gunicorn.

This project demonstrates the basic workflow of containerizing a Python web application using Docker.

## Technologies Used

- Python 3.13
- Flask
- Gunicorn
- Docker
- Git
- GitHub
- WSL / Ubuntu

## Project Structure

```text
flask-docker-app/
├── app.py
├── requirements.txt
├── Dockerfile
├── .dockerignore
└── README.md
```

## Application Endpoints

### Home

```text
http://localhost:5000
```

Returns:

```text
Hello from our Flask application running in Docker!
```

### Health Check

```text
http://localhost:5000/health
```

Returns:

```json
{"status":"healthy"}
```

## Build the Docker Image

```bash
docker build -t flask-docker-app .
```

## Run the Docker Container

```bash
docker run -d -p 5000:5000 --name flask-container flask-docker-app
```

## Check Running Containers

```bash
docker ps
```

## Check Docker Images

```bash
docker images
```

## Stop the Container

```bash
docker stop flask-container
```

## Remove the Container

```bash
docker rm flask-container
```

## Docker Features Used

- Python slim base image
- Dependency installation using requirements.txt
- Gunicorn application server
- Non-root container user
- Docker HEALTHCHECK
- Port mapping
- Docker build caching
- .dockerignore

## What I Learned

This project demonstrates:

- Creating a Flask web application
- Writing a Dockerfile
- Building a Docker image
- Running a Docker container
- Docker port mapping
- Container health checks
- Running containers as a non-root user
- Managing Docker through CLI
- Version controlling the project with Git
- Publishing source code to GitHub

## Future Improvements

- Push the Docker image to Docker Hub
- Add a CI/CD pipeline
- Deploy the application to Kubernetes
- Add automated testing
- Add monitoring and logging