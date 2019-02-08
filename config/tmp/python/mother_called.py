

class A:
    @classmethod
    def add(cls,*truc):
        for i in truc:
            print(i)

A.add(1,3)
        
