# rpiaprsinstaller

This bash shell script is intended to install Ionosphere from https://github.com/cceremuga/ionosphere onto a raspberry pi.

It installs rtl-sdr and multimon-ng from source, and go from a binary distribution.

Then ionosphere is compiled. A directory "logs" is created for ionosphere to log to. 

The path changes made in the script do not persist after the script is terminated.

# Running the script

To clone and run the script

```
sudo apt-get install git -y
git clone https://github.com/g7gpr/rpiaprsinstaller 
cd rpiaprsinstaller
./aprs.sh
```
