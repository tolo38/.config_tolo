import numpy as np

def print_tab(t):
    print("tab : {}".format(t))
    #print("not tab : {}".format(not t.all()))
    print("any : {}".format(t.any()))
    print("not any : {}".format(not t.any()))
    print("all : {}".format(t.all()))
    print("not all : {}".format(not t.all()))

t5 = np.arange(6)
tb = t5<3
tf = t5>12
tt = t5<12

print_tab(tb)
print_tab(tf)
print_tab(tt)
