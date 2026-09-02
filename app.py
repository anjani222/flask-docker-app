from flask import Flask, jsonify

app = Flask(__name__)


@app.route("/")
def home():
    return "Hello from our Flask application running in Docker!"


@app.route("/health")
def health():
    return jsonify(status="healthy"), 200