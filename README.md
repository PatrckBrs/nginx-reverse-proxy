# nginx-reverse-proxy
Nginx Reverse Proxy

Run Reverse Proxy like this :

docker run -p 80:80 -p 443:443 -v ${PWD}/sites:/etc/nginx/sites-available -d nginx-reverse-proxy

Push your configuration website file into ${PWD}/sites

Examples :

upstream ghost {
        server 192.168.0.1:2368;
        server 192.168.0.2:2368 backup;
        server 192.168.0.3:2368 backup;
}

server {
        listen   80;
        server_name     www.myghostblog.com;
        access_log /var/log/nginx/www.myghostblog.log;
        location / {
                proxy_pass http://ghost;
   }
        error_page 404 /custom_404.html;
        location = /custom_404.html {
                root /usr/share/nginx/html;
                internal;
        }

        error_page 500 502 503 504 /custom_50x.html;
        location = /custom_50x.html {
                root /usr/share/nginx/html;
                internal;
        }
}
