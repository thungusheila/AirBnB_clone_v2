#!/usr/bin/python3
#Fabric script that generates a tgz archive from the contents of the web_static folder of the AirBnB Clone repo

from datetime import datetime
from fabric.api import local
from os.path import isdir


def do_pack():
    """generates a tgz archive"""
    try:
        #uses module date time to form at the name of the compressed file
        date = datetime.utcnow().strftime("%Y%m%d%H%M%S")
        #creates a folder if it doesn't already exist
        if isdir("versions") is False:
            local("mkdir -p versions")
        #define the format in which the compressed file is saved
        file_name = "versions/web_static_{}.tgz".format(date)
        #defines command to compress coontents
        local("tar -cvzf {} web_static".format(file_name))
        return file_name
    except:
        return None
