FROM kalilinux/kali-linux-docker:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y \
      dnsutils \
      git \
      nmap \
      python \
      python-pip \
      python3 \
      sslscan \
      whois \
      wpscan \
 && git clone https://github.com/stevenaldinger/Yuki-Chan-The-Auto-Pentest.git \
 && cd Yuki-Chan-The-Auto-Pentest \
 && chmod -R 777 \
      wafninja \
      joomscan \
      install-perl-module.sh \
      part-1.sh \
      part-2.sh \
      yuki.sh \
      Module/WhatWeb/whatweb \
 && pip install -r requirements.txt \
 && ./install-perl-module.sh \
 && cd ./Module/Spaghetti \
 && pip install -r doc/requirements.txt \
 && cd ../../ \
 && cd ./Module/WPSeku \
 && pip install -r requirements.txt \
 && cd ../../ \
 && cd ./Module/a2sv \
 && pip install -r requirements.txt \
 && cd ../../ \
 && cd ./Module/dnsrecon \
 && pip install -r requirements.txt \
 && cd ../../ \
 && pip install \
     argparse \
     logging \
     mechanize \
 && apt-get remove -y \
      git \
      python-pip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /Yuki-Chan-The-Auto-Pentest

CMD ["./yuki.sh"]
