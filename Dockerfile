FROM node as APP

WORKDIR /usr/src/app

COPY package*.json ./

# run command is used to run the commands while you are building an image

RUN npm install express

RUN npm install -g npm@7.20.6

COPY . .


FROM node:alpine

COPY --from=app /usr/src/app /usr/src/app

WORKDIR /usr/src/app

EXPOSE 3000

#CMD ["node", "seeds/seed.js"]

CMD ["node","app.js"]