Vector Addition OpenCL Design Example README file
=================================================
=================================================

This readme file for the Vector Addition OpenCL Design Example contains information
about the design example package. For more examples, please visit the page:
http://www.altera.com/support/examples/opencl/opencl.html

This file contains the following information:

- Example Description
- Software and Board Requirements
- Usage Instructions
- Package Contents and Directory Structure
- Release History
- Disclaimer & Licenses
- Contacting Altera(R)


Example Description
===================

This example runs a basic OpenCL kernel that performs
   C = A + B
where A, B and C are N-element vectors. The kernel is intentionally
kept simple and not optimized to achieve maximum performance on
the FPGA.

In addition to demonstrating the basic OpenCL API, this example supports
partitioning the problem across multiple OpenCL devices, if available. 
If there are M available devices, the problem is divided so that each device operates 
on N/M points. The host program assumes that all devices are of the same type (that is, 
the same binary can be used, but the code can be generalized to support different 
device types easily.


Software and Board Requirements
===============================

This design example is for use with the following versions of the 
Altera Complete Design Suite and Quartus(R) II software and
Altera SDK for OpenCL software:
    - 14.0 or later

For host program compilation, the requirements are:
    - Linux: GNU Make and gcc
    - Windows: Microsoft Visual Studio 2010

The supported operating systems for this release:
    - All operating systems supported by the Altera SDK for OpenCL


Usage Instructions
==================

Linux:
  1. make
  2. ./bin/vector_add

Windows:
  1. Build the project in Visual Studio 2010.
  2. Run (Ctrl+F5).

The output will include a wall-clock time of the OpenCL execution time
and the kernel time as reported by the OpenCL event profiling API. The host
program includes verification against the host CPU, printing out "PASS"
when the results match.

AOCX selection
--------------

The host program will use an AOCX file in the bin directory. If vector_add.aocx
exists, then that will be used. Otherwise, the host program will examine the device
name to extract the board name (which was passed as the --board argument to aoc)
and check for a vectorAdd_<board>_140.aocx file.

Package Contents and Directory Structure
========================================

/vector_add
  /device
     Contains OpenCL kernel source files (.cl)
  /host
    /src
      Contains host source (.cpp) files
  /bin
    Contains host binary and OpenCL binaries (.aocx)


Generating Kernel
=================

To compile the kernel, run:

  aoc device/vector_add.cl -o bin/vector_add.aocx --board <board>

where <board> matches the board you have in your system. If you are unsure
of the board name, use the following command to list available boards:

  aoc --list-boards

This compilation command can also be used to target the emulator by adding 
the -march=emulator flag.

If the board already has a AOCX file (see AOCX selection section above),
be sure to either replace or relocate that AOCX file.


Release History
===============

SDK Version   Example Version   Comments
-------------------------------------------------------------------------------
14.0          1.2               Update documentation for 14.0 release.
13.1          1.1               On Linux, fix possible compilation issues in 
                                AOCL_Utils by including <unistd.h>.
13.1          1.0               First release of example


Disclaimer & Licenses
=====================

Copyright (C) 2013-2014 Altera Corporation, San Jose, California, USA. All rights reserved. 
Permission is hereby granted, free of charge, to any person obtaining a copy of this 
software and associated documentation files (the "Software"), to deal in the Software 
without restriction, including without limitation the rights to use, copy, modify, merge, 
publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to 
whom the Software is furnished to do so, subject to the following conditions: 
The above copyright notice and this permission notice shall be included in all copies or 
substantial portions of the Software. 
 
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND 
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT 
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, 
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR 
OTHER DEALINGS IN THE SOFTWARE. 
 
This agreement shall be governed in all respects by the laws of the State of California and 
by the laws of the United States of America. 


Contacting Altera
=================

Although we have made every effort to ensure that this design example works
correctly, there might be problems that we have not encountered. If you have
a question or problem that is not answered by the information provided in 
this readme file or the example's documentation, please contact Altera(R) 
support.

http://www.altera.com/mysupport/

