#!/bin/bash

NTRIALS=10
MAXTRIAL=$(( $NTRIALS - 1 ))

for MODE in external inline
do
	for COMPILER in icc gcc
	do
		if [ -x ./timer_ovhd_${MODE}.${COMPILER}.exe ]
		then
			echo "Running $NTRIALS iterations of timer_ovhd_${MODE}.${COMPILER}.exe"
			rm -f log.test_${MODE}_${COMPILER}

			for ITER in `seq 0 $MAXTRIAL`
			do
				echo -n "$ITER "
				./timer_ovhd_${MODE}.${COMPILER}.exe >> log.test_${MODE}_${COMPILER}
			done
			echo ""
		else
			echo "executable ./timer_ovhd_${MODE}.${COMPILER}.exe not found, skipping...."
		fi
	done
done
