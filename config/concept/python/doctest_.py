'''
From the command line
	python -m doctest [-v] your_script.py

From inside a script
	import doctest
	doctest.testmod()
'''

def multiply(a, b):
    """
    Arguments:
        a, b : Number

    Returns:
        type(a) : a*b

    Exemple:
        >>> multiply(4, 3)
        12
        >>> multiply('a', 3)
        'aaa'
    """
    return a * b


def list_to_0_index(lst):
    """A solution to the problem given in:
    http://rgrig.blogspot.com/2005/11/writing-readable-code.html

    'Given a list, lst, say for each element the 0-index where it appears for
    the first time. So the list x = [0, 1, 4, 2, 4, 1, 0, 2] is
    transformed into y = [0, 1, 2, 3, 2, 1, 0, 3]. Notice that for all
    i we have x[y[i]] = x[i]. Use any programming language and any data
    representation you want.'

    >>> x = [0, 1, 4, 2, 4, 1, 0, 2]
    >>> list_to_0_index(x)
    [0, 1, 2, 3, 2, 1, 0, 3]
    >>>
    """

    return [lst.index(i) for i in lst]

if __name__ == '__main__':
    import doctest
    print(doctest.__file__)  # add this
    doctest.testmod()
