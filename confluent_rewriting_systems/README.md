# confluent_rewriting_systems

Given a graph or incidence matrix that corresponds to a graph, compute the confluent rewriting system of that graph using the Knuth-Bendix algorithm.

### Installing GAP

In order to install GAP on your operating system, please consult the [official
GAP download page](https://www.gap-system.org/Download/).

Once installed, verify that you are able to open a terminal and run

```
gap
```

This will open the GAP shell in which you may run GAP commands.

### Installing KBMAG

The [KBMAG](https://www.gap-system.org/Packages/kbmag.html) package is used to
determine the whether a writing system is confluent or not.

Installation instructions for the KBMAG package, once you have installed GAP may
be found on the [documentation page for
KBMAG](https://www.gap-system.org/Manuals/pkg/kbmag-1.5.5/doc/manual.pdf).

To verify that you have successfully installed KBMAG, open a GAP session and
attempt to load the KBMAG package.

```
gap

gap> LoadPackage("kbmag");
──────────────────────────────────────────────────────────────────────────────────────────────────────────────
Loading  kbmag 1.5.4 (Knuth-Bendix on Monoids and Automatic Groups)
by Derek Holt (http://homepages.warwick.ac.uk/staff/D.F.Holt/).
Homepage: https://gap-packages.github.io/kbmag
──────────────────────────────────────────────────────────────────────────────────────────────────────────────
true
```

If the package is installed in your version of GAP, you should see the `true`
result.

### Assumptions:
If the repository is not stored in your home directory, commands of the form `Read(Filename(DirectoryHome(),"graph_incidence_nonlocal_games/..."))`  and `load("graph_incidence_nonlocal_games/...")` should be modified to reference the appropriate path.

### Finding confluent RWS for 10 vertex cubic graphs 

The script `petersen_conjecture/fixed_order_check_cubic_graphs.g` verifies that a confluent rewriting system (RWS) can be found for all cubic graphs on at most 10 vertices excluding the Petersen graph.

```
sage: gap.console()
gap> Read(Filename(DirectoryHome(),"graph_incidence_nonlocal_games/petersen_conjecture/fixed_order_check_cubic_graphs.g"));
...
gap> Display(sizes);
[ 10, 16, 16, 25, 25, 23, 21, 23, 19, 30, 29, 34, 25, 32, 26, 22, 28, 35, 30, 28, 26, 25, 32, 31,
  27, 31, 26, 25, 25 ]
```

If you are interested in how these incidence graphs were produced, the following `sage` script generates their incidence matrices.
```
sage: load("graph_incidence_nonlocal_games/petersen_conjecture/generate_up_to_10_vertex_cubic_graphs.sage")
```

The script `petersen_conjecture/try_petersen.g` attempts to find a confluent RWS for the Petersen graph by rerunning `KBMAG` with different wreath product orderings until a confluent RWS is found. Since the other cubic graphs had fewer than 100 equations in the confluent RWS, the `maxeqns` parameter is set to 100 so that many orderings can be tried quickly. In practice, we found that `KBMAG` was unlikely to converge if the size of its RWS grew beyond a few hundred equations. 

```
gap> Read(Filename(DirectoryHome(),"graph_incidence_nonlocal_games/petersen_conjecture/try_petersen.g"));
```

### Finding confluent RWS for subgraphs of the Petersen graph

To strengthen our conjecture that the Petersen graph is the smallest graph without a confluent rewriting system, we generated confluent RWS for all subgraphs of the Petersen graph obtained by a single edge contraction or deletion.

First, generate a representative of each subgraph-isomorphism class.
```
sage: load("graph_incidence_nonlocal_games/petersen_conjecture/generate_petersen_subgraphs.sage")
```

Then RWS are found for each of the two subgraphs identified in sage.
```
sage: gap.console()
gap> Read(Filename(DirectoryHome(),"graph_incidence_nonlocal_games/petersen_conjecture/check_petersen_subgraphs.g"));
...
Sizes of RWS for Petersen subgraphs:
36
26
```
