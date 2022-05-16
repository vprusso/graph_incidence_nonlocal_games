# first generate graphs on 1 to 9 vertices that are cubic
gr_list=[];
for n in range(1,10):
	for g in graphs(n):
		if g.is_regular(3):
			print(g.incidence_matrix())
			print(" ")
			gr_list.append(g)
			
# Use different method for 10 vertex (too slow for other method)
for g in graphs.nauty_geng("10 -d3 -D3"):
	if not g.is_isomorphic(graphs.PetersenGraph()):
		print(g.incidence_matrix())
		print(" ")
		gr_list.append(g)

unique_cubic_graphs=[];
for i in range(0,len(gr_list)):
    already_in_list=false;
    for j in range(0,len(unique_cubic_graphs)):
        if gr_list[i].is_isomorphic(unique_cubic_graphs[j]):
            already_in_list=true;
    if not already_in_list:
        unique_cubic_graphs.append(gr_list[i]);

print("A total of " + str(len(unique_cubic_graphs)) + " graphs were found. \nThis list consists of all cubic graphs on at most 10 vertices, excluding the Petersen graph.")
