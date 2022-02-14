FROM ubuntu

RUN apt update

RUN apt -y install curl

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.0/bin/linux/amd64/kubectl

RUN chmod +x ./kubectl

RUN mv ./kubectl /usr/local/bin/kubectl

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x ./entrypoint.sh

RUN ls -larth

ENTRYPOINT ["/entrypoint.sh"] 
