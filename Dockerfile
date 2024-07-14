# pull official base image
FROM python:3.11.2-slim-buster

# set working directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Update the package list and install default-mysql-client, gcc, and necessary build dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends default-mysql-client gcc python3-dev && \
    rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# add app
COPY . .