"""Calculate the incidence group of a graph."""

def incidence_group(graph,
                    is_coloured=True,
                    is_homogenous_group=False,
                    return_permutation_group=False):
    """
    Incidence group.

    The input to the function is either a Sage `Graph` object or an incidence
    matrix that corresponds to a graph.

    :param graph:
    :param is_coloured:
    :param is_homogenous_group:
    :param return_permutation_group:
    :return: The incidence group of `G` as either a permutation group
             or as a finitely presented group.
    """
    # If the input is given as an incidence matrix, just use this.
    if isinstance(graph, sage.graphs.graph.Graph):
        mat = graph.incidence_matrix()

    # If the input is given as a Sage graph object, convert to its incidence
    # matrix representation.
    elif isinstance(graph, sage.matrix.matrix_integer_sparse.Matrix_integer_sparse):
        mat = graph
    else:
        msg = """
        Error: Input should either be a Sage graph or specified as an
        incidence matrix.
        """
        raise ValueError(msg)

    num_cols = mat.ncols()

    # For every edge, define a list of generators. Append the central
    # generator, J, unless the homogenous flag is True.
    gens = [var("x%d" % i) for i in range(num_cols)]
    if is_homogenous_group is False:
        gens.append(var("J"))

    # Generate the free group on the edge set generators.
    free_group = FreeGroup(gens)

    # Create a list of the edge generators that share vertices.
    vertex_relations = [
        [i+1 for i in range(len(r)) if list(r)[i] == 1]
        for r in list(mat.rows())]

    # If `is_coloured` is True, insert the J relation into the vertex
    # relations.
    if not is_homogenous_group and is_coloured:
        vertex_relations[0].append(num_cols+1)

    # Generate a list of product relations.
    product_relations = [free_group(p) for p in vertex_relations]

    # Create a list of commuting relations this list also contains the
    # involution relations.
    commuting_relations = []
    for relation in vertex_relations:
        for i in relation:
            for j in relation:
                commuting_relations.append(free_group([i, j, -i, -j]))

    # Involution relations.
    if not is_homogenous_group:
        for i in range(num_cols+1):
            commuting_relations.append(free_group([i+1, i+1]))
    else:
        for i in range(num_cols):
            commuting_relations.append(free_group([i+1, i+1]))

    # Append j^2 relation (if required).
    if not is_homogenous_group:
        for i in range(num_cols):
            commuting_relations.append(free_group([i+1, num_cols+1, -i-1, -num_cols-1]))

    # Combine lists of relations.
    relations = commuting_relations + product_relations

    # Remove any trivial relations.
    while free_group.one() in relations:
        relations.remove(free_group.one())

    # Create the group via quotient by relations.
    incidence_group = free_group.quotient(relations)

    # Check for whether the user specified return to be
    # a permutation group.
    if return_permutation_group:
        # Return incidence group as a permutation group.
        return incidence_group.as_permutation_group()
    else:
        # Return incidence group as a finitely presented group.
        return incidence_group

