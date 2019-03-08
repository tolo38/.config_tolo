

class NameSpace:
    pass

static_object = NameSpace()

def load_static_obj_methode(obj):
    speech = "yoh"
    def say_hello():
        print("hello")
    obj.say_hello = say_hello
    def talk():
        print(speech)
    obj.talk = talk
    print("speech exist : {}".format("speech" in locals()))

load_static_obj_methode(static_object)
static_object.say_hello()
static_object.talk()
print("speech exist : {}".format("speech" in locals()))

class StaticObj:
    __speech = "cool"
    @staticmethod
    def talk():
        print(StaticObj.__speech)
    
StaticObj.talk()
print(StaticObj.__speech)
