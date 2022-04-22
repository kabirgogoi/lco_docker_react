FROM node:alpine as teamalpha
WORKDIR /var/app
COPY package.json .
RUN npm install
COPY . .
CMD ["npm", "run", "build"]


FROM nginx:1.21
EXPOSE 80
# Take the build folder generated by CRA and copy it to nginx
COPY --from=teamalpha /var/app/build /usr/share/nginx/html