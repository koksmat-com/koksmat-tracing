docker exec -it superset superset db upgrade 
docker exec -it superset superset load_examples
docker exec -it superset superset init