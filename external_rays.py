def external_ray(theta):
    c_0 = complex(exp(2*pi*i*theta))
    c_list = [c_0]
    q(c) = c
    temp_c = 0
    for k in range(1,S*D+1):
        r = R^(2^(-k))
        q_k(c) = q(c)^2 + c
        t_k = r^(2^k)*exp(2*pi*i*theta*2^k)
        N(c,t) = c - (q_k(c) - t)/(diff(q_k(c)))
        iterations = 0
        while iterations < 100:
            temp_c = N(c_list[k-1],t_k)
            iterations += 1
        c_list.append(complex(temp_c))
    for k in range(len(c_list)):
        x,y = c_list[k].real, c_list[k].imag
        c_list[k] = (x, y)
    #     c_list[k] = (500*(x-(-1))/4 + 500/2, (500*(y - 0))/4 + 500/2) # attempt at scaling
    return c_list
 
