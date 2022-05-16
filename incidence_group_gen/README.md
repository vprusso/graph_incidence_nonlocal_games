# incidence_group_gen

Given a graph or incidence matrix that corresponds to a graph, determine the incidence group of the graph as either a permutation group or as a finitely presented group.

### Usage

In order to import the `incidence_group` function from `incidence_group_gen.py`
we will need to use the `preparse` argument to Sage to generate a Python file
that can be imported into external Sage files.

    $ sage -preparse incidence_group_gen.sage 
    $ mv incidence_group_gen.sage.py incidence_group_gen.py

We can then import the function `incidence_group` into an external Sage file as:

    from incidence_group_gen import incidence_group

### Examples

#### The incidence group of the complete graph

We can determine the incidence group of the complete graph on some 
pre-specified number of nodes. For instance, `example_complete_graph.sage`
allows us to calculate the incidence group of the complete graph with
five nodes.

Assuming you have preparsed the `incidence_group_gen.sage` as show in the Usage
section, you can run the following command:

    >>> sage example_complete_graph.sage
    Finitely presented group < x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, J |
    x0*x1*x0^-1*x1^-1, x0*x2*x0^-1*x2^-1, x0*x3*x0^-1*x3^-1, x0*J*x0^-1*J^-1,
    x1*x0*x1^-1*x0^-1, x1*x2*x1^-1*x2^-1, x1*x3*x1^-1*x3^-1, x1*J*x1^-1*J^-1,
    x2*x0*x2^-1*x0^-1, x2*x1*x2^-1*x1^-1, x2*x3*x2^-1*x3^-1, x2*J*x2^-1*J^-1,
    x3*x0*x3^-1*x0^-1, x3*x1*x3^-1*x1^-1, x3*x2*x3^-1*x2^-1, x3*J*x3^-1*J^-1,
    J*x0*J^-1*x0^-1, J*x1*J^-1*x1^-1, J*x2*J^-1*x2^-1, J*x3*J^-1*x3^-1,
    x0*x4*x0^-1*x4^-1, x0*x5*x0^-1*x5^-1, x0*x6*x0^-1*x6^-1, x4*x0*x4^-1*x0^-1,
    x4*x5*x4^-1*x5^-1, x4*x6*x4^-1*x6^-1, x5*x0*x5^-1*x0^-1, x5*x4*x5^-1*x4^-1,
    x5*x6*x5^-1*x6^-1, x6*x0*x6^-1*x0^-1, x6*x4*x6^-1*x4^-1, x6*x5*x6^-1*x5^-1,
    x1*x4*x1^-1*x4^-1, x1*x7*x1^-1*x7^-1, x1*x8*x1^-1*x8^-1, x4*x1*x4^-1*x1^-1,
    x4*x7*x4^-1*x7^-1, x4*x8*x4^-1*x8^-1, x7*x1*x7^-1*x1^-1, x7*x4*x7^-1*x4^-1,
    x7*x8*x7^-1*x8^-1, x8*x1*x8^-1*x1^-1, x8*x4*x8^-1*x4^-1, x8*x7*x8^-1*x7^-1,
    x2*x5*x2^-1*x5^-1, x2*x7*x2^-1*x7^-1, x2*x9*x2^-1*x9^-1, x5*x2*x5^-1*x2^-1,
    x5*x7*x5^-1*x7^-1, x5*x9*x5^-1*x9^-1, x7*x2*x7^-1*x2^-1, x7*x5*x7^-1*x5^-1,
    x7*x9*x7^-1*x9^-1, x9*x2*x9^-1*x2^-1, x9*x5*x9^-1*x5^-1, x9*x7*x9^-1*x7^-1,
    x3*x6*x3^-1*x6^-1, x3*x8*x3^-1*x8^-1, x3*x9*x3^-1*x9^-1, x6*x3*x6^-1*x3^-1,
    x6*x8*x6^-1*x8^-1, x6*x9*x6^-1*x9^-1, x8*x3*x8^-1*x3^-1, x8*x6*x8^-1*x6^-1,
    x8*x9*x8^-1*x9^-1, x9*x3*x9^-1*x3^-1, x9*x6*x9^-1*x6^-1, x9*x8*x9^-1*x8^-1,
    x0^2, x1^2, x2^2, x3^2, x4^2, x5^2, x6^2, x7^2, x8^2, x9^2, J^2,
    x0*J*x0^-1*J^-1, x1*J*x1^-1*J^-1, x2*J*x2^-1*J^-1, x3*J*x3^-1*J^-1,
    x4*J*x4^-1*J^-1, x5*J*x5^-1*J^-1, x6*J*x6^-1*J^-1, x7*J*x7^-1*J^-1,
    x8*J*x8^-1*J^-1, x9*J*x9^-1*J^-1, x0*x1*x2*x3*J, x0*x4*x5*x6, x1*x4*x7*x8,
    x2*x5*x7*x9, x3*x6*x8*x9 >