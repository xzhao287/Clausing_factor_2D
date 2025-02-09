# Simulating molecules colliding in a hole

## The concept and the background

Clausing factor, a factor defined in molecular flow regime, is the protion of gas molecules reaching the other side of a tube among those entering the tube. By definition, molecular flow regime is where the mean free path (the distance a molecule travels before colliding with other moleules) is much longer than the container size, and each molecule is therefore idependent from other molecules and will collide with container walls many times before meeting each other; in other words, molecules do not "push" each other within the container.[^1] This means for a very small space (< 10 nm, a typical length scale for advance chips), the molecular behavior is alway in the molecular flow regime. Thus, during chemical vapor deposition in modern semiconductor fabrication, the Clausing factor is a useful concept to understand the mass transport of gas molecules in microscopic features dug out on wafer surfaces, such as troughs or holes with depth about 10 nm and opening about 2 nm.

## The simulation

![](https://github.com/xzhao287/Clausing_factor_2D/blob/main/Clausing_factor_2D.gif)

In this toy example simulation, we use the basic physics to simulate where molecules entering a hole end up—the distribution of the entering molecules along the wall surface. The simulation generates gas molecules from above the tube and assigns them velocities in x and y directions following the Maxwell-Boltzmann distribution. When a molecules hits the walls in the hole, the simulator determines whether it sticks (disappear) or bounces (mirror reflection) using sticking coefficient. Sticking coefficient a parameter associated with the wall and, in reality, determined by the physio-chemical nature of the deposition surface. If a gas molecule gets out of the box above the hole, its velocity is pointing the wrong direction and it will not contribute to the sampling in anyway, so the simulator will regenerate a molecule to replace it.

Inside the hole, the molecules collides with the walls and some will stick randomly, and a small portion may come back out of the opening. The walls are segmented by their depth and the molecule counts stick to them are recorded and plotted.

It may not make immediate sense that the molecules do not collide each other even though they appear to collide in the animation, but as we have pointed out in the background section that we're simulating in the molecular flow regime, the molecules should in fact not collide. We're essentially running many independent simulations for each molecule at the same time, and we can speed up the sampling by putting a bit more molecules in the box.

## Future directions

### The collision with walls

Obviously, a molecule colliding with a surface does not just either stick or bounce. In fact, the collision of a gas molecules with a solid surface on which it can react (as in the case of chemical vapor deposition) has been a popular topic of physical chemistry for decades. A gas molecule can collide with the surface, barely interact with it, and then escape, with the most of its incoming kinetic energy and its outbound trajectory angled mostly well-above the surface (a grazing angle), or it can be adsorbed to the surface, then diffuse, or react, or escape again into the gas phase (following a more Maxwellian distribution). To capture this complicated picture, we need to introduce a more comprehensive way to determine the outcome of a collision.

### The diffusion along the walls

As we can see from the results, the distribution of gas dose along the wall is not uniform at all. For a better chemical deposition inside the wall, dose distribution with better uniformity is crucial. Fortunately, when the scale of microelectronics gets smaller, the surface diffusion within the hole will smooth out the deposition growth, and the diffusion from near the hole will also supply precussors, beside the direct inbound gas flow into the hole. To simulate this phenomenon, we need to takcle the challange to restrict the diffusion to the wall.

### The Python and Jupyter Notebook version is under development

## References

[^1]: [Foundations of Vacuum Science and Technology, Edited by James M. Lafferty, Chapter 2 Flow of gas through tubes and orifices](https://atomoptics-nas.uoregon.edu/~tbrown/files/strontium_vacuum_system/Research%20Papers/Livesey_mod.pdf)
