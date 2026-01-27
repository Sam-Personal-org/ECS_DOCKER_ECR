FROM node:18
WORKDIR /app

COPY server.js .
COPY index.html .

RUN npm install express

EXPOSE 8080
CMD ["node", "server.js"]

