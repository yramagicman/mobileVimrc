#!/usr/bin/env python
import urllib2, re, os, time

#Read the command line args
args = os.sys.argv

#Grab Feed URL
response = urllib2.urlopen('http://www.xkcd.com/rss.xml')
xml = response.read()

#Get Matches for image
p = re.compile('http://imgs.xkcd.com/comics/\w*\.png')
matches = p.findall(xml)

#Get latest image and save it for update
if len(matches) > 0:
    latest = matches[0]

webFile = urllib2.urlopen(latest)
localFile = open(args[1],'w')
localFile.write(webFile.read())
webFile.close()
localFile.close()

print 'Latest xkcd cartoon downloaded...'
