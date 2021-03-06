FROM  python:alpine
COPY requirements.txt /tmp
RUN apk add --update --no-cache g++ gcc libxslt-dev git && apk upgrade && pip3 install -r /tmp/requirements.txt --upgrade && pip list --outdated --format=columns  && test $? -ne 0 && pip install $(pip list --outdated --format=columns |tail -n +3|cut -d" " -f1) --upgrade || exit 0