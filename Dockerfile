FROM python:3.6
MAINTAINER @theDevilsVoice
ADD . /app
WORKDIR /app
#USER mzbat:mzbat

#RUN pip3 install --upgrade pip
RUN pip3 install -rrequirements.txt
# uncomment next line to run app locally
CMD ["python3", "mirr/mirr.py"]
