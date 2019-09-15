# Mock Interview Resume Workshop

This is the repository for the Mock Interview and Resume Review Workshop established at Derby Con 2015. 
The purpose of this github [brain dump](https://github.com/mzbat/mirr/blob/master/braindump) is to provide i
tools & insights for folks who want to conduct MIRR workshops in their local communities.

[The link to the formatted web version](https://mock-interview-resume-review.herokuapp.com/) 
is on [StabOps.com](https://stabops.com/)

## Contributing  

[Follow this link for how to make a contribution to our repository](https://guides.github.com/activities/forking/)

These are the steps:

1. Fork this repo
2. Make a clone of your fork
3. Create a branch ot make changes in.
4. Make changes in your branch
    - modify
    - add comments and descriptions
5. create a pull request
6. Your changes will be reviewed and merged.

## Generating Documents

The original source documents in this repo are in the doc/source directory in a .rst format. 

The documents can be rendered in may popular formats using Sphinx. 
(More information about Sphinx)[http://www.sphinx-doc.org/en/1.8/index.html]

#### Quick Start

- Install docker on your machine
    - [Linux](https://docs.docker.com/v17.12/install/)
    - [Mac](https://docs.docker.com/docker-for-mac/install/)
    - [Windows](https://docs.docker.com/docker-for-windows/install/)
- type "make" from top level of this repo
    - this will install needed packages inside a container
    - you will be "inside" the container after typing make
    - Flask will render the website for you at this link: http://0.0.0.0:5000/
- type "cd doc" in the docker container
- type "make html" in the docker container
    - this generates html pages 
    - you can now open http://0.0.0.0:5000 in your web browser