
import matplotlib.pyplot as plt
import numpy as np
import collision_operations as co
from collision_setups import segs, N_segs
import matplotlib
matplotlib.use('TkAgg')

# P = nRT/V
# n = N/N_A

# Constants
num_particles = 1  #n
container_size = 10 # V in nanometers
time_steps = 50000
particles_speed = 0.5 # ¬ kinda T
dt = 1 # time step in picoseconds

# Initial positions and velocities of particles
# positions = np.random.rand(num_particles, 2)* container_size
positions = np.array([[9.,9.]])
# velocities = np.random.rand(num_particles, 2)* particles_speed
velocities = np.array([[4.,4.081]])
# print(positions, velocities)
# Creating our plot
fig, ax = plt.subplots()
scatter = ax.scatter(positions[:, 0], positions[:, 1], marker='o')
ax.set_xlim(0, container_size)
ax.set_ylim(0, container_size)
plt.gca().set_aspect('equal', adjustable='box')

# Simulation Loop
collisions_array = []
for step in range(time_steps):
    # positions += velocities
    n_collision = 0
    for i in range(num_particles):
        pos_new, vel_new = co.prop(positions[i], velocities[i], dt)
        for j in range(N_segs):
            if co.check_collision(positions[i], pos_new, segs[j]):
                #Collision
                pos_new = co.reflect_x(pos_new, segs[j])
                vel_new = co.reflect_v(vel_new, segs[j])
                print(f'{positions[i]=} -> {pos_new=}')
                for k in [x%N_segs for x in range(j-2, j+3)]:
                    if co.check_collision(positions[i], pos_new, segs[k]):
                        print(f'double collision')
                        pos_new = co.reflect_x(pos_new, segs[k])
                        vel_new = co.reflect_v(vel_new, segs[k])
                # double reflection from near segments

        positions[i] = pos_new
        velocities[i] = vel_new

    if not plt.fignum_exists(fig.number):
        break

    scatter.set_offsets(positions)
    plt.pause(0.0002)
    plt.xlim(-container_size, container_size)
    plt.ylim(-container_size, container_size)

plt.show()


