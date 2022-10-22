from flask import Flask, request, jsonify
from server.webservice import server
from src.models.Access import AccessModel


app = server.app


@app.route('/access/auth', methods=["POST"])
def auth():
    try:
        body = request.get_json()
        result = AccessModel.authenticationByLoginAndPass(body["login"], body["password"])
        if result == False:
            return jsonify(success=False, error="Houve um erro de banco.")
        return jsonify(success=True, data=result)
    except Exception as error:
        print(error)
        return jsonify(success=False, error="Houve um erro interno."), 500

@app.route('/access/new', methods=["POST"])
def newAccess():
    try:
        body = request.get_json()
        result = AccessModel.newAccess(body["name"], body["login"], body["password"])
        if result == False:
            return jsonify(success=False, error="Houve um erro de banco.")
        return jsonify(success=True, data=result)
    except Exception as error:
        print(error)
        return jsonify(success=False, error="Houve um erro interno."), 500
