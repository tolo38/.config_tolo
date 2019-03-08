
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


