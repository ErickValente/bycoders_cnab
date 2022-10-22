from flask import Flask
from flask_cors import CORS
import ssl


class Server():

    def __init__(self):
        self.app = Flask(__name__)
        CORS(self.app)

    def run(self):
        self.app.run(
            host="0.0.0.0",
            port=3000,
            debug=True
        )


server = Server()
