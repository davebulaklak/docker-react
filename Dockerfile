# FROM node:alpine as builder

# WORKDIR '/usr/app'

# COPY ./package.json ./

# RUN npm install

# COPY ./ ./

# RUN npm run build

# FROM nginx 

# COPY --from=builder /usr/app/build /usr/share/nginx/html

FROM node:alpine
WORKDIR '/usr/app'
COPY package.json .
COPY . .
RUN npm install

RUN npm run build

FROM nginx
COPY --from=0 usr/app/build /usr/share/nginx/html