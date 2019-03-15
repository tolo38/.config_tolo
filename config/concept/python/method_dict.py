
class t:
    @staticmethod
    def p():
        print("cool")

class use_t:
    d = []
    d.append(t.p)

use_t.d[0]()
