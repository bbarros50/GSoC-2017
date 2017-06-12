def mandelbrot_interact(sliders=False):
    r"""
    Interactive plot of the Mandelbrot set for the map $f(z) = z^2 + c$. The optional parameter ``sliders`` allows the user to control
    the center point of the graph with sliders rather than a textbox.

    NOTEBOOK EXAMPLES::

        mandelbrot_interact()

    ::

    If you prefer to use sliders, set sliders to True,

        mandelbrot_interact(sliders=True)

    OUTPUT:

    - Interactive graph of the Mandelbrot set with textboxes controlling the maximum number of iterations, center point, and zoom parameters.
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

    if sliders == False:
        @interact(layout={'bottom':[['x_center'],['y_center'],['width']],'top':[['iterations']]})
        def _(x_center = input_box(-1.0, 'Real'),
            y_center = input_box(0.0,'Imaginary'),
            width = slider([2^(-i) for i in range(-2,100)],label= 'Width of Image'),
            iterations = input_box(500,'Max Number of Iterations')):
            print "Center: %s + %s*i" % (x_center,y_center)
            show(mandelbrot_plot(x_center, y_center, image_width=width, max_iteration=iterations))
    else:
        @interact(layout={'bottom':[['x_center'],['y_center'],['width']],'top':[['iterations']]})
        def _(x_center = slider(-2,2,default= -1.0, label= 'Real'),
            y_center = slider(-1,1, default= 0.0, label= 'Imaginary'),
            width = slider([2^(-i) for i in range(-2,100)],label= 'Width of Image'),
            iterations = input_box(500,'Max Number of Iterations')):
            print "Center: %s + %s*i" % (x_center,y_center)
            show(mandelbrot_plot(x_center, y_center, image_width=width, max_iteration=iterations))
