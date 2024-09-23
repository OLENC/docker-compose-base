FROM ghcr.io/linuxserver/openvpn-as

# Add NET_ADMIN capability
# RUN setcap CAP_NET_ADMIN+eip /usr/sbin/openvpn

# Set environment variables
ENV PUID=1000
ENV PGID=1000
ENV TZ=Europe/London
ENV INTERFACE=eth0

# Mount configuration volume
VOLUME /config

# Expose ports
EXPOSE 943 9443 1194/udp

# Start OpenVPN Access Server
CMD ["/init"]
