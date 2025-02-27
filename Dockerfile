# Use an official Node.js image as the base
FROM node:latest

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package.json ./

# Install dependencies
RUN npm install -g typescript && npm install

# Copy the rest of the application
COPY . .

# Compile TypeScript
RUN tsc

# Expose a port (if running a server)
EXPOSE 3000

# Default command (modify as needed)
CMD ["node", "dist/index.js"]
