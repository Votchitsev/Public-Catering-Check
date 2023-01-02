build:
	docker build . -t pcc

run:
	docker run -p 8000:80 -v pcc_database:/app/data --rm -d pcc

run-dev:
	docker run -p 8000:80 -v "${PWD}:/app" -v pcc_database:/app/data --rm -d --name pcc pcc 

stop: 
	docker stop pcc

restart: 
	docker stop pcc && docker run -p 8000:80 -v "${PWD}:/app" -v pcc_database:/app/data --rm -d --name pcc pcc 