
from encodings import utf_8
import os
import csv  


class Panne ():
    def __init__(self,cause,panne) -> None:
        self.cause = cause 
        self.panne = panne
    
    def modif_panne(self ):
        pass

    
class Solution (Panne):
    def __init__(self, cause, panne,solution) -> None:
        super().__init__(cause, panne)
        self.solution = solution
    
    def modif_solution(self):
        pass
    


def lire_element(fichier):

    lst = []
    
    with open ("fichier.csv","r", encoding="utf_8") as fichier_csv:
        fichier_csv_read = csv.DictReader(fichier_csv)
        for line in fichier_csv_read:
            l= Solution(line["cause"],line["panne"],line["solution"])
            lst.append(l)
            
    return lst 

def ecrir_fichier (lst,fichier):
    
    header = ["code","cause","panne","solution"]
    with open(fichier, "w+", encoding="utf_8") as fille:
                    
        writer = csv.writer( fille, delimiter=",")
        writer.writerow(header)
        
        for i in range(len(lst)):
            writer.writerow([lst[i].cause,lst[i].panne,lst[i].solution])
    return()
            



la_liste=[]      
    
if os.path.exists("fichier.csv"):
    la_liste.extend(lire_element("fichier.csv") )
    #la_liste.pop()       
else : 
    print("il ya rein dans votre fichier") 
    
q="N"
while q!="Y":
    q= input("Que voulez vous faire : \n E : pour enregister une panne \n P : Pour determiner une solution a une panne \n Y : pour sortir \n : ",)
    if q == "Y":
        if len(la_liste)>1:
            ecrir_fichier(la_liste,"fichier.csv")
        break
    
    elif q== "E":
        p = input("Panne    : ", )
        c = input("Cause    : ", )
        s = input("Solution : ", )
        ob  = Solution(c,p,s)

        la_liste.append(ob)

    elif q == "P":
        for i in range(len(la_liste)):
            print(f"code : {i} Panne {la_liste[i].panne}")
        code_panne = int(input("Code de la panne : ",))
        print(f"la solution est : {la_liste[code_panne].solution}")
    




    

        
    