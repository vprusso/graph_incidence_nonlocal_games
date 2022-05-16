BCS_presentation := function(A,c)
	local dims,m,n,F,J,constraint_list,constraint_elements,gens,i,j,k,l,boolflag;
	
	dims := DimensionsMat(A);
	m := dims[1]; # number of equations
	n := dims[2]; # number of edges
	
	# include extra generator for the J element
	F := FreeGroup( n + 1);
	J := F.(n+1);
	gens := GeneratorsOfGroup(F);
	
	# begin constructing constraints
	constraint_list := [];
	
	# make all elements idempotent and make J commute with everything
	Append(constraint_list,[J^2]);
	
	for i in [1..n] do
		Append(constraint_list,[gens[i]^2]);
		Append(constraint_list,[commuting_relation(gens[i],J)]);	
	od;	

	# add in linear constraints
	for i in [1..m] do
		# first get a list of all elements in the constraint
		constraint_elements := [];
		for j in [1..n] do 
			if A[i][j] =1 then
				Append(constraint_elements,[gens[j]]);
			fi;
		od;
		
		# add in commuting relations --- some will be redundant
		# removed later by KB algorithm
		for k in [1..Length(constraint_elements)] do
			for l in [k+1..Length(constraint_elements)] do
				Append(constraint_list,[commuting_relation(constraint_elements[k],constraint_elements[l])]);
			od;
		od;
	# boolean variable, checks if constraint_elements is empty
	boolflag := (constraint_elements=[]);
	# add in the linear constraint
		if boolflag = false then
			if c[i]=1 then
				Append(constraint_list, [Product(constraint_elements,J)]);
			else
				Append(constraint_list, [Product(constraint_elements)]);
			fi;
		fi;
	
	od;
	
	# output presentation and constraints
	return [F, constraint_list];
	end;;

BCS_NO_j_presentation := function(A,c)
	local dims,m,n,F,J,constraint_list,constraint_elements,gens,i,j,k,l,boolflag;
	
	dims := DimensionsMat(A);
	m := dims[1]; # number of equations
	n := dims[2]; # number of edges
	
	# include extra generator for the J element
	F := FreeGroup( n + 1);
	J := F.(n+1);
	gens := GeneratorsOfGroup(F);
	
	# begin constructing constraints
	constraint_list := [];
	Append(constraint_list,[J]);	
	# make all elements idempotent and make J commute with everything
	Append(constraint_list,[J^2]);
	
	for i in [1..n] do
		Append(constraint_list,[gens[i]^2]);
		Append(constraint_list,[commuting_relation(gens[i],J)]);	
	od;	

	# add in linear constraints
	for i in [1..m] do
		# first get a list of all elements in the constraint
		constraint_elements := [];
		for j in [1..n] do 
			if A[i][j] =1 then
				Append(constraint_elements,[gens[j]]);
			fi;
		od;
		
		# add in commuting relations --- some will be redundant
		# removed later by KB algorithm
		for k in [1..Length(constraint_elements)] do
			for l in [k+1..Length(constraint_elements)] do
				Append(constraint_list,[commuting_relation(constraint_elements[k],constraint_elements[l])]);
			od;
		od;
	# boolean variable, checks if constraint_elements is empty
	boolflag := (constraint_elements=[]);
	# add in the linear constraint
		if boolflag = false then
			if c[i]=1 then
				Append(constraint_list, [Product(constraint_elements,J)]);
			else
				Append(constraint_list, [Product(constraint_elements)]);
			fi;
		fi;
	
	od;
	
	# output presentation and constraints
	return [F, constraint_list];
	end;;

cyclic_BCS := function(A,c)
	local dims,m,n,F,J,constraint_list,constraint_elements,gens,i,j,k,l,temp_list,tmp;
	
	dims := DimensionsMat(A);
	m := dims[1]; # number of equations
	n := dims[2]; # number of edges
	

	# include extra generator for the J element
	F := FreeGroup( n + 1);
	J := F.(n+1);
	gens := GeneratorsOfGroup(F);
	
	# begin constructing constraints
	constraint_list := [];
	
	# make all elements idempotent and make J commute with everything
	Append(constraint_list,[J^2]);
	
	for i in [1..n] do
		Append(constraint_list,[gens[i]^2]);
		Append(constraint_list,[commuting_relation(gens[i],J)]);	
	od;	

	# add in linear constraints
	for i in [1..m] do
		# first get a list of all elements in the constraint
		constraint_elements := [];
		for j in [1..n] do 
			if A[i][j] =1 then
				Append(constraint_elements,[gens[j]]);
			fi;
		od;
		temp_list := PermutationsList(constraint_elements);
		
		for k in [1..Length(temp_list)] do
			Append(constraint_list,[(J^c[i])*Product(temp_list[k])]);
		od;
	od;
	return [F, constraint_list];
	end;;
