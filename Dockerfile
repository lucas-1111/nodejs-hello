FROM ubuntu:24.04

ENV NODE_VERSION=22.x

# Update package lists and install necessary packages
RUN apt-get update && \
    apt-get install -y curl gnupg unzip wget software-properties-common && \
    apt-get install -y git iputils-ping traceroute && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION} -o nodesource_setup.sh && \
    bash nodesource_setup.sh && \
    apt-get install -y nodejs && \
    rm nodesource_setup.sh && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json files to install dependencies
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copy application source code from the src directory
COPY src ./src

# Expose the port your app runs on (change as needed)
EXPOSE 3000

# Command to run your application
CMD ["npm", "start"]

