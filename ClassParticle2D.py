import numpy as np
from ClassSegline import Seg

class Particle:
    def __init__(self,
                 position=np.zeros((2),dtype=float),
                 velocity=np.zeros((2),dtype=float),
                 mass: float=1.0, name: str='H',  dt:float = 1, index:int=0) -> None:

        self.pos = position
        self.vel = velocity
        self.m = mass
        self.n = index
        self.pos_new = self.vel * dt

    def prop(self, dt):
        '''propagation function, determine what'''
        self.pos += dt*vel

    def reflect(self, seg: Seg):
        """
        Reflect the particle off a segment

        Args:
            container_size (float): Size of the square container.
        """
        sega = seg.a
        segb = seg.b

        for i in range(2):  # Check for collisions in x and y directions
            if self.position[i] < 0 or self.position[i] > container_size:
                self.velocity[i] *= -1  # Reverse velocity component

if __name__ == '__main__':
    # print(np.zeros((2), dtype=float))
    seg = Seg(start=np.array([1,1]), end=np.array([0,0]))
    print(seg.a, seg.b)