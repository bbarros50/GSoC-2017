def mandelbrot_plot(float x_center = -1.0, float y_center = 0.0, float image_width = 4.0,
 int max_iteration = 500, int pixel_count = 500, base_color = [70,40,240]):
    r"""
    Function plots Mandelbrot set in the complex plane for the map $f(z) = z^2 + c$.

    INPUT:

    - x_center --  real part of the center point in the complex plane.

    - y_center -- imaginary part of the center point in the complex plane.

    - image_width -- float (optional - default: ``4``).

    - max_iteration -- int (optional - default: ``500``).

    - pixel_count -- int (optional - default: ``500``).

    - base_color -- (optional - default: ``[70, 40, 240]``)

    OUTPUT:

    - A plot of the Mandelbrot set in the complex plane.

    EXAMPLES::

    Plot the Mandelbrot set with the center point $-1 + 0i$

        sage: mandelbrot_plot(-1,0)
        Launched png viewer for 500x500px 24-bit RGB image

    ::

    The base_color key word allows us to change the color of the graph.

        sage: mandelbrot_plot(-1,0,base_color=[140,40,20])
        Launched png viewer for 500x500px 24-bit RGB image

    ::

    We can also change make the image larger by increasing the pixel_count.

        sage: mandelbrot_plot(-1,0,pixel_count=1000)
        Launched png viewer for 1000x1000px 24-bit RGB image

    ::

    If we decrease the max_iteration variable, we get a less accuract picture of the set.

        sage: mandelbrot_plot(-1,0,max_iteration=50)
        Launched png viewer for 500x500px 24-bit RGB image

    ::

    We can focus on smaller parts of the set by adjusting image_width.

        sage: mandelbrot_plot(-0.75,0.10,image_width=1/4)
        Launched png viewer for 500x500px 24-bit RGB image
    """
    #*****************************************************************************
    #       Copyright (C) 2017 BEN BARROS <bbarros@slu.edu>
    #
    # This program is free software: you can redistribute it and/or modify
    # it under the terms of the GNU General Public License as published by
    # the Free Software Foundation, either version 2 of the License, or
    # (at your option) any later version.
    #                  http://www.gnu.org/licenses/
    #*****************************************************************************


    from sage.plot.colors import Color
    from sage.repl.image import Image
    from copy import copy

    cdef int color_value, row, col, iteration, color_num, i, j
    cdef float new_x, new_y, x_coor, y_coor
    cdef color_list

    # reflect image about x-axis
    y_center *= -1

    M = Image("RGB", (pixel_count,pixel_count), 'black') # create image
    pixel = M.pixels() # get pixels

    color_num = 20 # number of colors
    color_list = []
    for i in range(color_num):
        color_list.append(copy(base_color))
        for j in range(3):
            color_list[i][j] += i*(255-color_list[i][j])/color_num
        color_list[i] = tuple(color_list[i])

    for row in range(pixel_count):
        x_coor = x_center + image_width*(row-pixel_count/2)/pixel_count # image_width is width of cartesian coordinates
        for col in range(pixel_count): # loop through pixels
            y_coor = y_center + image_width*(col-pixel_count/2)/pixel_count

            # compute the orbit of 0 under the map f(z) = z^2 + c
            new_x,new_y = (0.0, 0.0)
            iteration = 0

            while (new_x**2 + new_y**2 <= 4.0 and iteration < max_iteration): # escape condition
                new_x,new_y = new_x**2 - new_y**2 + x_coor, 2*new_x*new_y + y_coor
                iteration += 1

            if iteration < max_iteration/color_num:
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


def mandel_plot(**kwds):
    x_center = kwds.pop("x_center",-1.0)
    y_center = kwds.pop("y_center",0.0)
    image_width = kwds.pop("image_width",4.0)
    max_iteration = kwds.pop("max_iteration",500)
    pixel_count = kwds.pop("pixel_count",500)
    base_color = kwds.pop("base_color",[70,40,240])
    interacts = kwds.pop("interacts",True)

    if interacts:
        @interact(layout={'bottom':[['real_center'],['im_center'],['width']],'top':[['iterations']]})
        def _(real_center = input_box(-1.0, 'Real'),
            im_center = input_box(0.0,'Imaginary'),
            width = slider([2^(-i) for i in range(-2,15)],label= 'Width of Image'),
            iterations = input_box(500,'Max Number of Iterations')):
            print "Center: %s + %s*i" % (real_center,im_center)
            mandelbrot_plot(real_center, im_center, width, iterations, pixel_count, base_color).show()
    else:
        mandelbrot_plot(x_center, y_center, image_width, max_iteration, pixel_count, base_color).show()
