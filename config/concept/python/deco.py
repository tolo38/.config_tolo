import abc

class BasePizza(object):
    __metaclass__  = abc.ABCMeta
    @abc.abstractmethod
    def get_radius(self):
        """Method that should do something."""

BasePizza()
