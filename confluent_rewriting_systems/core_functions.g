# create solution group for linear system A x = c
calculate_solution_group := function(A,c)
	local pres;
	
	# get BCS presentation of group
	pres := BCS_presentation(A,c);

	# construct group as quotient
	return pres[1]/pres[2];
	end;;

# create solution group for homogeneous linear system A x = 0
calculate_homogeneous_solution_group := function(A,c)
	local pres;
	
	# get BCS presentation of group
	pres := BCS_NO_j_presentation(A,c);

	# construct group as quotient
	return pres[1]/pres[2];
	end;;

# create rewriting system for linear system A x = c
# set ordering of rewriting system to recursive
calculate_rewriting_system := function(A,c)
	local G,R;
	
	if Sum(c) = 0 then
		Print("Note system is homogeneous, setting J = identity");
		G := calculate_homogeneous_solution_group(A,c);
	else 
		G := calculate_solution_group(A,c);
	fi;
	R := KBMAGRewritingSystem(G);
	SetOrderingOfKBMAGRewritingSystem(R,"recursive");
	return R;
	end;;

# checks if a rewriting system is finite
# only relevant if rewriting system is confluent
is_rewriting_system_finite := function(R);
	if IsConfluent(R) then
		Print("Rewriting system is of size: ", Size(R));
	else
		Print("Only relevant if rewriting system is confluent.");
	fi;
	end;;
