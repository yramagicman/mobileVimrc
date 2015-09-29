f=open("ping.txt")
days = [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
data =[]
remote = []
local = []
for l in f:
    if l[:3] in days:
        data.append(l)
    if l[:3] == "100" or l[:1] == '5':
        data.append(l)
    if l[:3] == "rtt":
        data.append(l)
f.close()
for l in range(0, len(data)):
    if data[l][:3] in days:
        remote.append(data[l].strip() + ",")
        local.append(data[l].strip() + ",")
    if data[l][:3] == "100":
        remote.append(data[l])
        #remote.append(data[l + 1][data[l +1].find('=') + 1:])
    if data[l][:1] == "5":
        local.append(data[l])
        #local.append(data[l + 1][data[l +1].find('=') + 1:])
data=[]
#for i in remote:
#    print(i),
#
for i in local:
    print(i),
