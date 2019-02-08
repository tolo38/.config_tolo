import numpy as np
import io

x = np.arange(12).reshape(3,4)
output = io.BytesIO()
np.savez(output, x=x)
content = output.getvalue()
d = np.load(io.BytesIO(content))
d['x']

data = io.BytesIO()
np.save(data, x)
output.getvalue()
io.BytesIO(output.getvalue()).read()
np.load(io.BytesIO(output.getvalue()))
