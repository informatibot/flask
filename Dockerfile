FROM python:3-alpine3.9

########################################################################
## LOGGING

RUN mkdir /logs 
VOLUME /logs 

########################################################################
## GENERAL BASELINE INSTALL

RUN apk update \
    && apk add bash mariadb-dev mysql-dev gcc linux-headers musl-dev uwsgi-python \
    && apk add build-base python-dev jpeg-dev zlib-dev unixodbc unixodbc-dev
    
## END BASELINE

########################################################################
## BEGIN PYTHON INSTALLS

RUN pip install --upgrade pip \
    && pip install numpy \
    && pip install pandas \
    && pip install flask \
    && pip install pyodbc \
    && pip install pyyaml

## END PYTHON INSTALLS







