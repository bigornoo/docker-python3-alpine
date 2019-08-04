FROM  python:alpine
COPY requirements.txt /
#RUN python3 -m pip install --upgrade pip
#RUN apk add --update --no-cache g++ gcc libxslt-dev && pip3 install -r /requirements.txt && pip install $(pip list --outdated --format=columns |tail -n +3|cut -d" " -f1) --upgrade

RUN apk add --update --no-cache g++ gcc libxslt-dev && pip3 install -r /requirements.txt && pip list --outdated --format=columns  && test $? -ne 0 && pip install $(pip list --outdated --format=columns |tail -n +3|cut -d" " -f1) --upgrade || exit 0