from util import connection_handler


@connection_handler
def get_query(cursor):
    cursor.execute("""Select boards_id, boards_title from boards""")
    query = cursor.fetchall()
    return query
