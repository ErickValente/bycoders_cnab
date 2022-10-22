import psycopg2
from psycopg2.extras import RealDictCursor


database = "BYCODERS"
user = "postgres"
host = "localhost"
password = "Maker@1"


class Db():
    conection = psycopg2.connect(database=database, user=user, host=host, password=password)
    cursor = conection.cursor(cursor_factory=RealDictCursor)
