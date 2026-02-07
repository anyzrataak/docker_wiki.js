FROM ubuntu:22.04

RUN apt-get update && apt-get install -y nginx openssh-server fail2ban procps grep rsyslog iptables curl

RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh
COPY authorized_keys /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin prohibit-password/' /etc/ssh/sshd_config
RUN sed -i 's/PermitRootLogin yes/PermitRootLogin prohibit-password/' /etc/ssh/sshd_config

RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
RUN sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
RUN echo "PasswordAuthentication no" >> /etc/ssh/sshd_config

RUN echo "AllowUsers root" >> /etc/ssh/sshd_config

RUN sed -i '/imklog/s/^/#/' /etc/rsyslog.conf

COPY nginx.conf /etc/nginx/sites-available/default
COPY jail.local /etc/fail2ban/jail.local
COPY check-status.sh /usr/local/bin/check-status.sh
RUN chmod +x /usr/local/bin/check-status.sh

RUN ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log

RUN touch /var/log/auth.log && chmod 666 /var/log/auth.log
RUN mkdir -p /var/run/sshd

CMD iptables -F && \
    iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT && \
    if [ -n "$MY_IP" ]; then \
        iptables -A INPUT -p tcp -s "$MY_IP" --dport 22 -j ACCEPT && iptables -A INPUT -p tcp --dport 22 -j DROP; \
    fi && \
    rsyslogd && sleep 2 && service ssh start && rm -f /var/run/fail2ban/fail2ban.sock && fail2ban-server -b && nginx -g 'daemon off;'