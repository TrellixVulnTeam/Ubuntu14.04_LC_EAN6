# I found this example for PyCuda here:
# http://wiki.tiker.net/PyCuda/Examples/Mandelbrot
#
# I adapted it for PyOpenCL. Hopefully it is useful to someone.
# July 2010, HolgerRapp@gmx.net
#
# Original readme below these lines. 

# Mandelbrot calculate using GPU, Serial numpy and faster numpy
# Use to show the speed difference between CPU and GPU calculations
# ian@ianozsvald.com March 2010

# Based on vegaseat's TKinter/numpy example code from 2006
# http://www.daniweb.com/code/snippet216851.html#
# with minor changes to move to numpy from the obsolete Numeric

import numpy as np
import time

import numpy
import numpy.linalg as la

import pyopencl as cl

# You can choose a calculation routine below (calc_fractal), uncomment
# one of the three lines to test the three variations
# Speed notes are listed in the same place

# set width and height of window, more pixels take longer to calculate
w = 256
h = 256

def calc_fractal_opencl(q, maxiter):
    ctx = cl.Context(cl.get_platforms()[0].get_devices())
    queue = cl.CommandQueue(ctx)

    output = np.empty(q.shape, dtype=np.uint16)

    mf = cl.mem_flags
    q_opencl = cl.Buffer(ctx, mf.READ_ONLY | mf.COPY_HOST_PTR, hostbuf=q)
    output_opencl = cl.Buffer(ctx, mf.WRITE_ONLY, output.nbytes)

    prg = cl.Program(ctx, """
    #pragma OPENCL EXTENSION cl_khr_byte_addressable_store : enable
    __kernel void mandelbrot(__global float2 *q,
                     __global ushort *output, ushort const maxiter)
    {
        int gid = get_global_id(0);
        float nreal, real = 0;
        float imag = 0;

        output[gid] = 0;

        for(int curiter = 0; curiter < maxiter; curiter++) {
            nreal = real*real - imag*imag + q[gid].x;
            imag = 2* real*imag + q[gid].y;
            real = nreal;

            if (real*real + imag*imag > 4.0f)
                 output[gid] = curiter;
        }
    }
    """).build()

    prg.mandelbrot(queue, output.shape, (64,), q_opencl,
            output_opencl, np.uint16(maxiter))

    cl.enqueue_read_buffer(queue, output_opencl, output).wait()

    return output



def calc_fractal_serial(q, maxiter):
    # calculate z using numpy
    # this routine unrolls calc_fractal_numpy as an intermediate
    # step to the creation of calc_fractal_opencl
    # it runs slower than calc_fractal_numpy
    z = np.zeros(q.shape, np.complex64)
    output = np.resize(np.array(0,), q.shape)
    for i in range(len(q)):
        for iter in range(maxiter):
            z[i] = z[i]*z[i] + q[i]
            if abs(z[i]) > 2.0:
                q[i] = 0+0j
                z[i] = 0+0j
                output[i] = iter
    return output

def calc_fractal_numpy(q, maxiter):
    # calculate z using numpy, this is the original
    # routine from vegaseat's URL
    output = np.resize(np.array(0,), q.shape)
    z = np.zeros(q.shape, np.complex64)

    for iter in range(maxiter):
        z = z*z + q
        done = np.greater(abs(z), 2.0)
        q = np.where(done,0+0j, q)
        z = np.where(done,0+0j, z)
        output = np.where(done, iter, output)
    return output

# choose your calculation routine here by uncommenting one of the options
calc_fractal = calc_fractal_opencl
# calc_fractal = calc_fractal_serial
# calc_fractal = calc_fractal_numpy

if __name__ == '__main__':
    import Tkinter as tk
    import Image          # PIL
    import ImageTk        # PIL


    class Mandelbrot(object):
        def __init__(self):
            # create window
            self.root = tk.Tk()
            self.root.title("Mandelbrot Set")
            self.create_image()
            self.create_label()
            # start event loop
            self.root.mainloop()


        def draw(self, x1, x2, y1, y2, maxiter=30):
            # draw the Mandelbrot set, from numpy example
            xx = np.arange(x1, x2, (x2-x1)/w)
            yy = np.arange(y2, y1, (y1-y2)/h) * 1j
            q = np.ravel(xx+yy[:, np.newaxis]).astype(np.complex64)

            start_main = time.time()
            output = calc_fractal(q, maxiter)
            end_main = time.time()

            secs = end_main - start_main
            print "Main took", secs

            self.mandel = (output.reshape((h,w)) /
                    float(output.max()) * 255.).astype(np.uint8)

        def create_image(self):
            """"
            create the image from the draw() string
            """
            # you can experiment with these x and y ranges
            self.draw(-2.13, 0.77, -1.3, 1.3)
            self.im = Image.fromarray(self.mandel)
            self.im.putpalette(reduce(
                lambda a,b: a+b, ((i,0,0) for i in range(255))
            ))


        def create_label(self):
            # put the image on a label widget
            self.image = ImageTk.PhotoImage(self.im)
            self.label = tk.Label(self.root, image=self.image)
            self.label.pack()

    # test the class
    test = Mandelbrot()

