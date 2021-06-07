FROM library/centos:centos8

RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial && \
  dnf install -y \
    epel-release \
    git \
    python39-pip && \
  rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8 && \
  dnf install -y supervisor && \
  pip3 install \
    bqplot \
    ipympl \
    ipyvolume \
    jupyter \
    matplotlib \
    numpy \
    scipy \
    voila && \
  useradd jovyan -u 1000
COPY supervisord.conf /etc/

USER jovyan
WORKDIR /home/jovyan

RUN git clone https://github.com/voila-dashboards/voila
WORKDIR /home/jovyan/voila
EXPOSE 8888 8866
CMD supervisord -c /etc/supervisord.conf -n
