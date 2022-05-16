KB_ALGORITHM := function(BCS_output,KB_max)
	local mhom, mon, G, t, R;
	# Quotient free group by necessary relations
	G := BCS_output[1]/BCS_output[2];

	# Map to a monoid
	mhom := IsomorphismFpMonoid(G);
	mon:=Image(mhom);
	
	R := KBMAGRewritingSystem(G);;

	
	OptionsRecordOfKBMAGRewritingSystem(R).maxwdiffs :=(9000000);
	OptionsRecordOfKBMAGRewritingSystem(R).maxstates :=(9000000);
	OptionsRecordOfKBMAGRewritingSystem(R).maxeqns := KB_max;
	
	SetOrderingOfKBMAGRewritingSystem(R,conf_kb_order);	
	
	t := -Runtime();
	KnuthBendix(R);;
	
	return([GeneratorsOfGroup(BCS_output[1]),R,G]);
	end;;

# tests if RWS is confluent and has fewer than max equations
conf_test := function(R, KB_max);	
	if IsConfluent(R) = true and Size(Rules(R)) < KB_max then
		return(1);
		else return(0);
	fi;
	end;;

outname:= "~/confluent_rewriting_systems/gapcode/raw_kb_output/";

# basic version of confluency testing 
find_if_conf := function(A,c,eqnmax,dirname)
	local BCS_output, KB_output, A_pruned, G, R,
          perfect_classical_count, perfect_quantum_count, non_perfect_quantum_count;
	# Create solution group.
	BCS_output := BCS_presentation(A,c);
	G := BCS_output[1]/BCS_output[2];
	# Run Knuth-Bendix algorithm.
	KB_output := KB_ALGORITHM(BCS_output, eqnmax);
	R := KB_output[1];
	PrintTo(Concatenation(outname,"/",dirname,"/","std_",String(Size(Rules(R)))),Rules(R));
	return(IsConfluent(R));
end;


