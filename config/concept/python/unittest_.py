
import unittest

class A:
    def abs(i):
        return i if i>0 else -i

class TestA(unittest.TestCase):
    """Unittest class that tests all A methode"""

    def setUp(self):
        self.number = [5,-12]

    def test_abs(self):
        is_positif = [abs(n)>0 for n in self.number]
        self.assertTrue(all(is_positif))

unittest.main()
