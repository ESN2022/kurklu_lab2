# kurklu_lab2


# Introduction
Dans le cadre de notre cours de conception conjointe en GE5A a Polyteh Clermont, nous sommes amenées à mettre en pratique les connaissances théoriques acquises lors de TP. Ces travaux sont réalisés sur une carte Terasic DE10 - Lite basé sur un FPGA Altera MAX 10. Pour ce deuxième projet notre objectif et d'implémenter un compteur sur trois 7 segment. Le compteur devra afficher une nouvelle valeur toute les 1s, cela doit etre réaliser en utilisant une interruption sur un timer.


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

J'ai d'abord ecrit le fichier bin_to_7seg.vhd afin de realiser le traduction d'un chiffre en 7 segment. Pour la traduction j'ai simplement realiser une table de verité avec des when - else.

## Compteur polling
J'ai ensuite réaliser les differentes étapes afin de pouvoir compiler mon system sur quartus (pin assignement ..). Sur la partie software j'ai ecrit une simple boucle for afin de pouvoir afficher les chiffres de 0 a 9 en polling sur un segment. Cette étape validé j'ai fait 3 boucle for imbriquer afin de réaliser l'affichage sur les 3 7segments. Le code se trouve dans le fichier polling.c.

https://user-images.githubusercontent.com/24780090/211843099-4f6160b2-aeac-4aea-9bee-a2d28c4c9b7c.mov


## Compteur timer




# Conclusion

J'ai réussi à terminer le lab1 sans grande difficulté. C'est la première fois que je travaille sur une vrai cible. Ce premier tp m'a permis, de reprendre en main les diffèrent outils afin de travailler sur la partie hardware et la partie software. Le seul point où j'ai perdu du tamps lors de ce tp a était les interruptions. La syntaxe des fonctions utilisées dans le cours, me donner des warnings et ne fonctionner pas. En lisant la documentation fournit sur moddle je me suis rendu compte que ALT_ENHANCED_INTERRUPT_API_PRESENT était défini dans mon fichier system.h. J'ai donc utiliser l'autre syntaxe pour définir les interruptions ce qui a fonctionner. 
