FROM node:latest as app

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install -g npm@7.20.6

COPY . .

# RUN node seeds/seed.js
# RUN command is used to run the commands while you're building an image


EXPOSE 3000

CMD ["node", "seeds/seed.js"]
CMD ["node", "app.js"]
# CMD is used for any commands that need to be ran inside the container


FROM node:alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install -g npm@7.20.6

COPY --from=app /usr/src/app /usr/src/app

EXPOSE 3000

CMD ["node","app.js"]
