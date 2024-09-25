FROM ubuntu:20.04

# Accept username and password as build arguments
ARG USER_NAME="turbo"
ARG HOST_IP="192.168.10.254"
ARG USER_PASSWORD="admin"
ARG REMOTE_FILE_PATH="/home/turbo/sftpDefault"

# Set environment variables based on build arguments
ENV USER_NAME=${USER_NAME}
ENV HOST_IP=${HOST_IP}
ENV USER_PASSWORD=${USER_PASSWORD}
ENV LOCAL_FILE_PATH="./test.txt"
ENV REMOTE_FILE_PATH=${REMOTE_FILE_PATH}

# Set working directory
WORKDIR /app

# Copy local files to the container
COPY . .

# Install necessary packages (openssh-client for SFTP and sshpass for automated password entry)
# Combine the commands, set non-interactive mode, and clean up cache
RUN apt update && apt install -y openssh-client sshpass git

# Optional: Define an entry point or command for the container (if necessary)
# CMD ["/bin/bash"]
