import numpy as np
from scipy.interpolate import interp1d

cs = np.load("CS2000_reference.npy")
usb = np.load("USB2000_reference.npy")
res = np.load("spectrum_correction.npy")

device_data_file_path       =  "USB2000_reference.npy"
reference_data_file_path    =  "CS2000_reference.npy"

#LoadFiles
device_data_file    = np.load(device_data_file_path)
reference_data_file = np.load(reference_data_file_path)
#LoadFiles---------------------------------------------

#get data and abscice
device_absc = device_data_file[:,0]
device_data = device_data_file[:,1:]

reference_absc = reference_data_file[:,0]
reference_data = reference_data_file[:,1:]

correction_absc_mask = np.logical_and(
        device_absc>reference_absc[0],
        device_absc<reference_absc[-1])

correction_absc = device_absc[correction_absc_mask]

device_absc = device_absc[correction_absc_mask]
device_data = device_data[correction_absc_mask]
#get data and abscice----------------------------------------

#Mean
device_mean_data = np.mean(device_data, axis=1)
reference_mean_data = np.mean(reference_data, axis=1)
##Mean------------------------------------------

#Interpolation
reference_interpolated_data = interp1d(
    reference_absc,
    reference_mean_data,
    kind="cubic",
    fill_value='extrapolate')(
        correction_absc)
#Interpolation------------------------------------


correction_data = reference_interpolated_data / device_mean_data


# DEBUG PLOT
import matplotlib.pyplot as plt

##-In
#plt.xlim(400,800)
#plt.plot(res[:,0],res[:,1])
#plt.show()
#
#plt.xlim(400,800)
#plt.plot(cs[:,0],cs[:,1])
#plt.show()
#
#plt.xlim(400,800)
#plt.plot(cs[:,0],cs[:,1])
#plt.plot(usb[:,0],usb[:,1])
#plt.show()


##-Mean
#plt.xlim(400,800)
#plt.plot(cs[:,0],reference_mean_data)
#plt.show()
#
#plt.xlim(400,800)
#plt.plot(usb[:,0],device_mean_data)
#plt.plot(cs[:,0],reference_mean_data)
#plt.show()
#
##-Interpolated
#plt.xlim(400,800)
#plt.ylim(-1,2)
#plt.plot(correction_absc,reference_interpolated_data)
#plt.plot(reference_absc,reference_mean_data, linestyle='--')
#plt.show()

#Correction
plt.xlim(400,800)
plt.ylim(-0.0001,0.0002)
plt.plot(correction_absc,correction_data)
plt.show()

plt.xlim(400,800)
plt.ylim(0,55000)
plt.plot(correction_absc,1/correction_data)
plt.show()
