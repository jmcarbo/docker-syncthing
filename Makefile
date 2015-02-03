build:
	docker build -t syncthing .
image:
	docker rm -f aaa
	docker run -ti --name aaa syncthing bootstrap 4
	docker commit aaa mysync
	docker export aaa >aaa.tar
	cat aaa.tar | docker import - aaa
