import datetime
import mysql.connector


def query_db(query: str, DB_NAME: str):    
    connection = None
    print(DB_NAME)
 
    try:
        # Connect to the database
        conexion = mysql.connector.connect(
        host="localhost",
        port=3307,
        user="root",
        password="samanosuke",
        database="database_test"
    )
          # Query the database
        cursor = conexion.cursor()
        query = query
        cursor.execute(query)
        # print(cursor)
        # return 
        columns = [desc[0] for desc in cursor.description]

        # Convertir resultados a lista de diccionarios
        records = cursor.fetchall()
        results = [dict(zip(columns, row)) for row in records]
        for row in results:
            for key, value in row.items():
                if isinstance(value, (datetime.datetime, datetime.date)):
                    row[key] = value.isoformat()
        # Imprimir en formato JSON
        # print(json.dumps(results, indent=2))
        cursor.close()
                # connection.close()
        # print(json.dumps(results, indent=2))
        return results
    except Exception as e:
        print("An error occurred while connecting to the database:", e)
    finally:
        if connection:
            connection.close()
        
    
# def serialize(obj):
#     if isinstance(obj, (datetime.datetime, datetime.date)):
#         return obj.isoformat()  # formato: '2025-07-03T16:06:23'
#     raise TypeError(f"Type {type(obj)} not serializable")
