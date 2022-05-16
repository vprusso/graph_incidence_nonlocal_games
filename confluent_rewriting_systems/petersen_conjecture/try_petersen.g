Read(Filename(DirectoryHome(),"confluent_rewriting_systems/config.g"));
pet_inc_mat:=[[1,1,1,0,0,0,0,0,0,0,0,0,0,0,0],[1,0,0,1,1,0,0,0,0,0,0,0,0,0,0],[0,0,0,1,0,1,1,0,0,0,0,0,0,0,0],[0,0,0,0,0,1,0,1,1,0,0,0,0,0,0],[0,1,0,0,0,0,0,1,0,1,0,0,0,0,0],[0,0,1,0,0,0,0,0,0,0,1,1,0,0,0],[0,0,0,0,1,0,0,0,0,0,0,0,1,1,0],[0,0,0,0,0,0,1,0,0,0,1,0,0,0,1],[0,0,0,0,0,0,0,0,1,0,0,1,1,0,0],[0,0,0,0,0,0,0,0,0,1,0,0,0,1,1]];


conf_found:=false;
while not conf_found do
	R:=calculate_rewriting_system(pet_inc_mat,[0,0,0,0,0,0,0,0,0,0]);
	shf_order:=Shuffle([1..16]);
	SetOrderingOfKBMAGRewritingSystem(R,"wreathprod",shf_order);
	O := OptionsRecordOfKBMAGRewritingSystem( R );
	O.maxeqns:=100; 
	
	MakeConfluent(R);

	conf_found:=IsConfluent(R);
od;
