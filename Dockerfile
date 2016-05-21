FROM csmith/letsencrypt-generic:latest
MAINTAINER Chris Smith <chris87@gmail.com> 

RUN apt-get update \
 && apt-get install -y \
      inotify-tools \
      python2.7 \
      python-pip

RUN pip install \
      dns-lexicon==1.1.4

ADD https://raw.githubusercontent.com/AnalogJ/lexicon/v1.1.4/examples/letsencrypt.default.sh /dns/hook
RUN chmod +x /dns/hook

