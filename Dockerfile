FROM ubuntu:18.04

WORKDIR /
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y postgresql-10 postgresql-server-dev-10 git build-essential

RUN git clone https://github.com/pgpartman/pg_partman.git && cd pg_partman && make install

USER postgres

RUN mkdir /var/run/postgresql/10-main.pg_stat_tmp

CMD ["/usr/lib/postgresql/10/bin/postgres", "-D", "/var/lib/postgresql/10/main", "-c", "config_file=/etc/postgresql/10/main/postgresql.conf"]
