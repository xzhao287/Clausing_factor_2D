import numpy as np

class Seg:
    def __init__(self,
                 start=[-1,0],
                 end=[1,0],
                 stick=0.0):
        self.a = np.array(start, dtype=float)
        self.b = np.array(end, dtype=float)

        self.sc = stick

class Boundary:
    def __init__(self,
                 n_segs: int = 0,
                 segs: Seg = []):

        for i in range(self.n_segs):



