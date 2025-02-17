
FROM Alpine as base
#set working dir
WORKDIR /app
#copy all static file
COPY . .
#server with ngnix
FROM nginx:alpine as runner
#remove the default nginx config
RUN rm -rf /etc/nginx/conf.d/default.conf
#copy custome nginx conf
COPY nginx.conf /etc/nginx/conf.d/default.conf
#copy static file
COPY --from=base /app/static /usr/share/nginx/html
#expose port 80
EXPOSE 80
#START
CMD ["nginx","-g","demon off;"]
