from flask import Flask, Response

app = Flask(__name__)

APP_VERSION = "1.0.0"

@app.route('/', methods=['GET'])
def get_app_version():
    return Response(f"version: {APP_VERSION}", content_type="text/plain")

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
