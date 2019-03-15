test = {'a': 1, 'c': {'a': 2, 'b': {'x': 5, 'y' : 10}}, 'd': [1, 2, 3]}

def parse_dict(init, lkey=''):
    ret = {}
    for rkey,val in init.items():
        key = lkey+rkey
        if isinstance(val, dict):
            ret.update(parse_dict(val, key+'_'))
        else:
            ret[key] = val
    return ret

a = parse_dict(test,'')
print(a)
print(test)
a["a"] = 45
print(test)
print(a)
