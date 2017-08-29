# Jenkins
## Start Jenkins in Docker container
Prerequisites:
- Docker

Steps:
```
docker pull jenkins
mkdir jenkins
docker run -d -p 8080:8080 -p 50000:50000 -v ~/jenkins:/var/jenkins_home --name jenkins jenkins
```
Obtain secret initial password
```
cat jenkins/secrets/initialAdminPassword
```
Open following URL: http://localhost:8080/ and provide secret password. Follow setup guidelines.
