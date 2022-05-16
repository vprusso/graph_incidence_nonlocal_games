transpose_custom := function(A)
	local i,j,A_T;
	
	A_T := NullMat(Size(TransposedMat(A)),Size(A));
	
	for i in [1..Size(A)] do
		for j in [1..Size(TransposedMat(A))] do
			A_T[j][i] := A[i][j];
		od;
	od;
	
	return(A_T);
	end;;

commuting_relation := function(a,b);
	return a*b*a*b;
	end;;

z_commuting_relation := function(a,b);
	return a*b*a^-1*b^-1;
	end;;

# switch vertex labelling to vector in GF(2)
convert_to_mod := function(c)
	local i, cmod;
	# this vector will be the output
	cmod := Random(FullRowSpace(GF(2),Size(c)));

	# convert components to elements of Z/2Z
	for i in [1..Size(c)] do
		if c[i] = 0 then
			cmod[i] := 0*Z(2);
		else cmod[i] := Z(2)^0;
		fi;
	od;
	
	return cmod;;
	end;;

# switch vertex labelling from vector in GF(2)
convert_from_mod := function(cmod)
	local i, c;
	c := NullMat(1,Size(cmod))[1];
	for i in [1..Size(cmod)] do
		if cmod[i] = 0*Z(2) then
			c[i] := 0;
		else c[i] := 1;
		fi;
	od;
	return c;;
	end;;

convert_matrix_to_mod := function(A)
	local i;
	for i in [1..Size(A)] do
		A[i] := convert_to_mod(A[i]);
	od;
	return(A);;
	end;;

#alternative to previous function
convert_matrix_to_mod2:= function(A)
	local i, OUT;
	OUT := [];
	for i in [1..Size(A)] do
		Append(OUT,[convert_to_mod(A[i])]);
	od;
	return(OUT);;
	end;;

convert_matrix_from_mod:= function(A)
	local i;
	for i in [1..Size(A)] do
		A[i] := convert_from_mod(A[i]);
	od;
	return(A);;
	end;;

# returns codimension of column space
codim_col := function(A)
	local codim, A_mod, LeftNull,out_boolean;
	A_mod := convert_matrix_to_mod(A);
	codim := Size(A)-RankMat(A_mod);
	convert_matrix_from_mod(A);
	return codim;
	end;;
remove_duplicate_rows := function(A)
	local i, init_matrix;
	
	init_matrix:=(A);
	A := Set(A);
	
	if Size(A) <> Size(init_matrix) and verbose = true then
		Print("Current state after remove_duplicate_rows:\n\n");	
		Print("-------------------------------------\n");
		for i in [1..Size(A)] do
			Print(A[i],"\n");
		od;
		Print("-------------------------------------\n\n");
	fi;
	
	# determine if changed based on size of initial and final matrices
	# instead of direct comparison, because the operation of A := Set(A)
	# can reorder the rows of the matrix A
	return [A, Size(A) <> Size(init_matrix)];;
	end;;

remove_duplicate_cols := function(A)
	local i, init_matrix;
	
	init_matrix:=transpose_custom(A);
	A := Set(TransposedMat(A));
	
	if Size(A) <> Size(init_matrix) and verbose = true then
		Print("Current state after remove_duplicate_rows:\n\n");	
		Print("-------------------------------------\n");
		for i in [1..Size(A)] do
			Print(A[i],"\n");
		od;
		Print("-------------------------------------\n\n");
	fi;
	
	# determine if changed based on size of initial and final matrices
	# instead of direct comparison, because the operation of A := Set(A)
	# can reorder the rows of the matrix A
	return [Set(TransposedMat(A)), Size(A) <> Size(init_matrix)];;
	end;;

# checks for completeness of matrix columnsapce 
is_complete_col_nullmethod := function(A)
	local A_mod, LeftNull,out_boolean;
	A_mod := convert_matrix_to_mod(A);
	LeftNull := NullspaceMat(A);
	if LeftNull <> [] then
		out_boolean  := false;
		LeftNull := VectorSpace(Integers mod 2, LeftNull);
	else out_boolean := true; fi;
	A := convert_matrix_from_mod(A_mod);
	return out_boolean;;
	end;;

is_complete_col_rankmethod := function(A)
	local A_mod, LeftNull,out_boolean;
	A_mod := convert_matrix_to_mod(A);
	if verbose then
		Print("The rank is: ", RankMat(A_mod)," the rows: ", Size(A), " and the columns ", Size(TransposedMat(A)),"\n");
	fi;
	return RankMat(A_mod) >= Size(A);;
	A := convert_matrix_from_mod(A_mod);
	end;;
