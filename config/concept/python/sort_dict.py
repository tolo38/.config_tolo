mydict = {'carl':40,
          'alan':2,
          'bob':1,
          'danny':3}

for key in sorted(mydict.keys()):
    print("{}: {}".format(key, mydict[key]))

sorted_dict_value = [mydict[k] for k in sorted(mydict.keys())]

print(str(sorted_dict_value))
