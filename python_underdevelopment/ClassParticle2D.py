import numpy as np
# from ClassSegline import Seg

class Particle:
    def __init__(self,
                 position=[0,0],
                 velocity=[0,0],
                 mass: float=1.0, name: str='H',  index:int=0, sigma:float = 1) -> None:

        self.pos = np.array(position, dtype=float)
        self.vel = np.array(velocity, dtype=float)
        self.m = mass
        self.name = name
        self.n = index
        self.s = sigma # collision cross section for later particle interactions

    # def prop(self):
    #     '''propagation function, determine what'''
    #     self.pos += self.dt*self.vel
    #     return

    # def reflect(self, seg: Seg):
    #     """
    #     Reflect the particle off a segment

    #     Args:
    #         container_size (float): Size of the square container.
    #     """
    #     sega = seg.a
    #     segb = seg.b

    #     for i in range(2):  # Check for collisions in x and y directions
    #         if self.position[i] < 0 or self.position[i] > container_size:
    #             self.velocity[i] *= -1  # Reverse velocity component

if __name__ == '__main__':
    # print(np.zeros((2), dtype=float))
    # seg = Seg(start=np.array([1,1]), end=np.array([0,0]))
    # print(seg.a, seg.b)
    pass