## docker-graphite ##

I wish to build a few containers to house

* graphite-web
* carbon-cache
* grafana

In order to build the graphite-web image and run the container, please follow the commands below.

> cd graphite-web; docker build -t graphite-web .; docker run -dit -p 80:80 graphite-web 

In order to build the carbon-cache image and run the container, please follow the commands below. You have to define an environment $CARBON_PORT variable for each of incoming carbon port to listen. You will need to expose $CARBON_PORT when you start the container

> cd carbon-cache; docker build -t carbon .; docker run -dit --env CARBON_PORT=2003 -p 2003:2003 carbon

if you are running another carbon container with a different port, then you will run like this.

> docker run -dit --env CARBON_PORT=56360 -p 56360:56360 carbon

In the scalable environment we can design our containers as below:

![alt text](https://github.com/yenonn/docker-graphite/blob/master/docker-graphite.png "docker-graphite image")

###### All the based container will be based on the centos 7. if you have any questions please write to Yenonn Hiu <yenonn@gmail.com>
