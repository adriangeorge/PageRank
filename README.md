# Page Rank

Cioban George-Adrian
Grupa : 314CC

                        =======================================	
                    =======	   Tema 02 - Metode Numerice    =======
                        =======================================

===[ PART 1 ]===

ITERATIVE

    Abordarea fata de acest task a fost de a construi pe rand matricile
    descrise in algoritmul de pe wikipedia.
    
    Citirea se face rand cu rand folosind fgets(), output-ul este apoi convertit
    dintr-un vector de caractere intr-un vector de numere

    Pentru a construi inversa matricei K, m-am folosit de faptul ca aceasta
    este o matrice diagonala, astfel am atribuit direct valorile inversate

    Deoarece faceam o iteratie in plus am decis ca la final sa returnez valoarea precedenta R_prev

===[ PART 2 ]===

    Am decis sa stochez matricea ce trebuie inversata in T pentru a avea aceleasi notatii ca in cerinta
    Apoi am aflat inversa rezolvand ecuatia R * T^(-1) = Q' folosind SST
    Aplicand formula de pe wikipedia rezulta vectorul de PageRank

===[ PART 3 ]===

    Pentru ca functia sa fie continua se verifica x = val1 si x = val2
    Rezolvand sistemul de doua ecuatii cu doua necunoscute rezultat se afla a si b
    
    Vectorul u este apoi construit conform indicatiilor din cerinta si este sortat folsind functia sort()
    Rezultatele sunt afisate conform modelului din cerinta.


