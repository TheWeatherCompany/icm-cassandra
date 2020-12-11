ARG CASSANDRA_VERSION=3.11.9
FROM cassandra:${CASSANDRA_VERSION}

# avoids overwriting .bashrc
COPY .bash_aliases /root/

# TODO: remove following workaround (our current cipher version of ca.crt is deprecated in latest openssl version)
COPY openssl_fix.sh /
RUN bash openssl_fix.sh && rm openssl_fix.sh

ENV JMX_EXPORTER_VERSION=0.14.0
RUN set -eux; \
  # wget_jar org name version dest_dir
  wget_jar() { \
    curl -sSf https://repo1.maven.org/maven2/$1/$2/$3/$2-$3.jar --create-dirs -o $4/$2.jar; \
  }; \
  wget_jar mx4j mx4j-tools 3.0.1 /mx4j; \
  wget_jar io/prometheus/jmx jmx_prometheus_javaagent ${JMX_EXPORTER_VERSION} /prometheus

RUN apt-get update && apt-get install -y --no-install-recommends \
  dnsutils \
  jq \
  net-tools \
  s3cmd \
  httpie \
  && rm -rf /var/lib/apt/lists/*
