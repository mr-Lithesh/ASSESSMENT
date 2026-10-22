# Use a lightweight Nginx image to serve static web pages
FROM nginx:alpine

# Copy the portal source file to Nginx's public delivery folder
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 to map access outside the container
EXPOSE 80
