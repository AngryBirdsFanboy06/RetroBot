FROM node:lts-alpine
ENV NODE_ENV=production

# Create Directory for the Container
WORKDIR /usr/src/app

# Copy package.json, package-lock.json, npm-shrinkwrap.json to the container
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]

# Install all packages
RUN npm install --production --silent && mv node_modules ../
COPY . .

# Give file permissions
#RUN chown -R node /usr/src/app

# Set User
#USER node

#TypeScript
RUN npm run tsc

# Start
CMD ["npm", "start"]
