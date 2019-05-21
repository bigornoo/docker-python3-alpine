FROM  python:alpine
COPY requirements.txt /
RUN apk add --update --no-cache g++ gcc libxslt-dev && pip3 install -r /requirements.txt && pip install $(pip list --outdated --format=columns |tail -n +3|cut -d" " -f1) --upgrade

