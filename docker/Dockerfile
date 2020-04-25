FROM python:3.8
MAINTAINER @theDevilsVoice
ADD . /app
WORKDIR /app

RUN make python

# uncomment next line to run app locally on port 5000
CMD ["python3", "mirr/mirr.py"]
