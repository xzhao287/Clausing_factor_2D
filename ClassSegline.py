import numpy as np

class Seg:
    def __init__(self,
                 start=np.zeros((2),dtype=float),
                 end=np.zeros((2),dtype=float)):
        self.a = np.array(start, dtype=float)
        self.b = np.array(end, dtype=float)

class Boundary:
    def __init__(self,
                 n_segs: int = 0,
                 segs: Seg = []):

        for i in range(self.n_segs):



