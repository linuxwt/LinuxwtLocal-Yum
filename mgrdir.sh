#!/bin/bash

yumdownloader --resolve --destdir=ceph-mgr ceph-mgr \
pyOpenSSL python-beaker python-cffi \
python-cherrypy python-enum34 python-mako \
python-markupsafe python-paste python-pecan \
python-ply python-pycparser python-requests \
python-simplegeneric python-singledispatch python-tempita \
python-urllib3 python-webob python-webtest \
python-werkzeug python2-bcrypt python2-six
