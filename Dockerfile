# Use Node base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install --production

# Copy only the build artifacts (dist folder)
COPY dist ./dist

# Install a lightweight static file server
RUN npm install -g serve

# Expose port 3000
EXPOSE 3000

# Run the dist folder with serve
CMD ["serve", "-s", "dist", "-l", "3000"]

