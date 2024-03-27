# ! single stage
FROM node

RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh
RUN apt-get upgrade -y
RUN apt-get install -y nodejs

WORKDIR /app

COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm install

COPY . .

ENTRYPOINT [ "node","main.js" ]

# !Multi stage ( here we have build and run stage)
# FROM node as build

# RUN apt-get update
# RUN apt-get install -y curl
# RUN curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh
# RUN apt-get upgrade -y
# RUN apt-get install -y nodejs

# WORKDIR /app

# COPY package.json package.json
# COPY package-lock.json package-lock.json

# RUN npm install

# COPY . .

# RUN tsc -p 


# FROM node as runner
# WORKDIR /app
# COPY --from=build /app .
# ENTRYPOINT [ "node","main.js" ]