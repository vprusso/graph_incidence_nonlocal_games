# Find all 9 vertex graphs (up to isomorphism) 
# that can be obtained from the Petersen graph
# by edge contraction 

print('Generating subgraphs using edge CONTRACTION')
vertex_pairs = Combinations([0,1,2,3,4,5,6,7,8,9],2); 

pet=graphs.PetersenGraph();

# contract each pair of vertices and generate corresponding subgraph
sub_graphs=[]
for v in vertex_pairs:
    if pet.distance(v[0],v[1])==1:
        pet_sub=graphs.PetersenGraph();
        pet_sub.merge_vertices(v);
        sub_graphs.append(pet_sub);
        
# keep one representative of each isomorphism class of the sub graphs
unique_sub_graphs=[];
for i in range(0,len(sub_graphs)):
    already_in_list=false;
    for j in range(0,len(unique_sub_graphs)):
        if sub_graphs[i].is_isomorphic(unique_sub_graphs[j]):
            already_in_list=true;
    if not already_in_list:
        unique_sub_graphs.append(sub_graphs[i]);

print('Found ' + str(len(unique_sub_graphs)) + ' subgraphs up to isomorphism')
print('incidence matrix: ')
print(unique_sub_graphs[0].incidence_matrix())
print(' ')


# Find all 10 vertex graphs (up to isomorphism)
# that can be obtained from the Petersen graph
# by deleting a single edge
print('Generating subgraphs using edge DELETION')

# edges of the Petersen graph
edges=graphs.PetersenGraph().edges();

# start with Petersen graph, delete an edge, record result
sub_graphs=[]
for i in range(0,len(edges)):
    pet_sub=graphs.PetersenGraph();
    pet_sub.delete_edge(edges[i]);
    sub_graphs.append(pet_sub)

# only keep graphs that are unique up to isomorphism
unique_sub_graphs=[];
for i in range(0,len(sub_graphs)):
    already_in_list=false;
    for j in range(0,len(unique_sub_graphs)):
        if sub_graphs[i].is_isomorphic(unique_sub_graphs[j]):
            already_in_list=true;
    if not already_in_list:
        unique_sub_graphs.append(sub_graphs[i])
print(unique_sub_graphs)
print('Found ' + str(len(unique_sub_graphs)) + ' subgraphs up to isomorphism')
print('incidence matrix:')

# there is only one isomorphism class, hence any graph in the list is a suitable representative
if len(unique_sub_graphs) ==1:
	print(sub_graphs[1].incidence_matrix())
