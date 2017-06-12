%cython
def mandelbrot_plot(float x_center, float y_center, float zoom, int max_iteration = 100):
    from sage.plot.colors import Color
    from sage.repl.image import Image

    cdef int size, color_value, row, col, iteration
    cdef float new_x, new_y, x, y

    y_center *= -1 # reflect image about x-axis
    size = 500 # size of image, this should be an optional parameter as well.

    #M = Image("RGB", (size,size), 'black') # create image
    M = Image("RGB", (size,size)) # create image
    pixel = M.pixels() # get pixels
    for row in range(size):
        x = x_center + 4*(1/zoom)*(row-size/2)/size
        for col in range(size): # loop through pixels
            #y = y_center + 4*(1/zoom)*float(col-size/2)/size # Do I need the float?
            y = y_center + 4*(1/zoom)*(col-size/2)/size


            new_x,new_y = (0.0, 0.0) # compute the orbit of 0 under the map f(z) = z^2 + c
            iteration = 0

            while (new_x**2 + new_y**2 <= 4.0 and iteration < max_iteration): # escape condition
                new_x,new_y = new_x**2 - new_y**2 + x, 2*new_x*new_y + y
                iteration += 1
            if iteration == max_iteration:
                color_value = 0
            else:
                color_value = iteration*10 % 255

            pixel[row,col] = (color_value*100, color_value*2, color_value) # TODO: ADD OPTIONAL COLOR OPTIONS
    return M
