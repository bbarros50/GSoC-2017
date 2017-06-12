%cython
def mandelbrot_plot(float x_center, float y_center, float zoom): # attempt to add interact
    from sage.plot.colors import Color
    from sage.repl.image import Image

    cdef int size, color_value, max_iteration, i, j
    cdef float a, b, x, y

    max_iteration = 100 # TODO: INCLUDE max_iteration AS AN OPTIONAL PARAMETER FOR FUNCTION
    size = 500

    M = Image("RGB", (size,size), 'black')
    pixel = M.pixels()
    for i in range(size):
        for j in range(size):
            x,y = ( x_center + 4*(1/zoom)*float(i-size/2)/size,
                    y_center + 4*(1/zoom)*float(j-size/2)/size )

            a,b = (0.0, 0.0)
            iteration = 0

            while (a**2 + b**2 <= 4.0 and iteration < max_iteration):
                a,b = a**2 - b**2 + x, 2*a*b + y
                iteration += 1
                if iteration == max_iteration:
                    color_value = 0
                else:
                    color_value = iteration*10 % 255

            pixel[i,j] = (color_value*100, color_value*2, color_value) # TODO: ADD OPTIONAL COLOR OPTIONS
    return M
