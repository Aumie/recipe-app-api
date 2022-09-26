server {
    listen ${LISTEN_PORT};

    # any url start with /static will go to /vol/static
    location /static {
       alias /vol/static;
    }

    location / {
       uwsgi_pass              ${APP_HOST}:${APP_PORT};
       # uwsgi_params required for http request to be process in uwsgi --- a list of params that will pass from http request to running services
       include                 /etc/nginx/uwsgi_params;
       # maximum of body size that request can pass-- 10Megabyte
       client_max_body_size    10M;
    }
}