FROM ubuntu:16.04
LABEL description="Docker container for my own fork of zerobin/0bin"
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-all python-pip git
RUN git clone https://github.com/statico/0bin.git /0bin \
  && cd /0bin \
  && echo "PASTE_FILES_ROOT = '/content'" >>zerobin/default_settings.py \
  && python setup.py install
VOLUME /content
EXPOSE 7000
CMD ["zerobin"]
