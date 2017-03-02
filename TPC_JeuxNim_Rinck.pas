{ALGO:AllumettesComplexes
BUT:Creer le jeu des allumettes dit de "Nim"
ENTREE:Nombre de ligne d'allumettes
SORTIE:Le jeu des allumettes dit de "Nim"
Const
	Max=10
	Min=1
	MaxAll=3
Type
	Tab1=Tableau [1..10] de ENTIER
Procedure PlaceAllu(var Taille:ENTIER;var T1:Tab1)
VAR
	i,j:ENTIER
DEBUT
	Randomize
	ECRIRE ('Veuillez choisir le nombre de lignes que vous souhaitez')
	LIRE Taille
	ECRIRE ('Voici le plan de jeu : ')
	POUR i<-1 A Taille faire
		T1[i]<-random(max-min+1)+min
		ECRIRE(T1[i])
	FINPOUR
FINPROCEDURE
Procedure ATKJ1(var NbJ1:ENTIER;var Ligne:ENTIER; var taille:ENTIER; var T1:Tab1)
DEBUT
	REPETER
		REPETER
			ECRIRE ('JOUEUR 1 : Entrez le nombre d''allumette(s) (1 a 3)')
			LIRE (NbJ1)
		JUSQUA ((NbJ1>0) ET (NbJ1<4))
		FINREPETER
		REPETER
			ECRIRE ('JOUEUR 1 : Entrez la Ligne de retrait')
			LIRE (Ligne)
		JUSQUA ((Ligne>0)ET(Ligne<=taille))
		FINREPETER
	JUSQUA NbJ1<=T1[Ligne]
	FINREPETER
	T1[Ligne]<-T1[Ligne]-NbJ1
FINPROCEDURE
Procedure AffichageJeu (var taille:ENTIER;var T1:Tab1)
VAR
	i:ENTIER
DEBUT
	ECRIRE ('Voici le plateau du jeu')
	POUR i<-1 A Taille faire
		ECRIRE (T1[i])
	FINPOUR
FINPROCEDURE
Procedure ATKIA (var NbIA:ENTIER; var LigneIA:ENTIER;var T1:Tab1;var Taille:ENTIER)
DEBUT
	REPETER
		NbIA<-random(MaxAll-min+1)+min
        LigneIA<-random(taille-min+1)+min
	JUSQUA NbIA<=T1[LigneIA]
	FINREPETER
	T1[LigneIA]<-T1[LigneIA]-NbIA;
	ECRIRE('L''IA A ENLEVE ',NbIA,' ALLUMETTES EN LIGNE : ',LigneIA)
FINPROCEDURE
VAR
	T1:Tableau [1..10] de ENTIER
	Taille,NbJ1,Ligne,NbIA,LigneIA,aide:ENTIER
DEBUT
	aide<-1
	PlaceAllu(taille,T1)
	REPETER
		ATKJ1(NbJ1,Ligne,taille,T1)
        AffichageJeu(taille,T1)
		SI (T1[1]<>0) OU (T1[2]<>0) OU (T1[3]<>0) OU (T1[4]<>0) OU (T1[5]<>0) OU (T1[6]<>0) OU (T1[7]<>0) OU (T1[8]<>0) OU (T1[9]<>0) OU (T1[10]<>0) Alors
			ATKIA(NbIA,LigneIA,T1,taille)
			AffichageJeu(taille,T1)
		SINON
			ECRIRE ('VICTOIRE JOUEUR1')
			aide<-2
		FINSI
	JUSQUA (T1[1]=0) ET (T1[2]=0) ET (T1[3]=0) ET (T1[4]=0) ET (T1[5]=0) ET (T1[6]=0) ET (T1[7]=0) ET (T1[8]=0) ET (T1[9]=0) ET (T1[10]=0)
	FINREPETER
	SI aide=1 Alors
		ECRIRE ('Victoire de l''IA')
	FINSI
FIN.
}
Program AllumetteLigne;
uses crt;
Const
	Max=10;
    Min=1;
	MaxAll=3;
Type
	Tabl=Array[1..10] of integer;
Procedure PlaceAllu(var Taille:integer;var T1:Tabl);						//Procedure qui demande la taille du plateau et qui random le nombre d'allumette
VAR																			//Par ligne
	i,j,NbLigne:integer;
Begin
	clrscr;
	randomize;
	writeln('Veuillez choisir le nombre de lignes que vous souhaitez');
	readln(taille);
	clrscr;
	Writeln('VOICI LE PLATEAU DE JEU :');
	For i:=1 to taille do
		Begin
			T1[i]:=random(max-min+1)+min;
			Writeln(T1[i]);
		End;
	Writeln;
	Readln;
End;
Procedure ATKJ1(var NbJ1:integer ; var Ligne:integer ; var taille:integer; var T1:Tabl); //Procedure qui retire le nombre d'allumettes que le joueuer a décider
Begin																					 //A la ligne qu'il aura choisis
	Repeat
		Repeat
			Begin
				Writeln('JOUEUR 1 : Entrez le nombre d''allumette(s) (1 a 3)');
				Readln(NbJ1);
			End;
		Until (NbJ1>0) AND (NbJ1<4);
		Repeat
			Begin
				Writeln('JOUEUR 1 : Entrez la Ligne de retrait');
				Readln(Ligne)
			End;
		Until (Ligne>0) AND (Ligne<=taille);
	Until NbJ1<=T1[Ligne];
	T1[Ligne]:=T1[Ligne]-NbJ1;
End;
Procedure AffichageJeu (var taille:integer;var T1:Tabl);
Var
	i:integer;
Begin
	Writeln('VOICI LE PLATEAU DE JEU');
	For i:=1 to taille do
		Begin
			Writeln(T1[i]);
		End;
	Readln;
End;
Procedure ATKIA (var NbIA:integer;var LigneIA:integer;var T1:Tabl;var Taille:integer);	// Tour de jeux de l'IA
Begin 	
	clrscr;
	Repeat
		NbIA:=random(MaxAll-min+1)+min;
		LigneIA:=random(taille-min+1)+min;
	Until NbIA<=T1[LigneIA];
		T1[LigneIA]:=T1[LigneIA]-NbIA;
		Writeln('BOBBY A ENLEVER ',NbIA,' ALLUMETTES EN LIGNE : ',LigneIA);
End;
Var
	T1:Array[1..10] of integer;
	Taille,NbJ1,Ligne,NbIA,LigneIA,aide:integer;
Begin																				//Le bouclage du tour de jeux ce fait dans le programme principal
	aide:=1;
	PlaceAllu(taille,T1);
	Repeat
		ATKJ1(NbJ1,Ligne,taille,T1);
		AffichageJeu(taille,T1);
		If (T1[1]<>0) OR (T1[2]<>0) OR (T1[3]<>0) OR (T1[4]<>0) OR (T1[5]<>0) OR (T1[6]<>0) OR (T1[7]<>0) OR (T1[8]<>0) OR (T1[9]<>0) OR (T1[10]<>0)then
		Begin
			ATKIA(NbIA,LigneIA,T1,taille);
			AffichageJeu(taille,T1);
		End
		Else
		Begin		
			Writeln('VICTOIRE JOUEUR 1');
			aide:=2;
		End;
	Until (T1[1]=0) AND (T1[2]=0) AND (T1[3]=0) AND (T1[4]=0) AND (T1[5]=0) AND (T1[6]=0) AND (T1[7]=0) AND (T1[8]=0) AND (T1[9]=0) AND (T1[10]=0);
	If aide=1 then
		Writeln('VICTOIRE BOBBY');
		Readln;
End.
	
