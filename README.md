# docker-ubuntu-apache-load-balance


### Usage
Before running the docker command we need create a simple conf file called "000-default.conf". 

#### 000-default.conf:

    <VirtualHost *:80>
	      Header add Set-Cookie "ROUTEID=.%{BALANCER_WORKER_ROUTE}e; path=/" env=BALANCER_ROUTE_CHANGED
	
	      <Proxy balancer://mycluster>
		      BalancerMember "http://backend-host1:8080" route=1
		      BalancerMember "http://backend-host2:8080" route=2
		      ProxySet stickysession=ROUTEID
	      </Proxy>
        ProxyPreserveHost On
        ProxyPass / balancer://mycluster/
        ProxyPassReverse / balancer://mycluster/
    </VirtualHost>

now you can run the docker command

    docker run --rm -p 80:80 -v /path/to/conf-file/:/etc/apache2/sites-enabled/ gustavorozolin/ubuntu-apache-load-balance:latest

and see the result

    http://localhost
    
that's all folks 🍻


### Docker Hub
[Docker Hub repository](https://cloud.docker.com/u/gustavorozolin/repository/docker/gustavorozolin/ubuntu-apache-load-balance)
