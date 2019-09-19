FROM lucee/lucee:5.3

# Lucee configs
COPY conf/ /opt/lucee/web/
# Code
COPY www /var/www

EXPOSE 8888