FROM ubuntu:latest

# Accept username and password as build arguments
ARG USER_NAME="turbo"
ARG HOST_IP="192.168.10.254"
ARG USER_PASSWORD="admin"
ARG REMOTE_FILE_PATH="/home/turbo/sftpDefault"

ENV USER_NAME=${USER_NAME}
ENV HOST_IP=${HOST_IP}
ENV USER_PASSWORD=${USER_PASSWORD}
ENV LOCAL_FILE_PATH="./test.txt"
ENV REMOTE_FILE_PATH=${REMOTE_FILE_PATH}

WORKDIR /app

COPY . .

# Install necessary packages (openssh-client for SFTP and sshpass for automated password entry)
RUN apt update && apt install -y openssh-client sshpass && apt install git

# Create a script for running the SFTP command
# RUN echo '#!/bin/bash\n' > /app/run-sftp.sh && \
#     echo 'sshpass -p "$USER_PASSWORD" sftp -oStrictHostKeyChecking=no "$USER_NAME@$HOST_IP" << EOF\nput $LOCAL_FILE_PATH $REMOTE_FILE_PATH\nEOF' >> /app/run-sftp.sh && \
#     chmod +x /app/run-sftp.sh

# # Default command to run the SFTP script
# CMD ["/bin/bash", "/app/run-sftp.sh"]