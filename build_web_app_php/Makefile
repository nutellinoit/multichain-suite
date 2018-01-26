build:
	rm -rf rootfs || true
	cp -r ../web_app_code rootfs
	docker build -t nutellinoit/web-app-php-multichain:1.5 .
	rm -rf rootfs || true
push:
	docker push nutellinoit/web-app-php-multichain:1.5