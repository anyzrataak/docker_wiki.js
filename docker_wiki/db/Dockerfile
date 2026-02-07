FROM postgres:15-alpine
RUN apk add --no-cache procps grep
COPY check-status.sh /usr/local/bin/check-status.sh
RUN chmod +x /usr/local/bin/check-status.sh