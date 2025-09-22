# Stage 1: Build the frontend
FROM node:20-alpine AS build
WORKDIR /app

# Copy dependencies first (better caching)
COPY package*.json ./
COPY vite.config.* ./
COPY . .

# Install and build
RUN npm install
RUN npm run build

# Stage 2: Serve with Nginx
FROM nginx:1.27-alpine
COPY --from=build /app/dist /usr/share/nginx/html

# Optional: overwrite default nginx config for SPA routing
# COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
