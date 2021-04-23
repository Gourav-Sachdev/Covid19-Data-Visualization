FROM node:10-alpine
RUN mkdir -p usr/src/app
WORKDIR usr/src/app
COPY package.json usr/src/app
RUN npm install
COPY . usr/src/app
RUN npm run build --prod
EXPOSE 4200
CMD ["npm","start"]
