# Arkhipov's theorem, graph minors, and linear system nonlocal games

Companion code for:

```
"Arkhipov's theorem, graph minors, and linear system nonlocal games",
C. Paddock, V. Russo, T. Silverthorne, W. Slofstra,
arXiv: [arXiv:2205.04645](https://arxiv.org/abs/2205.04645)
```

Each of the subsequent subdirectories [incidence_group_gen](#incidence_group_gen) and [confluent_rewriting_systems](confluent_rewriting_systems) contain their own `README.md` file that describes their utility and how to run the code within.


### Dependencies

1. [SageMath](http://www.sagemath.org/) (version >= 7.5.1),
2. [GAP](https://www.gap-system.org/) (version >= 4.8.3),
3. [KBMAG](https://www.gap-system.org/Packages/kbmag.html) (version >= 1.5.4: follow installation instructions in this README).
4. [Python 3](https://www.python.org/)

### incidence_group_gen

Given a graph or incidence matrix that corresponds to a graph, determine the incidence group of the graph as either a permutation group or as a finitely presented group.

### confluent_rewriting_systems

Given a graph or incidence matrix that corresponds to a graph, compute the confluent rewriting system of that graph using the Knuth-Bendix algorithm.