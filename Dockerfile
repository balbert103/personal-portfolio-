# Use the official Nginx image as the base
FROM nginx:latest

# Copy the custom HTML file to the Nginx web root
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 to allow HTTP traffic
EXPOSE 80

# Start the Nginx server
CMD ["nginx", "-g", "daemon off;"]
