FROM node:alpine as builder

WORKDIR /app

COPY ./package.json ./package.json

RUN npm install

COPY . .

RUN npm run build

# all the stuff we care about /app/build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

