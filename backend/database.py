import psycopg2


def _open():
    """
    Open a connection and a cursor on the database.
    :return: The :code:`Connection` and :code:`Cursor` object
    """
    conn = psycopg2.connect(host="localhost",
                            database="postgres",
                            user="postgres",
                            password="Z!XQ$S#69o#x*r")
    cur = conn.cursor()
    return conn, cur


def _close(conn, cur):
    """
    Close the cursor and connection.
    :param conn: The :code:`Connection` object.
    :param cur: The :code:`Cursor` object.
    :return: Nothing.
    """
    cur.close()
    conn.close()


def read(sql: str):
    """
    Perform a read-only operation on the database (SELECT).
    :param sql: The SQL query to execute.
    :return: A Dictionary containing the response message, and a list of dictionaries representing the return table.
    """
    conn, cur = _open()
    cur.execute(sql)
    msg = cur.statusmessage
    cols = [i.name for i in cur.description]
    results = []
    for row in cur:
        row_dict = {}
        for i in range(0, len(row)):
            row_dict = {**row_dict, cols[i]: row[i]}
        results.append(row_dict)
    _close(conn, cur)
    return {"message": msg, "result": results}


def write(sql: str):
    """
    Perform a write-only operation on the database (:code:`INSERT`, :code:`UPDATE`, :code:`DELETE`).
    :param sql: The SQL query to execute.
    :return: A dictionary containing the response message only.
    """
    conn, cur = _open()
    cur.execute(sql)
    msg = cur.statusmessage
    conn.commit()
    _close(conn, cur)
    return {"message": msg}
