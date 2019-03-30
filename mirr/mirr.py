# -*- coding: utf-8 -*-
"""
  Mock Interview & Resume Workshop application

  :copyright: (c) by Franklin Diaz
  :license: MIT
"""
from flask import Flask

app = Flask(__name__, static_url_path='/', static_folder='/app/doc/build/html')

@app.route('/')
@app.route('/<path:path>')
def serve_sphinx_docs(path='index.html'):
    return app.send_static_file(path)


if __name__ == '__main__':
    app.run(host="0.0.0.0",debug=True)
