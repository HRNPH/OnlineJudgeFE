# Stage 1: Build the Vue.js application
FROM node:8.17.0 as build-stage

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Set build-time variable for backend URL
ARG TARGET

# Set environment variable for backend URL
ENV TARGET=$TARGET

# Copy the rest of the application code
COPY . .

# Build the Vue.js application
RUN npm run build:dll
RUN npm run build

# Stage 2: Run the application
FROM node:8.17.0 as production-stage

# Set working directory
WORKDIR /app

# Copy the entire app, including built files and package.json
COPY --from=build-stage /app .

# Install only production dependencies
RUN npm install --only=production

# Expose the port the app runs on
EXPOSE 5000

# Command to run the application
CMD ["npm", "start"]
