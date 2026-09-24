# P2_23354447_compose

Docker Compose setup for my ISEC6000 Assessment 2 CI/CD environment.
It runs Jenkins and a separate Docker-in-Docker (DinD) container, so Jenkins
can build and push Docker images for my Node.js app without using the
server's own Docker.

## Contents
- docker-compose.yml - defines the Jenkins and DinD services, volumes and network
- Dockerfile - custom Jenkins image with the Docker CLI and required plugins
- .gitignore - keeps secrets and keys out of Git

## Related repository
- App repo (fork): https://github.com/Nehanaaz99/aws-elastic-beanstalk-express-js-ISEC6000
