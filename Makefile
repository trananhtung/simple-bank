postgres:
	docker run --name bankingdb -p 5432:5432 -e POSTGRES_USER=tungtran -e POSTGRES_PASSWORD=tungtran -d postgres
createdb:
	docker exec -it bankingdb createdb --username=tungtran --owner=tungtran simple_bank
dropdb:
	docker exec -it bankingdb dropdb simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://tungtran:tungtran@localhost:5432/simple_bank?sslmode=disable" -verbose up
migratedown:
	migrate -path db/migration -database "postgresql://tungtran:tungtran@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY: postgres createdb dropdb migrateup sqlc