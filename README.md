## docker-graphite ##

I wish to build a few containers to house

* graphite-web
* carbon-cache
* grafana

In order to build the graphite-web image, please follow the commands below

> cd graphite-web; docker build -t graphite-web .; docker run -dit -p 80:80 graphite-web 

All the based container will be based on the centos 7. if you have any questions please write to Yenonn Hiu <yenonn@gmail.com>
