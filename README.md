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

J'ai ensuite réaliser les differentes étapes afin de pouvoir compiler mon system sur quartus (pin assignement ..). Sur la partie software j'ai ecrit une simple boucle for afin de pouvoir afficher les chiffres de 0 a 9 en polling sur un segment. Cette étape validé j'ai fait 3 boucle for imbriquer afin de réaliser l'affichage sur les 3 segments. Le code se trouve dans le fichier polling.c.

## led chaser simple
Afin d'implémenter le led chaser j'ai tout simplement réaliser dans une boucle, des shift de bit à gauche en partant de la led0 a la led7 puis des shift à droite de led7 a led0. À chaque écriture, j'ai réalisé un temps d'arrêt a l'aide de la fonction usleep(), qui va aussi me permettre de gérer la vitesse de mon led chaser dans l'étape de polling.

## led chaser polling
Pour la version avec polling, j'ai rajouté un switch case au début de ma boucle. Ce switch case permet de regarder les switches activés et modifier ensuite la variable time utiliser par la fonction usleep(). Cela permet d'augmenter ou de diminuer le temps d'attente entre chaque écriture donc modifier la vitesse.

## led chaser interruption
Pour la version avec interruption, j'ai mis en place mes différentes fonctions pour gérer les interruptions. key_interrupt() pour les keys et sw_interrupt() pour les switches. J'ai ensuite dans mon main, initialiser mes interruptions en indiquant les mask, les edge capture et l'enregistrement des interruptions. Dans la fonction key_interrupt(), on vient regarder le bouton appuyer. En fonction de ce bouton, on lance le led_chaser ou on le réinitialise en réinitialisant aussi les variables qui permet de le gérer. 


https://user-images.githubusercontent.com/24780090/211770355-d795e951-f325-4e74-9b45-989a813e43c5.mov


Dans la fonction sw_interrupt(), on vient d'abord lire le registre sur lequel est écrit les switches. Ensuite, je fais appel à ma fonction nombre_bits_a_1(), qui va me retourner le nombre de bit à 1 dans le registre. En fonction de ce nombre, je vais venir modifier ma variable time, afin de modifier la vitesse de mon led chaser.

https://user-images.githubusercontent.com/24780090/211770309-9cf0fed9-7302-426b-9a08-b7b0f3c441d1.mov


# Conclusion

J'ai réussi à terminer le lab1 sans grande difficulté. C'est la première fois que je travaille sur une vrai cible. Ce premier tp m'a permis, de reprendre en main les diffèrent outils afin de travailler sur la partie hardware et la partie software. Le seul point où j'ai perdu du tamps lors de ce tp a était les interruptions. La syntaxe des fonctions utilisées dans le cours, me donner des warnings et ne fonctionner pas. En lisant la documentation fournit sur moddle je me suis rendu compte que ALT_ENHANCED_INTERRUPT_API_PRESENT était défini dans mon fichier system.h. J'ai donc utiliser l'autre syntaxe pour définir les interruptions ce qui a fonctionner. 
