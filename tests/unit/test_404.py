# -*- coding: utf-8 -*-

"""
  mirr application
    
  Test like so: python3 -m pytest tests/
  :copyright: (c) 2019 @theDevilsVoice
  :license: MIT
"""
import pytest
from flask import request

def test_404(client):
  response = client.get('/garbage')
  assert client.get('/garbage').status_code == 404

 