{ Algorithme Pendu
But : Creer un pendu jouable
Entree : Un mot à deviner et des lettres 
Sortie : Le nombre de vie/Les lettres trouvé/Le gagnant
TYPE 
	Tabl=Tableau[1..10] de Caractère
Procedure Entree (var Mot:Chaine)
DEBUT 
	REPETER
		Ecrire("Entrez votre mot")
		Lire(Mot)
		Ecrire("Le mot fait",longeur(mot)&" lettre")
	JUSQU'A longueur(mot) <=10
	FINREPETER
FINPROCEDURE 
Procedure Attaque (var Lettre:Caractère, var Mot:Chaine, var T1:Tabl, var Vie:Entier, var Totalvie:entier, var compteur:entier)
Var 
	i:entier
DEBUT 
	Ecrire("Entrez la lettre d'attaque")
	Lire(Lettre)
	TotalVie<-0
	POUR i<-1 A Longueur(mot) FAIRE
		T1[i]<-Lettre 
		TotalVie<-TotalVie-1
		Compteur<-Compteur-1 
	FINPOUR
	SI TotalVie=0 alors 
		Vie<-Vie-1 
	FINSI
Procedure Affichage (var T1:Tabl, var Vie:entier, var Mot:Chaine)
Var 
	i:entier 
DEBUT 
	ECRIRE("Vous avez"&Vie&" Vie")
	ECRIRE("Vous avez trouvez :")
	POUR i<-1 A length(mot) FAIRE 
		SI Mot[i]=T1[i] ALORS 
			ECRIRE(T1[i]&' ')
		Else ECRIRE("_")
		FINSI 
	FINPOUR 
FINPROCEDURE
VAR
	Mot:Chaine
	Lettre:Caractère
	T1:Array[1..10] of Char
	i,vie,totalvie,compteur:entier
BEGIN
	Entree(Mot)
	Vie<-5
	REPETER
		Attaque(Lettre,Mot,T1,Vie,TotalVie,compteur)
		Affichage(T1,Vie,Mot)
	JUSQU'A (Vie=0) OU (compteur=longueur(mot))
	SI compteur=Longueur(mot) ALORS
			ECRIRE("GAGNER ! ")
	SINON
		ECRIRE("PERDU ! ")
		ECRIRE("Le mot etait : ")&Mot);
	FINSI
END.
}
Program pendu;
uses crt;

Type
	Tabl=Array[1..10] of Char;
	
procedure Entree (var Mot:string);				//Procedure d'entree du mot
Begin
	Repeat
		clrscr;
		Writeln('Entrez votre mot (10 car Max)');
		Readln(Mot);
		clrscr;
		Writeln('Le mot fait ',length(mot),' lettres');
		Writeln('Appuyez sur ENTER ');
		Readln;
	Until length(Mot)<=10;
End;

procedure Attaque (var Lettre:char; var Mot:string; var T1:Tabl; var Vie:integer; var TotalVie:integer; var compteur:integer); //Choix de la lettre par le joueur
Var
	i:integer;
Begin
	clrscr;
	Writeln('Entrez la lettre d''attaque');
	Readln(Lettre);
	TotalVie:=0;
	For i:=1 to Length(Mot) do
		Begin
			if Lettre=Mot[i] then
				Begin
					T1[i]:=Lettre;
					TotalVie:=TotalVie-1;
					compteur:=compteur+1;
				End;
		End;
		If TotalVie=0 then
			Begin
				Vie:=Vie-1;
			End;
End;
Procedure Affichage (var T1:Tabl; var Vie:integer; Mot:string);		//Affichage des lettres trouvé et manquantes
Var
        i:integer;
Begin 	
	clrscr;
	Writeln('Il vous reste ',Vie,' Vie');
	Writeln('Vous avez trouvez :');
	For i:=1 to length(Mot) do
		Begin
			if Mot[i]=T1[i] then
				Write(T1[i],' ')
			Else Write('_ ');
		End;
	Readln;
End;
			
VAR
	Mot:string;
	Lettre:char;
	T1:Array[1..10] of Char;
	i:integer;
	Vie:integer;
	Totalvie:integer;
    compteur:integer;
BEGIN									//La condition de victoire ce fait dans la procedure principale
	Entree(Mot);
	Vie:=5;
	Repeat
		Attaque(Lettre,Mot,T1,Vie,TotalVie,compteur);
		Affichage(T1,Vie,Mot);
	Until (Vie=0) OR (compteur=length(mot));
	clrscr;
	if compteur=length(mot) then
		begin
			Write('GAGNER ! ')
		End
	Else
	Begin
		Write('PERDU ! ');
		Writeln(UTF8toAnsi('Le mot etait : '),Mot);
	End;
	Readln;
END.
