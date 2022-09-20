# Walkthrough
You must build the Linux driver against the version of the Linux kernel you have
installed. This will require the Linux kernel headers. After you've built the
driver you can install it in your system so that it loads at boot time. If the
driver is installed and there is a RIFFA 2.0.1 capable FPGA installed as well, 
the driver will detect it. Output in the system log will provide additional 
information. This makefile will also build and install the C/C++ native library.

so after cloning riffa go to the driver/linux dir >>> Ensure you have the kernel headers installed:
```
sudo make setup
```
This will attempt to install the kernel headers using your system's package
manager. You can skip this step if you've already installed the kernel headers.

Compile the driver and C/C++ library:
```
make
```

Install the driver and library:
```
sudo make install
```
The system will be configured to load the driver at boot time. The C/C++ library
will be installed in the default library path. The header files will be placed
in the default include path. You will want to reboot after you've installed for
the driver to be (re)loaded.

When compiling an application you should only need to include the <riffa.h> 
header file and link with -lriffa.

then after reboot there is two sample designs that are already done and you can use their respective files to program the fpga and test the riffa driver and pcie access through those designs which is stated as below:

## design no.1: riffa/fpga/altera/de5/DE5QGen1x8If64/

the .sof file and two bash files to reprogramm the fpga and do a hot reset on the device so the riffa driver recognizes and acceses the device are present in the /bit dir. 
```
you just need to run the reprogram.sh
```

(this is the early stage of the riffa and make files for our purpose has not yet been implemented.)


## design no.2: /riffa/fpga/altera/de5/DE5QGen2x8If128/

the .sof file and two bash files to reprogramm the fpga and do a hot reset on the device so the riffa driver recognizes and acceses the device are present in the /bit dir. 
```
you just need to run the reprogram.sh 
```

## make your own design

to make your own design you have to follow the documentation provided in the riffa/doc dir how ever th enable the hot reset capabnility of the device make sure to " make the device class to 0x00ff0000 '  


# riffa
RIFFA (Reusable Integration Framework for FPGA Accelerators) is a simple framework for communicating data from a host CPU to a FPGA via a PCI Express bus. The framework requires a PCIe enabled workstation and a FPGA on a board with a PCIe connector. RIFFA supports Windows and Linux, Altera and Xilinx, with bindings for C/C++, Python, MATLAB and Java.

On the software side there are two main functions: data send and data receive. These functions are exposed via user libraries in C/C++, Python, MATLAB, and Java. The driver supports multiple FPGAs (up to 5) per system. The software bindings work on Linux and Windows operating systems. Users can communicate with FPGA IP cores by writing only a few lines of code.

On the hardware side, users access an interface with independent transmit and receive signals. The signals provide transaction handshaking and a first word fall through FIFO interface for reading/writing data. No knowledge of bus addresses, buffer sizes, or PCIe packet formats is required. Simply send data on a FIFO interface and receive data on a FIFO interface. RIFFA does not rely on a PCIe Bridge and therefore is not subject to the limitations of a bridge implementation. Instead, RIFFA works directly with the PCIe Endpoint and can run fast enough to saturate the PCIe link.  Both the software and hardware interfaces have been greatly simplified. Details can be found on the hardware interface page.

RIFFA communicates data using direct memory access (DMA) transfers and interrupt signaling. This achieves high bandwidth over the PCIe link. In our tests we are able to saturate (or near saturate) the link in all our tests. We have implemented RIFFA on the AVNet Spartan LX150T, Xilinx ML605, and Xilinx VC707, as well as the Altera DE5-Net, DE4 and DE2i boards. The RIFFA distribution contains examples and guides for setting up designs on the three development boards listed above. In addition, this website has examples of how to access your design from all the software bindings. RIFFA has been tested on Fedora 13 & 17 (32/64 bit vers.) and Ubuntu Desktop 10.04 LTS & 12.04 LTS (32/64 bit vers.). RIFFA relies on a custom Linux kernel driver which is supported on Linux kernels 2.6.27+ (tested on versions between 2.6.32 - 3.3.0). The Windows driver is supported on: Windows 7 in both 32 bit and 64 bit variants
