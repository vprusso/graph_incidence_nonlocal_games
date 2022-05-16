# tests if the generator of the solution group corresponding to hyperedge is trivial
trivial_hyper_element := function(G,A,R)
	local gens;
	gens := GeneratorsOfGroup(G);
	return (ReducedForm(R,UnderlyingElement(gens[Size(TransposedMat(A))])) = ReducedForm(R,UnderlyingElement(Identity(G))));
	end;;

# given an incidence matrix and vertex labelling, check if soln group is finite
check_if_finite := function(A)
	local P,G,R,b;
	b := NullMat(1,Size(A))[1];
	P := BCS_presentation(A,b);
	G := P[1]/P[2];
	R := KBMAGRewritingSystem(G);
	OptionsRecordOfKBMAGRewritingSystem(R).maxwdiffs :=1000000;
	OptionsRecordOfKBMAGRewritingSystem(R).maxeqns := KB_max;
	OptionsRecordOfKBMAGRewritingSystem(R).maxstates := 1000000;
	SetOrderingOfKBMAGRewritingSystem(R,conf_kb_order);
	KnuthBendix(R);
	return(Size(R));
	end;;

check_desc := function(A,b)
	local P,G,R;

	P := BCS_presentation(A,b);
	G := P[1]/P[2];
	return(StructureDescription(G));
	end;;

check_ID := function(A,b)
	local P,G,R;

	P := BCS_presentation(A,b);
	G := P[1]/P[2];
	return(IdGroup(G));
	end;;
