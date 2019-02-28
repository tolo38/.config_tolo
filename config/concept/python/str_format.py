
d = [0, 1.0 , 0.5, -0.5 , -1]
n = ["Data", "Mean", "Current"]

s= "color({:^6}) {:+1.1f} rad"
for t in n:
    for a in d:
        print(s.format(t,a))
    print("\n")
