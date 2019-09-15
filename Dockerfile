FROM python:3.6
MAINTAINER @theDevilsVoice
ADD . /app
WORKDIR /app
#USER mzbat:mzbat

RUN pip3 install --upgrade pip; \
pip3 install -rrequirements.txt; \
pip3 install -rtests/requirements-test.txt

# uncomment next line to run app locally
CMD ["python3", "mirr/mirr.py"]
