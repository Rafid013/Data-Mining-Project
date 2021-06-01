mkdir "Results_EXP1"  # directory for storing all Results
mkdir "Stats_EXP1"   # directory for storing all Stats
mkdir "Trees_EXP1"    # directory for storing IR Trees

for num_of_slot in 4 5 6 7 8 9 10 11 12  # for each possible number of slots
do
	for min_sup in 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 # for each possible minimum support
	do
		for dist_thresh in 400 500 600 700 800 900 1000 # for each possible distance threshold
		do
			echo "Number of slots: $num_of_slot"
			echo "Minimum Support: $min_sup"
			echo "Distance Threshold: $dist_thresh"

			# Result directory for a specific minimum support, distance threshold and number of slots
			mkdir "Results_EXP1/Result $min_sup $dist_thresh $num_of_slot"
  			# Stat directory for a specific minimum support, distance threshold and number of slots
			mkdir "Stats_EXP1/Stat $min_sup $dist_thresh $num_of_slot"
			# Tree directory for a specific minimum support, distance threshold and number of slots
			mkdir "Trees_EXP1/Tree_${min_sup}_${dist_thresh}_$num_of_slot"
			# for each slot
			for ((i=0;i<$num_of_slot;i++)) 	
			do
				echo "Running for slot $i of total $num_of_slot slots"
				location_file="Slot_Data/data_loc_${i}_$num_of_slot.csv"  # location of the object files
				keyword_file="Slot_Data/data_type_${i}_$num_of_slot.csv"  # location of the keyword files
				# get the number of lines in the file (this is number of objects)
				num_of_objects=`wc -l $location_file`               
				num_of_objects=`echo $num_of_objects | grep -o -E '^[0-9]+'` # wc also returns the filename, which we need to remove

				# location of the IR tree file
				ir_tree_file="Trees_EXP1/Tree_${min_sup}_${dist_thresh}_$num_of_slot/data_tree_$i.txt"

				# write the configurations of this run to config.txt
				echo "41 2 $num_of_objects $location_file 10 $keyword_file 0 $ir_tree_file 5 $min_sup $dist_thresh" > config.txt
				# Run fraction-score 
				./Colocation

				# results are stored in result.txt, move it so that it is saved
				mv "result.txt" "Results_EXP1/Result $min_sup $dist_thresh $num_of_slot/result_$i.txt"
				# stats are stored in stat.txt, move it so that it is saved
				mv "stat.txt" "Stats_EXP1/Stat $min_sup $dist_thresh $num_of_slot/stat_$i.txt"
			done
		done
	done
done
