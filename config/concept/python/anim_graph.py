import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from matplotlib import style

style.use('fivethirtyeight')

fig = plt.figure()
ax1 = fig.add_subplot(1,1,1)

graph_data = np.array([
        [1,5],
        [2,3],
        [3,4],
        [4,7],
        [5,4],
        [6,3],
        [7,5],
        [8,7],
        [9,4],
        [10,4]]
)
#ax1.plot(graph_data[:,0], graph_data[:,1])
x = []
y = []

def animate(i):
    x.append(graph_data[i,0])
    y.append(graph_data[i,1])
    ax1.clear()
    ax1.plot(x, y)

ani = animation.FuncAnimation(fig, animate, interval=100)
plt.show()

#################################################
import numpy as np
import matplotlib.pyplot as plt

plt.axis([0, 1, 0, 1])
fig = plt.figure()                                                          
ax1 = fig.add_subplot(1,1,1)

#for i in range(10):
while True:
	ax1.axis([0, 1, 0, 1])
	x = np.random.random()
	y = np.random.random()
	ax1.scatter(x, y)
	plt.pause(0.5)
	ax1.clear()

plt.show()

plt.axis([0, 1, 0, 1])

#for i in range(10):
while True:
	x = np.random.random()
	y = np.random.random()
	plt.scatter(x, y)
	plt.pause(0.5)

plt.show()
