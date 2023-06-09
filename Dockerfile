FROM node:alpine

WORKDIR /app

RUN yarn init -y

COPY . .

CMD [ "yarn", "add", "discord.js" ]
