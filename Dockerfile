FROM alpine:3.8

LABEL maintainer vongola12324@coder.tw

# Install packages
RUN apk add --no-cache \
    bash \
    ca-certificates \
    curl \
    openssh \
    openssh-sftp-server
    
SHELL ["/bin/bash", "-c"]

# Remove exist keys
RUN rm -rf /etc/ssh/ssh_host_*

# Regenerate SSH Host Keys
RUN ssh-keygen -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -N "" -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key
RUN ssh-keygen -N "" -t ed25519 -f /etc/ssh/ssh_host_ed25519_key

# Copy sshd_config
COPY files/sshd_config /etc/ssh/sshd_config

# SET root password as toor
RUN echo "root:toor" | chpasswd

# Expose ssh default port
EXPOSE 22

# Set Entrypoint
# ENTRYPOINT ["files/entrypoint.sh"]

# Run sshd as default
CMD ["/usr/sbin/sshd", "-D"]
