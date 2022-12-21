FROM node:16-alpine as builder
WORKDIR '/app'
#RUN chown -Rh node:node .
#USER node
#copy --chown=node:node package.json .
copy package.json .
RUN npm install
#COPY --chown=node:node . .
COPY . .
#CMD ["npm", "run", "start"]
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

