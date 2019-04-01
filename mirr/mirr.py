# -*- coding: utf-8 -*-
"""
  Mock Interview & Resume Workshop application

  :copyright: (c)2019 by @mzbat
  :license: CCC 1.0
"""
import os
from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__, static_folder='/app/doc/build/html')

def create_app(debug):
    app.debug = debug
    app.config.from_mapping(
        SECRET_KEY = os.environ.get('SECRET_KEY') or 'dev_key'
    )
    return app

@app.route('/')
@app.route('/<path:path>')
def index(path='index.html'):
    return app.send_static_file(path)

@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404

if __name__ == '__main__':
    app = create_app(debug=False)
    port = int(os.environ.get('PORT', 5000))
    app.run(host="0.0.0.0", port=port)
