FROM shri4u/myapp-base:0.1
RUN apt-get update --fix-missing && apt-get install -y --fix-missing \
    pkg-config libreadline-dev libxml2-dev libxml-ppl
   

WORKDIR /app
COPY requirements.txt /app
RUN pip install--no-cache-dir -r requirements.txt
#GITSECURE REMEDIATION 
RUN pip install validators >= 0.12.6 feedgen >= 0.9.0 colander >=   


WORKDIR /go/src/github.com/simple-app/
COPY . .
ENTRYPOINT ["/app.py"]
