FROM python:3-buster

RUN pip install --upgrade pip portray==1.3.1 poetry pipenv

RUN apt-get update
RUN apt-get install build-essential

RUN mkdir /in
RUN mkdir /out
RUN mkdir /code

WORKDIR /code

COPY docker-entrypoint.sh /code/

ENTRYPOINT ["/bin/sh", "/code/docker-entrypoint.sh"]