FROM nginx:1.13-alpine
MAINTAINER "Peter Schiffer" <pschiffe@redhat.com>

RUN apk add --no-cache curl

RUN mkdir -p /opt/powerdns-admin \
  && curl -sSL https://github.com/thomasDOTde/PowerDNS-Admin/archive/master.tar.gz \
     | tar -xzC /opt/powerdns-admin --strip 1 \
  && find /opt/powerdns-admin -path /opt/powerdns-admin/app/static -prune -o -type f -exec rm -f {} + \
  && chown -R root: /opt/powerdns-admin \
  && apk del --purge curl

COPY pdns-nginx.conf /etc/nginx/conf.d/default.conf