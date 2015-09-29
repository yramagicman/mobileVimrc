#!/usr/bin/env python
import os
import re
import shutil
import subprocess
localdir = "/home/jonathan/htdocs/wordpress/wp-content/themes/"
remotedir = "/home/jonathan/Dropbox/webStuff/themes/"
localthemes = os.walk(localdir)
remotethemes = os.walk(remotedir)
def localDbGenerate():
    localthemesDB = []
    for i in localthemes:
        #localtime= os.stat(i[0])
        if 'node_modules' not in i[0] and '.git' not in i[0]:
            localthemesDB = localthemesDB + [i[0]]
        #print localtime.st_mtime
    return localthemesDB
def remoteDbGenerate():
    remotethemesDB = []
    for i in remotethemes:
        #remotetime= os.stat(i[0])
        if 'node_modules' not in i[0] and '.git' not in i[0]:
            remotethemesDB = remotethemesDB + [i[0]]
        #print localtime.st_mtime
    return remotethemesDB
def coalate():
    localdb = localDbGenerate()
    print "local done"
    remotedb = remoteDbGenerate()
    print "remote done"
    localcount = len(localdb)
    remotecount = len(remotedb)
    coalatedDB = []
    if localcount != remotecount:
        print "they're not equal"
    else:
        i = 1
        while i < localcount:
            print localdb[i], remotedb[i]
            coalatedDB = coalatedDB + [[localdb[i], remotedb[i]]]
            i = i + 1
    return coalatedDB

print coalate()
print "**************************************"

#print localtime.st_mtime
#print remotetime.st_mtime
#if localtime > remotetime:
#    print "attempting to copy local to remote"
#    subprocess.call(["rsync", "-av", localthemes, remotethemes])
#elif remotetime > localtime:
#    print "attempting to copy remote to local"
#    subprocess.call(["rsync", "-av", remotethemes, localthemes])
#else:
#    print "hello"