### STAGE 1: Build###
# FROM node:12.7-alpine AS build
# #WORKDIR /usr/src/app
# #COPY package.json ./
# RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
# WORKDIR /home/node/app
# COPY package*.json ./
# USER node
# COPY --chown=node:node . .
# RUN npm install
# #RUN ng build --prod
# RUN npm run build --prod
# #RUN node_modules/.bin/ng build --prod

# ### STAGE 2: Run ###
# FROM nginx:1.17.1-alpine
# COPY nginx.conf /etc/nginx/nginx.conf
# COPY --from=build /usr/src/app/dist/Covid19-Data-Visualization /usr/share/nginx/html 

### STAGE 1: Build ###
FROM node:12.7-alpine AS build
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

### STAGE 2: Run ###
FROM nginx:1.17.1-alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /usr/src/app/dist/covid19 /usr/share/nginx/html

