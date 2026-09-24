# Start from the official Jenkins LTS image (Java 21)
FROM jenkins/jenkins:lts-jdk21

# Switch to root ONLY to install software
USER root

# Install the Docker CLI (client only) from Docker's official, signed repository
RUN apt-get update && apt-get install -y ca-certificates curl && \
    install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc && \
    chmod a+r /etc/apt/keyrings/docker.asc && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $(. /etc/os-release && echo $VERSION_CODENAME) stable" > /etc/apt/sources.list.d/docker.list && \
    apt-get update && apt-get install -y docker-ce-cli && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Switch back to the normal, non-root jenkins user for running Jenkins
USER jenkins

# Pre-install the plugins the pipeline needs
RUN jenkins-plugin-cli --plugins "docker-workflow json-path-api audit-trail warnings-ng"
