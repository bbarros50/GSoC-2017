def mandelbrot_interact():
    '''Function plots an interactive Mandelbrot set with a slider controlling the width of the image and textboxes controlling the
    x and y coordinates for the center. '''
    @interact(layout={'bottom':[['x_center'],['y_center'],['image_width']]})
    def _(x_center = input_box(-1.0, 'x_center'), y_center = input_box(0.0,'y_center'), image_width = slider([2^(-i) for i in range(-2,100)])):
        print "Center: (%s,%s)" % (x_center,y_center)
        show(mandelbrot_plot(x_center,y_center,image_width))
