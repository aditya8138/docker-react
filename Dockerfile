#Build Step

FROM node:alpine

WORKDIR '/app'

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build


#Run Step
FROM nginx
# port mapping for EBS
EXPOSE 80
# copy build folder to nginx
COPY --from=0 /app/build /usr/share/nginx/html
#nginx container will start nginx itself we don't need to give a command for it to start
