class A:
    s="yeah !"
    def __init__(self,s=None):
        s= self.__class__.s if s is None else s
        self.s = s
    @classmethod
    def do(cls,s=None):
        s= cls.s if s is None else s
        print(s)
    def do_it(self):
        self.__class__.do(self.s)

A.do()
A().do_it()
i= A("cool")
i.do_it()
i.do()
A.s = "pop"
i.do()
A.do()

class B(A):
    def __init__(self,s):
        self.s = s
    def do(self):
        super().do(self.s)

B("coco").do()

class C(A):
    s="CONST"
    @classmethod
    def do(cls):
        super().do(cls.s)

C.do()

class D(B):
    s="CONSTANTE"
    @classmethod
    def do(cls):
        super().do(cls)

D.do()

E = type('',(A,),{})()
E.do()

F = type('',(A,),{"s":"metaCLASS"})()
F.do()
