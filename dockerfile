#Stage1

FROM node:18-alpine AS build

WORKDIR /opt

COPY package*json /opt

RUN npm install

COPY . /opt/

RUN npm run build

#stage:2

FROM node:18-alpine

WORKDIR /opt

COPY --from=build /opt /opt

EXPOSE 3000

CMD ["npm" , "start"]
