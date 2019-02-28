import pylab
#from contextlib import contextmanager
import contextlib

import colour.plotting as plotting

@contextlib.contextmanager
def pylab_CIE1976(title="",zoom=False):
    #new u' v' graph
    plotting.chromaticity_diagram_plot_CIE1976UCS(standalone=False)
    if title:
        pylab.title(title)
    if zoom:
        pylab.xlim(0.15, 0.25) #white zoom
        pylab.ylim(0.4, 0.5)
    else:
        pylab.xlim(-0.1, 0.7)
        pylab.ylim(-0.1, 0.7)
    yield None
    pylab.show()

with pylab_CIE1976():
    pylab.plot([0,1],[0,1])
