FROM node:8.11.3

WORKDIR /usr/src/smart-brain-api

COPY ./ ./

RUN yarn

CMD ["/bin/bash"]