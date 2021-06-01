mkdir "Results_EXP3"  # directory for storing all Results
mkdir "Stats_EXP3"   # directory for storing all Stats
mkdir "Trees_EXP3"    # directory for storing IR Trees


for min_sup in 0.4 0.5 # for each possible spatial minimum support
do
	for dist_thresh in 400 500 600 700 800 # for each possible spatial distance threshold
	do
		echo "Minimum Support: $min_sup"
		echo "Distance Threshold: $dist_thresh"

		# Result directory for a specific minimum support, distance threshold and number of slots
		mkdir "Results_EXP3/Result $min_sup $dist_thresh"
		# Stat directory for a specific minimum support, distance threshold and number of slots
		mkdir "Stats_EXP3/Stat $min_sup $dist_thresh"
		# Tree directory for a specific minimum support, distance threshold and number of slots
		mkdir "Trees_EXP3/Tree_${min_sup}_${dist_thresh}"
		
		location_file="Data_EXP3/data_loc.csv"  # location of the object files
		keyword_file="Data_EXP3/data_type.csv"  # location of the keyword files
		
		# get the number of lines in the file (this is number of objects)
		num_of_objects=`wc -l $location_file`               
		num_of_objects=`echo $num_of_objects | grep -o -E '^[0-9]+'` # wc also returns the filename, which we need to remove

		# location of the IR tree file
		ir_tree_file="Trees_EXP3/Tree_${min_sup}_${dist_thresh}/data_tree.txt"

		# write the configurations of this run to config.txt
		echo "41 2 $num_of_objects $location_file 10 $keyword_file 0 $ir_tree_file 1 $min_sup $dist_thresh" > config.txt
		# Run fraction-score 
		./Colocation

		# results are stored in result.txt, move it so that it is saved
		mv "result.txt" "Results_EXP3/Result $min_sup $dist_thresh/result.txt"
		# stats are stored in stat.txt, move it so that it is saved
		mv "stat.txt" "Stats_EXP3/Stat $min_sup $dist_thresh/stat.txt"
	done
done


for num_of_slot in 12  # for each possible number of slots
do
	for tmin_sup in 0.4 0.5 # for each possible temporal minimum support
	do
		for tdist_thresh in 3 # for each possible temporal distance threshold
		do
			echo "Number of slots: $num_of_slot"
			echo "Minimum Temporal Support: $tmin_sup"
			echo "Temporal Distance Threshold: $tdist_thresh"

			# Result directory for a specific minimum support, distance threshold and number of slots
			mkdir "Results_EXP3/Result $tmin_sup $tdist_thresh $num_of_slot"
  			# Stat directory for a specific minimum support, distance threshold and number of slots
			mkdir "Stats_EXP3/Stat $tmin_sup $tdist_thresh $num_of_slot"
			# Tree directory for a specific minimum support, distance threshold and number of slots
			mkdir "Trees_EXP3/Tree_${tmin_sup}_${tdist_thresh}_$num_of_slot"
			
			location_file="Data_EXP3/data_loc_$num_of_slot.csv"  # location of the object files
			keyword_file="Data_EXP3/data_type_$num_of_slot.csv"  # location of the keyword files
			
			# get the number of lines in the file (this is number of objects)
			num_of_objects=`wc -l $location_file`               
			num_of_objects=`echo $num_of_objects | grep -o -E '^[0-9]+'` # wc also returns the filename, which we need to remove

			# location of the IR tree file
			ir_tree_file="Trees_EXP3/Tree_${tmin_sup}_${tdist_thresh}_$num_of_slot/data_tree.txt"

			# write the configurations of this run to config.txt
			echo "41 2 $num_of_objects $location_file 10 $keyword_file 0 $ir_tree_file 1 $tmin_sup $tdist_thresh" > config.txt
			# Run fraction-score 
			./Colocation

			# results are stored in result.txt, move it so that it is saved
			mv "result.txt" "Results_EXP3/Result $tmin_sup $tdist_thresh $num_of_slot/result.txt"
			# stats are stored in stat.txt, move it so that it is saved
			mv "stat.txt" "Stats_EXP3/Stat $tmin_sup $tdist_thresh $num_of_slot/stat.txt"
		done
	done
done
