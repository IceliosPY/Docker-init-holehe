FROM python:3.11-slim-bullseye

COPY . /opt/holehe
WORKDIR /opt/holehe

RUN apt-get update && apt-get install -y gcc libffi-dev \
    && python3 -m pip install --upgrade pip setuptools wheel \
    && python3 -m pip install requests

RUN python3 setup.py install

ENTRYPOINT ["holehe"]
CMD ["--help"]
