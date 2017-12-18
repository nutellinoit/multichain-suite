build:
	rm -rf rootfs || true
	cp -r ../web_app_code rootfs
	docker build -t nutellinoit/web-app-nginx-multichain:1.1 .
	rm -rf rootfs || true
push:
	docker push nutellinoit/web-app-nginx-multichain:1.1