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