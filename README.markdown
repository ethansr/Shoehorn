#Shoehorn

Shoehorn generates templates for projects for COGS187A at UCSD.

It is a work in progress.

1. Run thor shoehorn:generate

2. Provide a name for the project when asked, this will be used as the
   github project name, make sure its set up

3. Profit 

Shoehorn does a few things:

It uses sprockets asset packaging to compile any javascripts in
assets/javascripts into one file named base.js

It uses sprockets to build references to any stylesheets specified 
in base.css and inserts relevant links into index.html

It provides a basic readme for the project

It creates a git repository for the project, adds all the relevant
files, creates makes gh-pages branch, and then pushes all to github
under the icl organization.
