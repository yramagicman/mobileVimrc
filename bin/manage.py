#!/usr/bin/env python
import os
import sys
import subprocess
def find_managepy():
    env = os.getenv('VIRTUAL_ENV').split('/')[-1]
    for file in os.walk(os.getcwd()):
	if '.git' not in file[0]:
	    if 'manage.py' in file[-1] and env in file[0]:
		os.chdir(file[0])
		command = [os.getcwd() + '/manage.py'] + sys.argv[1:]
		print ' '.join(command)
		subprocess.call(command)
		return 1

def go_back(found):
    if not found:
	path = os.getcwd().split('/')[:-1]
	if '/'.join(path) == os.path.expanduser('~'):
	    print 'No manage.py file found for this project'
	    return
	return '/'.join(path)

def manage():
    found = find_managepy()
    if not found:
	back = go_back(found)
	os.chdir(back)
	manage()
manage()
