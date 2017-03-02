
{ALGO: Allumettes1v1ou1vIA
BUT:Creer le jeu d'allumettes basiques
ENTREE:1v1ou1vIA;
SORTIE:Le jeu des allumettes basiques
CONST
	Min=1
	Max=3
Procedure Initialisation (var NbAll:ENTIER);
	DEBUT
		NbALL<-21
	FINPROCEDURE
Fonction AllJ1(var NbJ1:ENTIER):Booleen
	DEBUT
		Repeter
			ECRIRE ('Joueur 1: Entrer le nombre d''allumettes (1 a 3))
			LIRE (NbJ1)
		JUSQUA (NbJ1>0) AND (NbJ1<4)
		FINREPETER
FINFONCTION
Procedure Joueur1 (var NbAll:ENTIER;var NbJ1:ENTIER)*
	DEBUT
		AllJ1(NbJ1)
		SI NbAll-NbJ1<= 1 Alors
			ECRIRE ('Victoire JOUEUR2')
			NbAll<-0
		SINON
			NbAll<- Nball-NbJ1
		FINSI
		SI NbAll>1 Alors
			ECRIRE ('Il reste : ',NbAll,' allumettes')
		FINSI
FINPROCEDURE
Fonction AllJ2(var NbJ2:ENTIER)
	DEBUT
		Repeter
			ECRIRE ('JOUEUR 2 : Entrez le nombre d''allumette(s) (1 a 3)')
			LIRE (NbJ2)
		JUSQUA NbJ2>0 ET NbJ2<4
		FINREPETER
FINFONCTION
Procedure Joueur2 (var NbAll:ENTIER;var NbJ2:ENTIER)
	DEBUT
		AllJ2(NbJ2)
		SI NbAll-NbJ2<= 1 Alors
			ECRIRE ('Victoire JOUEUR1')
			NbAll<-0
		SINON
			NbAll<-NbAll-NbJ2
		FINSI 
		SI Nball>1 Alors
			ECRIRE ('Il reste : ',NbAll,' allumettes')
		FINSI
FINPROCEDURE		
Fonction AllIA (var NbIA:ENTIER; var NbAll:ENTIER): Booleen
	DEBUT
		SI NbAll>4 alors
			Randomize;
			NbIA<-Random(Max-Min+1)+Min
		SINON
			CAS NbAll PARMIS
			2:NbIA<-1
			3:NbIA<-2
			4:NbIA<-3
		FINSI
	ECRIRE ('L''IA A JOUE ',NbIA)
FINSI
Procedure IA (var NbAll:ENTIER;var NbIA:ENTIER)
	DEBUT
		AllIA(NbIA,NbAll)
		SI NbAll-NbIA<= 1 Alors
			ECRIRE ('VICTOIRE IA')
			NbAll<-0
		SINON
			NbAll<-NbAll-NbIA
		FINSI
		SI NbAll>1 Alors
			ECRIRE ('Il reste : ',NbAll,' allumettes')
		FINSI
FINPROCEDURE
Procedure Victoire (var NbAll:ENTIER;var NbJ1:ENTIER;var NbJ2:ENTIER;var test:ENTIER;var NbIA:ENTIER)
	DEBUT
		Repeter
			ECRIRE ('Tapez 1 pour jouer contre un IA et 2 pour jouer a 2')
			LIRE (test)
		JUSQUA ((test=1) OR (test=2))
		FINREPETER
		Repeter
			Joueur1(NbAll,NbJ1)
			SI NbAll>1 Alors
				SI test=1 Alors
					IA(NbAll,NbIA)
				FINSI 
					SINONSI test=2 then
						Joueur2(NbAll,NbJ2)
					FINSI
			FINSI
		JUSQUA NbAll<=1 
		FINREPETER 
FINPROCEDURE
VAR
	NbAll,NbJ1,NbJ2,NbIA:ENTIER
	test:ENTIER
DEBUT
	Initialisation(NbAll)
	Victoire(NbAll,NbJ1,NbJ2,test,NbIA)
FIN.
}
Program Allumette;
uses crt;
CONST
	Min=1;
	Max=3;
Procedure initialisation (var NbAll:integer);				//Initalisation du terrain a 21 allumettes
Begin
    NbAll:=21;
End;
Function AllJ1(var NbJ1:integer):Boolean;					//Fonction booleene de validation du tour de jeux du joueur 1 
Begin
Repeat
    Begin
        Writeln('JOUEUR 1 : Entrez le nombre d''allumette(s) (1 a 3)');
        Readln(NbJ1);
    End;
Until (NbJ1>0) AND (NbJ1<4);
End;
Procedure Joueur1 (var NbAll:integer; var NbJ1:integer; var test:integer);	//Tour de jeux du joueur 1 / Validation de la victoire / Affichage 
Begin																		//Des allumettes restantes
    AllJ1(NbJ1);
    If NbAll-NbJ1 <= 1 then
		Begin
			NbAll:=0;
			IF test=2 then
				begin
					Writeln('VICTOIRE JOUEUR 1');
				end
			Else if test=1 then
				begin
					writeln('VICTOIRE JOUEUR 1');
				end
		End
		Else
			NbAll:=NbAll-NbJ1;
		if NbAll>1 then
			Begin
				Writeln('Il reste : ',NbAll,' allumettes');
			End;
End;
Function AllJ2(var NbJ2:integer):Boolean;						//Comme pour Joueur 1, pour le joueur 2 
Begin
Repeat
	Begin
        Writeln('JOUEUR 2 : Entrez le nombre d''allumette(s) (1 a 3)');	
		Readln(NbJ2);
	End;
Until (NbJ2>0) AND (NbJ2<4);
End;
Procedure Joueur2 (var NbAll:integer; var NbJ2:integer);		//Tour de jeux du joueur 2 
Begin
    AllJ2(NbJ2);
    If NbAll-NbJ2 <= 1 then
		Begin
			Writeln('VICTOIRE JOUEUR 2');
			NbAll:=0;
		End
		Else
			NbAll:=NbAll-NbJ2;
				If NbAll>1 then
					Begin
						Writeln('Il reste : ',NbAll,' allumettes');
					End;
End;
Function AllIA (var NbIA:integer; var NbAll:integer):Boolean;	//Procedure du tour de l'IA 
Begin
    If NbAll>4 then
        Begin
            Randomize;
            NbIA:=Random(Max-Min+1)+Min;
        End
    Else
    Begin
        Case NbAll of
            2:NbIA:=1;
            3:NbIA:=2;
            4:NbIA:=3;
        End;
    End;
    Writeln('L''IA A JOUE ',NbIA);
End;
Procedure IA (var NbAll:integer; var NbIA:integer);		//Procedure de victoire IA 
Begin
    AllIA(NbIA,NbAll);
    If NbAll-NbIA <= 1 then
    Begin
        Writeln('VICTOIRE IA');
        NbAll:=0;
    End
    Else
		NbAll:=NbAll-NbIA;
    if NbAll>1 then
    Begin
        Writeln('Il reste : ',NbAll,' allumettes');
    End;
End;
Procedure Victoire (var NbAll:integer; var NbJ1:integer; var NbJ2:integer;var test:integer;var NbIA:integer);	//Choix du mode de jeux (J1vsIA ou J1vsJ2)
Begin																											//Avec variable d'aide qui valide l'affichage
Repeat																											//De la victoire
	writeln('Tapez 1 pour jouer contre un IA et 2 pour jouer a 2');
	readln(test);
Until ((test=1) OR (test=2));
    Repeat
        Begin
            Joueur1(NbAll,NbJ1,test);
            If NbAll>1 then
				begin
					If test=1 then
						begin
							IA(NbAll,NbIA);
						end
							else if test=2 then
								begin
									Joueur2(NbAll,NbJ2);
								end;
				end;
        end;
    Until NbAll<=1;
End;
VAR
    NbAll,NbJ1,NbJ2,NbIA:integer;
	test:integer;
Begin
    Initialisation(NbAll);
    clrscr;
	Writeln('IL Y A ',NbAll,' ALLUMETTES AU DEBUT');
    Victoire(NbAll,NbJ1,NbJ2,test,NbIA);
    Readln;
END.