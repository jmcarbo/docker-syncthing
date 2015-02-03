Due to the inner workings of syncthing, my approach to dockerizing it is:

1. Build a custom image with as many certificates as final nodes.
```
	docker run -ti --name aaa syncthing bootstrap <number of nodes>
        docker commit aaa <custom image name>
```
 
2. Deploy and run the custom image.
```
	docker run -d -v /data:/data <custom image name> launch node1..<number of nodes>
```

ej:

```
	docker run -v /data:/data -p 22000:22000 -p 21025:21025/udp -p 8081:8081 --net host aaa launch node1
	
	...
	
	docker run -v /data:/data -p 22000:22000 -p 21025:21025/udp -p 8081:8081 --net host aaa launch node2
```

To deploy a custom image you can use docker save image, copy the archive to another machine and run docker load image or
use a private docker registry.


