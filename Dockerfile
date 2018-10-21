FROM alpine:3.8

LABEL maintainer vongola12324@coder.tw

# Install packages
RUN apk add --no-cache \
    bash \
    ca-certificates \
    curl \
    openssh
    
SHELL ["/bin/bash", "-c"]

# Copy sshd_config
COPY files/sshd_config /etc/sshd_config

# SET root password as toor
RUN echo "root:toor" | chpasswd

# Expose ssh default port
EXPOSE 22

# Set Entrypoint
# ENTRYPOINT ["files/entrypoint.sh"]

# Run sshd as default
CMD ["/usr/sbin/sshd", "-D"]
