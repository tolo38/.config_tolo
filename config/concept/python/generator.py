
list_ = [1,2,3,4]
g=True
while g:
    gen = (x for x in list_)
    g = next(gen, None)
    print(g)
    try:
        list_.pop(0)
    except IndexError:
        pass

list_ = [1,2,3,4]
while list_:
    print(list_.pop(0))

print("try : ")
list_ = [1,2,3,4]
g=True
gen = (x for x in list_)
i = 50
while g:
    g = next(gen, None)
    print(g)
    try:
        #list_.pop(0)
        list_.pop()
        list_.append(i)
        i += 1
    except IndexError:
        pass

d = (i+1 for i in range(20))    #WARNING : if 0 -> Fales
l = [5]                         #WARNING : if 0 -> Fales
gen = (i for i in l)
next_ = next(gen)
while next_:
    print(next_)
    l.append(next(d,None))
    next_ = next(gen,None)

