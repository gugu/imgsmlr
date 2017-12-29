FROM postgres:10
RUN apt-get update && apt-get install --no-install-recommends -y wget unzip make gcc postgresql-server-dev-10 libgd-dev ca-certificates libc6-dev && \
    wget https://github.com/postgrespro/imgsmlr/archive/master.zip -O /opt/imgsmlr.zip && \
    cd /opt && unzip imgsmlr.zip && \
    cd /opt/imgsmlr-master && make USE_PGXS=1 && make install USE_PGXS=1 && \
    apt-get remove -y wget unzip make gcc postgresql-server-dev-10 && \
rm -rf /var/lib/apt/lists/*
