# -*- coding: utf-8 -*-

"""
    mirr application

    Test like so: python3 -m pytest .

    :copyright: (c) 2019 by @theDevilsVoice
    :license: MIT
"""
import pytest

from mirr.mirr import create_app

"""
Python Tests
"""
@pytest.fixture
def app():
  app = create_app(debug=True)
  return app


@pytest.fixture
def client(app):
    return app.test_client()