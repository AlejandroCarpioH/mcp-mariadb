from flask import Flask, request, jsonify
from ask_ia.ia import ia, deepseek
import json
from dotenv import load_dotenv
from mysqlCon.mysql import query_db
import subprocess
from datetime import datetime

import sys
sys.stdout.reconfigure(line_buffering=True)

load_dotenv()

app = Flask(__name__)

@app.route("/", methods=["POST"])
def openai():
    body = request.get_json()
    try:
        with open(f'./schemas/{body["db_name"]}.sql') as f:
            schema_database= f.read()
            
    except Exception as e:
        return jsonify({"error": e.args})

    prompt=f"""

                    -la fecha actual es {datetime.now()}
                -este es la estructura de mi base de datos en mysql: {schema_database}
                -te voy a hacer consultas y tu solo devuelveme el sql para poder ejecutarlo, (solo devuelveme la consulta nada mas)
                -si se necesita mas informacion para poder hacer el script, solamente dime los datos que faltan en message del json
                    devuelveme el resultado en json
                    ```json
                {{ 
                    "typeQuery": query | insert | update | delete
                    "sql": --aqui el sql--,
                    "message": (si lo que te pido no existe en la estructura mandame el mensaje aqui)
                }}
                ```
                si lo que te pido no existe en la estructura o falta mas valores devuelveme un sql vacio 

                """,
    result = deepseek(query=body["query"],prompt=prompt)

    



 
    result_formated= result.replace("`","").replace("json","")

    json_data = json.loads(result_formated)
    print(json_data["sql"])
    # if json_data["message"] != "":
    #     return jsonify(json_data)
    # return jsonify({"response":"ok"})
    result_query=query_db(json_data["sql"], body["db_name"])
    return jsonify({"result":result_query})


@app.route("/script", methods=["POST"])
def script():
    body = request.get_json()
    try:
        subprocess.run(
            f'docker exec -i mariadb mysqldump -u root -psamanosuke --no-data {body["db_name"]} > ./schemas/{body["db_name"]}.sql',
            shell=True,
            check=True,

            )
        return"ok"
    except Exception as e:
        print(e.args)
        return jsonify({"error":e.args})
    

 