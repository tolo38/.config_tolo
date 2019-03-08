'''
conditional For loop
'''

print("expected out put")
a = [2,3,4,5,6,7,8,9,0]
xyz = [0,12,4,6,242,7,9]
for x in xyz:
    if x in a:
        print(x)

print("\nTry 1 :")
#generator
gen = (x for x in xyz if x in a)

for x in gen:
    print(x)

print("\nTry 2 :")
for x in (x for x in xyz if x in a):
    print(x)

print("\nTry 3 :")
for x in filter(lambda w: w in a, xyz):
    print(x)
