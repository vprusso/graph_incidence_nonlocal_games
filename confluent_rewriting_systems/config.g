LoadPackage("kbmag");
verbose := false;
SetInfoLevel(InfoRWS,2);
conf_kb_order := "recursive";
KB_max := 2000;

Read(Filename(DirectoryHome(),"confluent_rewriting_systems/matrix_utils.g"));
Read(Filename(DirectoryHome(),"confluent_rewriting_systems/solution_group_utils/BCS_Presentation.g"));
Read(Filename(DirectoryHome(),"confluent_rewriting_systems/core_functions.g"));
Read(Filename(DirectoryHome(),"confluent_rewriting_systems/incidence_matrices.g"));
Read(Filename(DirectoryHome(),"confluent_rewriting_systems/solution_group_utils/kb_alg.g"));
Read(Filename(DirectoryHome(),"confluent_rewriting_systems/solution_group_utils/group_utils.g"));

