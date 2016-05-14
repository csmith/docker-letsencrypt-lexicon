FROM python:2.7
MAINTAINER Chris Smith <chris87@gmail.com> 

RUN pip install \
      dns-lexicon==1.1.4

RUN apt-get update \
 && apt-get install -y inotify-tools

ADD https://raw.githubusercontent.com/lukas2511/letsencrypt.sh/v0.1.0/letsencrypt.sh /letsencrypt.sh
ADD https://raw.githubusercontent.com/AnalogJ/lexicon/v1.1.4/examples/letsencrypt.default.sh /lexicon.sh
COPY run.sh config.sh /
RUN chmod +x /run.sh /letsencrypt.sh /lexicon.sh

VOLUME ["/letsencrypt/"]

ENTRYPOINT ["/bin/bash"]
CMD ["/run.sh"]
