FROM node:16-alpine as builder
WORKDIR "/app"
RUN npm install
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
