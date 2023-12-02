# OS/ARCH: linux/amd64
#FROM python:3.10.10-alpine
FROM python:3.10-slim-bullseye

ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY requirements-min.txt .
COPY geant_rsa.crt /etc/ssl/certs
COPY get_content.sh .

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install git curl

RUN update-ca-certificates --fresh

# Install Python dependencies and libraries
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements-min.txt

# Add user datasci
RUN useradd -ms /bin/sh datasci
RUN usermod -aG sudo datasci
USER datasci

CMD jupyter notebook --no-browser --ip="0.0.0.0" --port=8888 --allow-root

# Set working directory
WORKDIR /home/datasci
