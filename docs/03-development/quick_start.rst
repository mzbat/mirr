===========
Quick Start
===========

Generating Documents
--------------------

The original source documents in this repo are in the doc/source 
directory in the .rst format.

The documents can be rendered in may popular formats using Sphinx.

Install docker on your machine

Type "make" from top level of this repo
    - this will install needed packages inside a container
    - you will be "inside" the container after typing make
    - Flask will render the website for you `at this link`_.
    
.. _at this link: http://0.0.0.0:5000/

Type `cd docs` in the docker container
Type `make html` in the docker container
    - this generates html pages 
    - you can now open `http://0.0.0.0:5000` in your web browser