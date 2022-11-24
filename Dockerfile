###
#1. VersionNodeJs
###

FROM node:10.16.0
ARG NODE_ENV="Environment"

###
#2. Author
###

LABEL maintainer="santi.personalmail@gmail.com"
LABEL vendor="SanTi"
LABEL version="1.0"

###
#3. DateTime
###

ENV TZ=Asia/Yangon
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
apt-get install tzdata && \
dpkg-reconfigure --frontend noninteractive tzdata
RUN date

###
#4. Application
###

EXPOSE #your port
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json /usr/src/app/package.json
RUN npm install --production
COPY . /usr/src/app
RUN echo "Environment is ${NODE_ENV}"
ENV NODE_ENV ${NODE_ENV}
ENTRYPOINT ["node", "yuor node js"]
