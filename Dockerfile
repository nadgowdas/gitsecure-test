FROM shri4u/myapp-base:0.1
RUN apt-get update --fix-missing && apt-get install -y --fix-missing \
    pkg-config libreadline-dev libxml2-dev

WORKDIR /app
COPY requirements.txt /app
RUN pip install --no-cache-dir -r requirements.txt
#GITSECURE REMEDIATION 
RUN  pip install colander >= 1.7.0  validators >= 0.12.6 \ 
     feedgen >=   


WORKDIR /go/src/github.com/simple-app/
COPY . .
ENTRYPOINT ["/app.py"]
