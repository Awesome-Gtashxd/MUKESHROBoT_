FROM python:3.10.4-slim-buster
RUN apt update && apt upgrade -y
RUN apt-get -y install git
RUN apt-get install -y wget python3-pip curl bash neofetch ffmpeg software-properties-common

# Pypi package Repo upgrade
RUN apt-get install -y ffmpeg python3-pip curl
RUN pip3 install --upgrade pip setuptools
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs
ENV PATH="/home/bot/bin:$PATH"

# make directory
RUN mkdir /MukeshRobot/
COPY . /MukeshRobot
WORKDIR /MukeshRobot

# Install requirements
RUN pip3 install -U -r requirements.txt

# Starting Worker
CMD ["python3","-m","MukeshRobot"]
