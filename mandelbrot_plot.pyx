%cython
def mandelbrot_plot(float x_center, float y_center, float image_width = 4, int max_iteration = 500, int pixel_count = 500):
    ''' Function plots Mandelbrot set in the complex plane. Last updated 6:00 pm 6/9/17 '''
    from sage.plot.colors import Color
    from sage.repl.image import Image

    cdef int color_value, row, col, iteration, color_num, i, j
    cdef float new_x, new_y, x_coor, y_coor
    cdef base_color, color_list

    #max_iteration = 400 - 50*log(image_width)

    y_center *= -1 # reflect image about x-axis

    M = Image("RGB", (pixel_count,pixel_count), 'black') # create image
    pixel = M.pixels() # get pixels

    base_color = [70, 40, 240]
    color_num = 20
    color_list = []
    for i in range(color_num):
        color_list.append(base_color)
        for j in range(3):
            color_list[i][j] += i*(255-color_list[i][j])/color_num
        color_list[i] = tuple(color_list[i])

    for row in range(pixel_count):
        x_coor = x_center + image_width*(row-pixel_count/2)/pixel_count # image_width is width of cartesian coordinates
        for col in range(pixel_count): # loop through pixels
            y_coor = y_center + image_width*(col-pixel_count/2)/pixel_count


            new_x,new_y = (0.0, 0.0) # compute the orbit of 0 under the map f(z) = z^2 + c
            iteration = 0

            while (new_x**2 + new_y**2 <= 4.0 and iteration < max_iteration): # escape condition
                new_x,new_y = new_x**2 - new_y**2 + x_coor, 2*new_x*new_y + y_coor
                iteration += 1

            if iteration < max_iteration/color_num:  # starts with it < max/colNum
                pixel[row,col] = color_list[0]
            elif iteration < 2*max_iteration/color_num:
                pixel[row,col] = color_list[1]
            elif iteration < 3*max_iteration/color_num:
                pixel[row,col] = color_list[2]
            elif iteration < 4*max_iteration/color_num:
                pixel[row,col] = color_list[3]
            elif iteration < 5*max_iteration/color_num:
                pixel[row,col] = color_list[4]
            elif iteration < 6*max_iteration/color_num:
                pixel[row,col] = color_list[5]
            elif iteration < 7*max_iteration/color_num:
                pixel[row,col] = color_list[6]
            elif iteration < 8*max_iteration/color_num:
                pixel[row,col] = color_list[7]
            elif iteration < 9*max_iteration/color_num:
                pixel[row,col] = color_list[8]
            elif iteration < 10*max_iteration/color_num:
                pixel[row,col] = color_list[9]
            elif iteration < 11*max_iteration/color_num:
                pixel[row,col] = color_list[10]
            elif iteration < 12*max_iteration/color_num:
                pixel[row,col] = color_list[11]
            elif iteration < 13*max_iteration/color_num:
                pixel[row,col] = color_list[12]
            elif iteration < 14*max_iteration/color_num:
                pixel[row,col] = color_list[13]
            elif iteration < 15*max_iteration/color_num:
                pixel[row,col] = color_list[14]
            elif iteration < 16*max_iteration/color_num:
                pixel[row,col] = color_list[15]
            elif iteration < 17*max_iteration/color_num:
                pixel[row,col] = color_list[16]
            elif iteration < 18*max_iteration/color_num:
                pixel[row,col] = color_list[17]
            elif iteration < 19*max_iteration/color_num:
                pixel[row,col] = color_list[18]
            elif iteration < max_iteration:
                pixel[row,col] = color_list[19]
    return M
