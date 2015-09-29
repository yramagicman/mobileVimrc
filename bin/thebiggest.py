x = 100
y = 50
def whatsBigger(x,y):
    if x > y:
        return y
    return x

print whatsBigger(x, y)
print whatsBigger(y, x)

def gcd(a, b):
    bigger = whatsBigger(a, b)
    for i in range(1, bigger+1):
        z = a%i
        y = b%i
        print y, z
        if y == 0 and z == 0:
            returnVal = i
    return returnVal

print gcd(x, y)
