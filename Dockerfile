# Original credit: https://github.com/kylemanna/docker-openvpn

# Smallest base image
FROM alpine:latest

LABEL maintainer="Sylvaneau https://github.com/sylvaneau/simply-openvpn-docker"

RUN apk add --no-cache bash openvpn easy-rsa
    # ln -s /usr/share/easy-rsa/easyrsa /usr/local/bin

# Needed by scripts
ENV OPENVPN=/etc/openvpn
ENV EASYRSA=/usr/share/easy-rsa \
    EASYRSA_CRL_DAYS=3650 \
    EASYRSA_PKI=$OPENVPN/pki

VOLUME ["/etc/openvpn"]

# Internally uses port 1194/udp, remap using `docker run -p 443:1194/tcp`
EXPOSE 1194/udp

# CMD ["bin/ovpn_run"]

# RUN chmod a+x /usr/local/bin/*

# Add support for OTP authentication using a PAM module
# ADD ./otp/openvpn /etc/pam.d/