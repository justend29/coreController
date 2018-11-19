 #!/bin/bash

# writes to the online file of each core to turn them on or off
# November 13, 2018

# command should be coreController numCores

#
#https://stackoverflow.com/questions/6481005/how-to-obtain-the-number-of-cpus-cores-in-linux-from-the-command-line

available_cores=$((`nproc --all`-1))
desired_cores=$(($1-1))

echo available cores $available_cores
echo desired cores $desired_cores

#loop through cores 1 through max. Skip core 0 as it's write protected and required
for core in `seq 1 $available_cores`; do
	echo current iteration $core
	if [ $core -lt $1 ]
	then
		echo 1 | sudo tee /sys/devices/system/cpu/cpu$core/online
	else
		echo 0 | sudo tee /sys/devices/system/cpu/cpu$core/online
	fi
done

echo available cores `nproc`
