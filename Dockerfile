FROM ubuntu:20.04
MAINTAINER Gregory Concepcion (gconcepcion@gmail.com)

RUN apt update \
  && apt-get -y install zip rsync wget

RUN mkdir /pacbio-root && cd /pacbio-root

ARG SMRTROOT="/opt/smrtlink"

RUN wget https://downloads.pacbcloud.com/public/software/installers/smrtlink_10.1.0.119588.zip \
  && unzip smrtlink_10.1.0.119588.zip \
  && ./smrtlink_10.1.0.119588.run --rootdir $SMRTROOT --smrttools-only \
  && rm smrtlink_10.1.0.119588*

ENV PATH $SMRTROOT/smrtcmds/developer/bin:$SMRTROOT/smrtcmds/bin:$SMRTROOT/admin/bin:$PATH

CMD ["/bin/bash"]

