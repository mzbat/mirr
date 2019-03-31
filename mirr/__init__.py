# -*- coding: utf-8 -*-
"""
  Mock Interview & Resume Workshop application

  :copyright: (c)2019 by @mzbat
  :license: CCC 1.0
"""
from flask import Flask

def create_app(debug):
    app = Flask(__name__, static_url_path='/', static_folder='/app/doc/build/html')
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
