FROM nginx:latest

RUN apt-get update && apt-get install -y gcc && \
    apt-get install -y libfcgi-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY nginx/nginx.conf /etc/nginx/nginx.conf

COPY mini_server.c /
RUN gcc -o mini_server mini_server.c -lfcgi

CMD /bin/sh -c "nginx -g 'daemon off;' & /mini_server"