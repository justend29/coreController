 #!/bin/bash

# writes to the online file of each core to turn them on or off
# Dec 8, 2018

# command should be coreController numCores

#
#https://stackoverflow.com/questions/6481005/how-to-obtain-the-number-of-cpus-cores-in-linux-from-the-command-line

available_cores=`nproc --all`
desired_cores=$1

echo Available cores: $available_cores
echo -e Desired cores: $desired_cores

echo core 1 status: 1 # print out a 1 for the required first core
#loop through cores 1 through max. Skip core 0 as it's write protected and required
for core in `seq 1 $(($available_cores-1))`; do
	printf "%s%d%s" "core " $core " status: "
	if [ $core -lt $1 ]
	then
		echo 1 | sudo tee /sys/devices/system/cpu/cpu$core/online
	else
		echo 0 | sudo tee /sys/devices/system/cpu/cpu$core/online
	fi
done

echo Checking available cores...
echo Available cores: `nproc`
echo Done.
