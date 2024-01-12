import json
import zipfile
import os 

api_token = {"username":"francolezama","key":"c66a20cfa4a5f9be951784ebf03339af"}  ## contenido de archivo kaggle.json

##Conectar a Kaggle
with open ("C:/Users/Franco/.kaggle/kaggle.json", "w") as file:
    json.dump(api_token,file)

location = "C:/Users/Franco/Documents/proyecto_parcial/dataset"

##Validad que la carpeta existe
if not os.path.exists(location):
    ##Si no existe la carpeta dataset entonces la creo
    os.mkdir(location)
else: 
    ##Si la carpeta si existe, entonces voy a borrar su contenido 
    for root, dirs, files in os.walk(location, topdown=False):
        for name in files: 
            os.remove(os.path.join(root,name))  ##elimino todos los archivos
        for name in dirs:
            os.rmdir(os.path.join(root,name))   ##elimino todas las carpetas


##Descargar dataset de Kaggle
os.system("kaggle datasets download -d henryshan/starbucks -p C:/Users/Franco/Documents/proyecto_parcial/dataset")

##Descomprimir el archivo de Kaggle
os.chdir(location)
for file in os.listdir():
    zip_ref = zipfile.ZipFile(file,"r") ##lee archivos zip
    zip_ref.extractall() ##extrae contenido de archivos zip
    zip_ref.close() ##cierra archivos
