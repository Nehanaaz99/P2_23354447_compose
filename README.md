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

## How to run
Run these on the server, inside this folder:

- `docker compose build` - builds my Jenkins image from the Dockerfile
- `docker compose up -d` - starts Jenkins and DinD in the background
- `docker compose ps` - checks both containers are running
- `docker compose logs -f jenkins` - shows the Jenkins logs (Ctrl+C to stop)
- `docker compose down` - stops the containers (data stays in the volumes)

Jenkins is only bound to 127.0.0.1:8080, so I open it through an SSH tunnel
from my laptop and then browse to http://localhost:8080:
`ssh -i <key>.pem -L 8080:localhost:8080 ubuntu@<server>`

