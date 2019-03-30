#!/usr/bin/python3
# -*- coding: utf-8 -*-

from flask import Flask

app = Flask(__name__, static_url_path='/', static_folder='_build/html/')

@app.route('/')
@app.route('/<path:path>')
def serve_sphinx_docs(path='index.html'):
    return app.send_static_file(path)


if __name__ == '__main__':
    app.run(debug=True)
