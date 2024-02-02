# MPLR-Serpent
## Mathématiques pour la robotique - Projet SERPENT

Ce projet propose une approche de résolution d'un problème de cinématique
directe/indirecte pour un **robot serpent à 5 degrés de liberté** avec présence d'un obstacle.

- `serpent.m` constitue le programme principal et permet d'effectuer les tests.
- `calc_serpent` retourne les coordonnées des articulations du serpent ainsi que la
couleur du plot (rouge si collision avec l'obstacle, bleu sinon).
- `dessin_serpent` retourne les coordonnées de l'effecteur en fonction des
angles des articulations (**cinématique directe**) et affiche une figure correspondant
à la situation pour la visualiser. Comme suggéré précedemment, la couleur du plot
permet de manifester une éventuelle collision avec l'obstacle.
- `solve_serpent_pos_to_angle` retourne une configuration possible des moteurs pour
une position donnée de l'effecteur (**cinématique inverse**). Un algorithme de Newton
est utilisé.
- `find_sol_without_collision` peut être ensuite appelée pour chercher une autre configuration
qui n'implique pas de collision avec l'obstacle. Pour cela, la fonction `solve_serpent_pos_to_angle`
est rappelée après application d'un offset aléatoire sur les moteurs, jusqu'à ce qu'une configuration
correcte soit trouvée.