FROM node:16.14.2-buster-slim
ENV LANG ja_JP.utf8
RUN apt -y update && apt -y install git
RUN npm install -g gatsby-cli

ENTRYPOINT ["docker-entrypoint.sh"]

CMD [ "node" ]
