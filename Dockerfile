FROM nginx:latest

# Remove default configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy NGINX configuration
COPY default.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/

# Create SSL directory
RUN mkdir -p /etc/nginx/ssl

# Copy SSL certificates
COPY /etc/letsencrypt/live/rohitptech.online/fullchain.pem /etc/nginx/ssl/fullchain.pem
COPY /etc/letsencrypt/live/rohitptech.online/privkey.pem /etc/nginx/ssl/privkey.pem

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