Z_BCS_presentation := function(A,c)
	local dims,m,n,F,J,constraint_list,constraint_elements,gens,i,j,k,l,boolflag,commList;
	commList := [];	
	dims := DimensionsMat(A);
	m := dims[1]; # number of equations
	n := dims[2]; # number of edges
	
	# include extra generator for the J element
	F := FreeGroup( n + 1);
	J := F.(n+1);
	gens := GeneratorsOfGroup(F);
	
	# begin constructing constraints
	constraint_list := [];
	
	# make all elements idempotent and make J commute with everything
#	Append(constraint_list,[J^2]);
	
	for i in [1..n] do
#		Append(constraint_list,[gens[i]^2]);
		Append(constraint_list,[z_commuting_relation(gens[i],J)]);	
	od;	

	# add in linear constraints
	for i in [1..m] do
		# first get a list of all elements in the constraint
		constraint_elements := [];
		for j in [1..n] do 
			if A[i][j] =1 then
				Append(constraint_elements,[gens[j]]);
			fi;
			if A[i][j] =-1 then
				Append(constraint_elements,[gens[j]^-1]);
			fi;
		od;
		
		# add in commuting relations --- some will be redundant
		# removed later by KB algorithm
		for k in [1..Length(constraint_elements)] do
			for l in [k+1..Length(constraint_elements)] do
				Append(constraint_list,[commuting_relation(constraint_elements[k],constraint_elements[l])]);
			od;
		od;
	# boolean variable, checks if constraint_elements is empty
	boolflag := (constraint_elements=[]);
	# add in the linear constraint
		Append(constraint_list, [Product(constraint_elements,J^(-1*c[i]))]);
	od;
	
	# output presentation and constraints
	return [F, constraint_list];
	end;;
#semigroupZ := function(A,c)
#	local dims,m,n,F,J,constraint_list,constraint_elements,gens,i,j,k,l,boolflag;
#	
#	dims := DimensionsMat(A);
#	m := dims[1]; # number of equations
#	n := dims[2]; # number of edges
#	
#	# include extra generator for the J element
#	F := FreeSemigroup( n + 1);
#	J := F.(n+1);
#	gens := GeneratorsOfSemigroup(F);
#	
#	# begin constructing constraints
#	constraint_list := [];
#	
#	# make all elements idempotent and make J commute with everything
##	Append(constraint_list,[J^2]);
#	
#	for i in [1..n] do
#		Append(constraint_list,[gens[i]^2]);
#		Append(constraint_list,[z_commuting_relation(gens[i],J)]);	
#	od;	
#
#	# add in linear constraints
#	for i in [1..m] do
#		# first get a list of all elements in the constraint
#		constraint_elements := [];
#		for j in [1..n] do 
#			if A[i][j] =1 then
#				Append(constraint_elements,[gens[j]]);
#			fi;
#			if A[i][j] =-1 then
#				Append(constraint_elements,[gens[j]^-1]);
#			fi;
#		od;
#		
#		# add in commuting relations --- some will be redundant
#		# removed later by KB algorithm
#		for k in [1..Length(constraint_elements)] do
#			for l in [k+1..Length(constraint_elements)] do
#				Append(constraint_list,[z_commuting_relation(constraint_elements[k],constraint_elements[l])]);
#			od;
#		od;
#	# boolean variable, checks if constraint_elements is empty
#	boolflag := (constraint_elements=[]);
#	# add in the linear constraint
#		Append(constraint_list, [Product(constraint_elements,J^(-1*c[i]))]);
#	od;
#	
#	# output presentation and constraints
#	return [F, constraint_list];
#	end;;
