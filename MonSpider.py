from lib2to3.pgen2 import driver
import requests   
from selenium import webdriver

DRIVER = webdriver.Firefox()
i=0     
DRIVER.get('https://www.toutfaire.fr/pointe-tpo-acier-clair-90-x-4-0-mm-5-kg')
DRIVER.find_element("class","btn-default").click()

while i<1:
   i=input("off le navigateur: ")
DRIVER.quit()