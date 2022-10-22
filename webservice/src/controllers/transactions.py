from flask import Flask, request, jsonify
from server.webservice import server
from src.models.Transactions import TransactionModel


app = server.app


@app.route('/transactions/getSum')
def getSum():
    try:
        #FAKE VERIFICATION OF TOKEN
        token = request.headers.get('x-token')
        
        result = TransactionModel.getSum()
        if result == False:
            return jsonify(success=False, error="Houve um erro de banco.")
        return jsonify(success=True, data=result)
    except Exception as error:
        print(error)
        return jsonify(success=False, error="Houve um erro interno."), 500

@app.route('/transactions/register', methods=["POST"])
def registerTransactions():
    try:
        body = request.get_json()

        for transaction in body:
            TransactionModel.registerTransaction(transaction["transactionType"], transaction["date"], transaction["amount"], 
                transaction["cpf"], transaction["card"], transaction["time"], transaction["storeOwner"], transaction["storeName"])
        return jsonify(success=True)
    except Exception as error:
        print(error)
        return jsonify(success=False, error="Houve um erro interno."), 500
