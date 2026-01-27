FROM node:18
WORKDIR /app

COPY nodefiles/server.js .
COPY nodefiles/index.html .

RUN npm install express

EXPOSE 8080
CMD ["node", "server.js"]

