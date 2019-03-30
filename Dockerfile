FROM python:3.6
ADD . /app
WORKDIR /app
#USER mzbat:mzbat

RUN pip3 install --upgrade pip
RUN pip3 install -rrequirements.txt
#CMD ["python", "mirr"]
