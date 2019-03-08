def foo():
    print('lazy')
    return False

def bar():
    print('not lazy')
    return False

foo() and bar()  

all(f() for f in [foo, bar])
