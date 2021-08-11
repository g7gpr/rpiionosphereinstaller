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

# After the script has completed

You will need to run the following commands to add the paths 

```
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
'''

edit aprs/ionosphere/config/config.yml to suit. Key points are the frequency, callsign and passcode


Logout and login, and you should be able to excute

```
ionosphere
```
