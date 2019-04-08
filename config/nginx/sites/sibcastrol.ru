server {
        listen 80 default;
		listen [::]:80;

        server_name DOMAIN.NAME;

        root /var/www/frontend/www;

        index index.php;
        autoindex off;
        charset utf-8;

        location / {
            try_files $uri $uri/ =404;
            if (!-e $request_filename){
                rewrite ^(.*)$ /index.php;
            }
        }

        location ~* ^.+\.(ogg|ogv|svg|svgz|eot|otf|woff|mp4|ttf|rss|atom|jpg|jpeg|gif|png|ico|zip|tgz|gz|rar|bz2|doc|xls|exe|ppt|tar|mid|midi|wav|bmp|rtf)$ {
            expires max;
            fastcgi_hide_header Set-Cookie;
        }

        location ~* ^.+\.(js|css)$ {
            expires 7d;
        }

        location ~ \.php$ {
			include fastcgi_params;
			fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
			fastcgi_param PATH_INFO $fastcgi_path_info;
			fastcgi_buffer_size 32k;
			fastcgi_buffers 4 32k;
            fastcgi_pass php:9000;
            fastcgi_read_timeout 300;
        }

        location ~ /\. {
            access_log off;
            log_not_found off;
            deny all;
        }
}
