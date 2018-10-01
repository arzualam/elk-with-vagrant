#!/bin/bash

# Create kibana admin user

sudo htpasswd -cb /etc/nginx/htpasswd.users arzu  test@123

# Remove the lines from the  Nginx file

sudo echo -n "`sed '38,57d' /etc/nginx/nginx.conf`" >/etc/nginx/nginx.conf


# Create the kibana.conf file

echo 'server {
    listen 80;

    server_name example.com;

    auth_basic "Restricted Access";
    auth_basic_user_file /etc/nginx/htpasswd.users;

    location / {
        proxy_pass http://localhost:5601;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;        
    }
}
'| sudo tee /etc/nginx/conf.d/kibana.conf

