# Use official Nginx image
FROM nginx:alpine

# Set working directory inside container
WORKDIR /usr/share/nginx/html

# Copy your updated index.html into the default Nginx web root
COPY index.html .

# Expose port 80
EXPOSE 80

# Nginx runs automatically via the base image's default CMD

