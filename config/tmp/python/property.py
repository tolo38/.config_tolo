class Celsius:
    def __init__(self, temperature = 0):
        self._temperature = temperature
    @property
    def temperature(self):
        print("Getting value")
        return self._temperature

    @temperature.setter
    def temperature(self, value):
        if value < -273:
            raise ValueError("Temperature below -273 is not possible")
        print("Setting value")
        self._temperature = value

i = Celsius()
a = i.temperature

class A:
    _temp = 12
    @property
    @classmethod
    def temperature(cls):
        print("t "+str(cls._temp))
        return cls._temp

i = A.temperature
