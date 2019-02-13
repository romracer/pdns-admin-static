FROM us.gcr.io/crypto-lexicon-157214/pdns-admin-base:master
MAINTAINER "Peter Schiffer" <peter@rfv.sk>

RUN dnf -y --setopt=install_weak_deps=False install \
    nginx \
  && dnf clean all

COPY pdns-nginx.conf /etc/nginx/nginx.conf

CMD [ "/usr/sbin/nginx", "-g", "daemon off;" ]
