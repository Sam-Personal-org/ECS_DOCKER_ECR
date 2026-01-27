FROM node:18
WORKDIR /app
COPY server.js .
COPY index.html .   # only if using static file
RUN npm install express
CMD ["node", "server.js"]

