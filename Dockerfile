FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install -g npm@7.18.1
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=0 /app/build /usr/share/nginx/html