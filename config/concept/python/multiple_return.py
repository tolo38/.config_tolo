import collections

def mult():
    return 1,2,3

i = mult()
print(i)

def load():
    Loaded = collections.namedtuple("Loaded",["serial","product","type"])
    res = Loaded("GHRD",12,"my_type")
    return res

j = load()
print(j)
print(j.type)

k = collections.namedtuple("Point",["x","y"])(5,6)
print(k)
print(k[0])
