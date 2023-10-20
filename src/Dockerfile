FROM nginx:latest

COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY mini_server.c /

RUN mkdir -p /var/run/nginx /var/cache/nginx/client_temp && \
    useradd -m -s /bin/bash alex && \
    chown -R alex /var/run/nginx /var/cache/nginx && \
    chmod 755 /var/run/nginx && \
    chmod g-s /usr/bin/wall /usr/bin/chage /usr/bin/expiry /usr/sbin/unix_chkpwd && \
    chmod u-s /usr/bin/passwd /usr/bin/mount /usr/bin/chfn /usr/sbin/unix_chkpwd /usr/bin/gpasswd /usr/bin/newgrp /usr/bin/umount /usr/bin/expiry /usr/bin/su /usr/bin/wall /usr/bin/chage /usr/bin/chsh || true

RUN apt-get update && apt-get install -y gcc libfcgi-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    gcc -o mini_server mini_server.c -lfcgi && \
    chown alex /mini_server && chmod +x /mini_server

USER alex
CMD /bin/sh -c "nginx -g 'daemon off;' & /mini_server"

HEALTHCHECK --interval=30s --timeout=3s CMD su -s /bin/sh -c "curl --fail http://localhost:80" alex || exit 1