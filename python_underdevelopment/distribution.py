import numpy as np

''' kb = 1.380649e-23 J/K'''

kb = 831.4462618
''' gas constant in amu*(Å^2/ns^2)/K is numerically
about 100 times the gas constant in J/mol/K'''

def dist_maxwell_1d(T, m, N, S=4):
    sigma = np.sqrt(kb*T/m)
    v = np.linspace(-S*sigma, S*sigma, 2*N)
    pv = np.exp(-v**2/(2*sigma**2))
    pv_sum = np.sum(pv)
    pv = pv/pv_sum
    cpv = np.cumsum(pv)
    return v, pv, cpv

def rand2dist(x, v, cpv):
    return np.interp(x, cpv, v)

def dist_maxwell_3d(T, m, N, S=4):
    sigma = np.sqrt(kb*T/m)
    v = np.linspace(0, S*sigma, N)
    pv = v**2*np.exp(-v**2/(2*sigma**2))
    pv_sum = np.sum(pv)
    pv = pv/pv_sum
    cpv = np.cumsum(pv)
    return v, pv, cpv

if __name__ == "__main__":
    N = 1000000
    x = np.random.rand(N)
    y = np.random.rand(N)
    z = np.random.rand(N)

    v, pv, cpv = dist_maxwell_1d(300, 28, 400)
    v3d, pv3d, cpv3d = dist_maxwell_3d(300, 28, 400)
    vx = rand2dist(x, v, cpv)
    vy = rand2dist(y, v, cpv)
    vz = rand2dist(z, v, cpv)
    v = np.sqrt(vx**2 + vy**2 + vz**2)

    import matplotlib.pyplot as plt
    freq, _, _ = plt.hist(v, bins=200)
    plt.plot(v3d, pv3d*np.mean(sorted(freq)[-15:])/max(pv3d))
    print(len(v3d))
    plt.show()

