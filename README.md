# kurklu_lab2


# Introduction
Dans le cadre de notre cours de conception conjointe en GE5A a Polyteh Clermont, nous sommes amenées à mettre en pratique les connaissances théoriques acquises lors de TP. Ces travaux sont réalisés sur une carte Terasic DE10 - Lite basé sur un FPGA Altera MAX 10. Pour ce deuxième projet notre objectif et d'implémenter un compteur sur trois 7 segments. Le compteur devra afficher une nouvelle valeur toutes les 1s, cela doit être réaliser en utilisant une interruption sur un timer.


# Architecture
Voici l'architecture que j'ai réalisée sur paint :

![lab2](https://user-images.githubusercontent.com/24780090/211839652-f88ff0c1-7246-49c2-b8b6-950c2bf19ab3.jpg)

J'ai tout d'abord repris les éléments afin de reconstruire mon system basic :
* Une clock
* Une RAM
* Un NIOS-2
* Un JTAG

Par la suite, j'ai ajouté les PIO afin de pouvoir gérer mes I/O :
* PIO sur 4 bits pour le segment1
* PIO sur 4 bits pour le segment2
* PIO sur 4 bits pour le segment3
* Un TIMER

Voici le système initialiser sur qsys :

![lab2_qsys](https://user-images.githubusercontent.com/24780090/211839872-e2330fc6-c873-4232-878d-f696c17ae4e7.jpg)


# Avancement

J'ai d'abord écrits le fichier bin_to_7seg.vhd afin de réaliser la traduction d'un chiffre en 7 segments. Pour la traduction, j'ai simplement réalisé une table de vérité avec des when - else.

## Compteur polling
J'ai ensuite réalisé les différentes étapes afin de pouvoir compiler mon system sur quartus (création vhd, components ,pin assignements ..). Sur la partie software, j'ai écrit une simple boucle for afin de pouvoir afficher les chiffres de 0 à 9 en polling sur un segment. Cette étape validée, j'ai fait 3 boucles for imbriquer afin de réaliser l'affichage sur les 3 7 segments. Le code se trouve dans le fichier polling.c.

https://user-images.githubusercontent.com/24780090/211843099-4f6160b2-aeac-4aea-9bee-a2d28c4c9b7c.mov


## Compteur timer
Dans cette partie j'ai ajouté un timer dans mon design qsys, que j'ai réglé avec une période de 1s. J'ai d'abord test uniquement si l'interruption fonctionner. Pour cela, j'ai enregistré l'interruption, j'ai créé la fonction timer_interrupt(), qui gère l'interruption et j'ai lancé l'exécution avec des alt_printf afin de debug . J'ai remarqué que je rentrais une seule fois dans timer_interrupt(). En regardant la documentation sur les timer, j'ai décidé d'abord de check le registre CONTROL et STATUS et j'ai remarqué en fin de timer_interrupt() que le bit TO du registre ne repasser pas à 0. Après avoir corrigé, je rentrais bien dans l'interruption toute les 1s. finalement j'ai implémenté le compteur dans l'interruption qui se trouve dans le fichier main.c.

https://user-images.githubusercontent.com/24780090/211845285-f251671e-e3e1-4b9d-b263-c7e8c17521c6.mov


# Conclusion

J'ai réussi à terminer le lab2 sans grande difficulté et en moins de temps que le lab1. Ce deuxième tp m'a permis, d'utiliser les timer et de comprendre leur fonctionnements. Sur le premier lab j'avais perdu beaucoup de temps avec l'interruption mais pour se lab je suis directement aller voir la documentation afin de regarder si chaque registre se comporté de la bonne façon . Néanmois il ma fallu un petit temps de reflexion afin de comprendre comment realiser le branchement mais un fois l'architecutre du system dessiné cela ma grandement aidé.

