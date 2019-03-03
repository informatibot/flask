FROM centos/python-36-centos7

########################################################################
## GENERAL BASELINE INSTALL
USER root
RUN mkdir /logs \
    && yum -y update \
    && yum -y install bash mariadb-dev mysql-dev gcc linux-headers uwsgi-python \
    && yum -y install build-base python-dev jpeg-dev zlib-dev unixODBC unixODBC-devel \
    && wget -O dremio-odbc-1.3.22.1055-1.x86_64.rpm https://download.dremio.com/odbc-driver/1.3.22.1055/dremio-odbc-1.3.22.1055-1.x86_64.rpm \
    && rpm -i dremio-odbc-1.3.22.1055-1.x86_64.rpm
    
VOLUME /logs 
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







