% student(Nume, ListaNote).

% studenti_pentru_bursa(ListaStudenti, MedieMinima, ListaNumeRezultat).

studenti_pentru_bursa([], _, []).
studenti_pentru_bursa([student(Nume, ListaNote) | ListaStudenti], MedieMinima, [Nume | ListaNumeRezultat]):-
                            calculeazaSumaNoteStudent(ListaNote, SumaNote),
                            length(ListaNote, NumarNote),
                            MedieCalculata is SumaNote / NumarNote,
                            MedieMinima =< MedieCalculata,
                            studenti_pentru_bursa(ListaStudenti, MedieMinima, ListaNumeRezultat).
                            
studenti_pentru_bursa([student(_, ListaNote) | ListaStudenti], MedieMinima, ListaNumeRezultat):-
                            calculeazaSumaNoteStudent(ListaNote, SumaNote),
                            length(ListaNote, NumarNote),
                            MedieCalculata is SumaNote / NumarNote,
                            MedieMinima > MedieCalculata,
                            studenti_pentru_bursa(ListaStudenti, MedieMinima, ListaNumeRezultat).
                            
                            
calculeazaSumaNoteStudent([], 0).                            
calculeazaSumaNoteStudent([Nota | ListaNote], SumaNote) :- 
                  calculeazaSumaNoteStudent(ListaNote, S),
                  SumaNote is S + Nota.