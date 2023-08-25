% Resolution de l'atelier fêtes de la sciences 2023 - JeBif, à l'aide de l'Answer Set Programming.

% Il y a quatre suspects
suspect(chat).
suspect(chien).
suspect(loup).
suspect(ours).

% Les ingrédients - molécules suivantes ont été identifiés
ingredient(chocose).
ingredient(lactoleine).
ingredient(beurroise).
ingredient(noisetine).
ingredient(savourine).

% Les composés qu'on peut retrouver dans l'haleine des gourmands par spectrométrie de masse sont les suivants
compose(bleu).
compose(jaune).
compose(vert).
compose(rouge).
compose(blanc).

% Il y a au moins un coupable
1 { coupable(Animal) }

% Le coupable est un des suspects
coupable(Animal) :- suspect(Animal).

% Le coupable a mangé des choconours, il a donc ingeré de la savourine
coupable(Animal) :- mange(Animal, savourine).

% Les ingrédients ingérés entraînent une émission de différents composés gazeux en cours de digestion
% Si le suspect a mangé l'ingrédient, son haleine comporte les composés associés
mange(Animal, chocose) :- haleine(Animal, vert).
mange(Animal, lactoleine) :- haleine(Animal, bleu), haleine(Animal, jaune).
mange(Animal, beurroise) :- haleine(Animal, bleu), haleine(Animal, jaune), haleine(Animal, blanc).
mange(Animal, savourine) :- haleine(Animal, bleu), haleine(Animal, vert), haleine(Animal, blanc).

% On a identifié des composés de l'haleine des suspect
haleine(chat, bleu).
haleine(chat, jaune).
haleine(chat, vert).
%not haleine(chat, rouge).
%not haleine(chat, blanc).
haleine(chien, bleu).
haleine(chien, vert).
haleine(chien, rouge).
haleine(chien, blanc).
%not haleine(chien, jaune).
haleine(loup, bleu).
haleine(loup, jaune).
haleine(loup, rouge).
haleine(loup, blanc).
%not haleine(loup, vert).
haleine(ours, bleu).
haleine(ours, jaune).
haleine(ours, vert).
haleine(ours, rouge).
haleine(ours, blanc).

#show coupable/1.
