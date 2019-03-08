import copy

class DeepObj:
    def __init__(self):
        self.dict_tree = {
                "toto": {"age": 5, "Jeux": "dance"},
                "tata": {"age": 50, "Jeux": "trico"}
        }
    def get_tree(self):
        return self.dict_tree
    def get_tree_copy(self):
        return copy.deepcopy(self.dict_tree)

obj = DeepObj()
a = obj.get_tree()
print(a)
a["toto"] = 12
b = obj.get_tree()
print(b)

obj2 = DeepObj()
c = obj2.get_tree()
print(c)
d = obj2.get_tree_copy()
print(d)
