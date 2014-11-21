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
	docker run -d -v /hostdata:/data jmcarbo/mysyncthing launch node 4
```

To deploy a custom image you can use docker save image, copy the archive to another machine and run docker load image or
use a private docker registry.


