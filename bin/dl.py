import subprocess
import fileinput
for line in fileinput.input():
    grep = subprocess.call(['wget', 'http://pdos.csail.mit.edu/6.824-2002/lecnotes/' + line.strip()])
