"""
Ce script convertis simplement les chiffres romains en chiffre arabe 😏
Vous entrez votre chiffre Romain et il vous retourne le chiffre arabe.👌
Si le chiffre Romain n'est pas valide, il ne vous retourne rien!😒
"""
class Nombre():
    def __init__(self,r_num):
        self.r_num = r_num
        self.dico =  {"I":1, "V":5,"X":10,"L":50,"C":100,"D":500,"M":1000,"o":0}
        self.nombre= 0
        self.bool = False
    
    def conversion(self):
        self.r_num+="o"
        for i in range(len(self.r_num)-1):
            if self.bool == True:
                self.bool =False
                pass
            elif  self.dico[self.r_num[i]]>=self.dico[self.r_num[i+1]]:
                self.nombre+=self.dico[self.r_num[i]]
            
            else:
                self.nombre += (self.dico[self.r_num[i+1]]-self.dico[self.r_num[i]])
                self.bool =True
        return (self.nombre)
    def control(self):
        for i in self.r_num:
            if i  not in self.dico or i =="o": return(False)

s = Nombre(input())
if s.control()==False: pass
else:print(s.conversion())