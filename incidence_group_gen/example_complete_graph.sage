from incidence_group_gen import incidence_group


# As an example, calculate the incidence graph for the K_5 complete graph.
graph = graphs.CompleteGraph(5)
print(incidence_group(graph))
