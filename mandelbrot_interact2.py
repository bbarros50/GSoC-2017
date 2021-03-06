
def mandelbrot_interact():
    ''' Function plots an interactive Mandelbrot set with sliders controlling the width of the image and the coordinates of the center.'''
    @interact(layout={'bottom':[['x_center'],['y_center'],['image_width']]})
    def _(x_center = slider(-2,2,default= -1.0), y_center = slider(-1,1, default= 0.0), image_width = slider([2^(-i) for i in range(-2,100)])):
        print "Center: (%s,%s)" % (x_center,y_center)
        mandelbrot_plot(x_center,y_center,image_width).show()
