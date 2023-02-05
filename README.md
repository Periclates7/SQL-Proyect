![Poster peliculas](https://p4.wallpaperbetter.com/wallpaper/443/241/271/art-collage-digital-fan-wallpaper-preview.jpg)

# PROYECTO SQL -> VIDEOCLUB 📼📀  
  
El presente proyecto se basa en la creación de una base de datos relacional a través de SQL. Para ello nos serviremos de documentos .csv que el cliente nos cederá para su limpieza y carga en SQL.  
  
## 🎯 OBJETIVOS DEL PROYECTO 
  
1. Crear un repositorio en GitHub con una buena organización de los recursos.
2. Explorar los datos para llegar a conclusiones con respecto a sus relaciones en SQL.
3. Aplicar herramientas, técnicas y metodologías para la limpieza de datos acordes a las relaciones:
    - Exploración del conjunto de los datos
    - Limpieza de valores nulos
    - Transformación de diferentes conjuntos de datos
    - Librerías utilizadas: Pandas, Numpy, regex, pylab y seaborn
3. Cargar de los datos a SQL a través de Python.
4. Establecer las relaciones entre tablas.
5. Filtrar datos a través de querys.


## 📈 ANÁLISIS DE LOS DATOS 

### EXPLORACIÓN GENERAL
En general nos encontramos con un conjuto de datos muy limpio y homogeneo. A golpe de vista, no hay prácticamente nada que limpiar. Solo un par de columnas realmente estorban.  
Una vez se ha profundizado más en los datos me doy cuenta de que la tabla 'old_hdd' es a la vez, la tabla más importante y con la información más rara.

### ESTABLECIMIENTO DE LAS RELACIONES
Con los datos limpios a priori, llega la hora de establecer las relaciones entre tablas. La única manera de relacionar la tabla 'film' con 'actor' es a través de 'oldhdd'. Ocurre lo mismo con 'category'.  
En este momento decido transformar 'oldhdd' a través de Pandas para que me sirva de nexo de unión de todos estos componentes (revisar el código para más info).  
  
La tabla 'rental' es fácilmente relacionable con 'film'. Esta relación se efectuará a través 'inventory'. En este punto me doy cuenta de que nuestro *dataset* carece de toda la información ya que hay id provenientes de otras tablas que no tenemos (staff id, customer id, store id), no obstante decido tener en cuenta estas tablas en mi diagrama de cara a poder rellenarlas en un futuro.  
  
En este momento, ya con los datos adaptados a nuestras relaciones, cargamos los datos a SQL para poder establecer las relaciones de manera definitiva.  
  
El diagrama resultante se muestra a continuación:  
  
![EDR](https://github.com/Periclates7/SQL-Proyect/blob/main/img/diagrama%20de%20relaciones%20copia.png)  
  
## 🐬 CONCLUSIONES
El conjunto de datos era manejable y de buena calidad para establecer una base de datos relacional, intuitiva y de fácil manejo para el cliente. Saco en claro que es importante adelantarse al cliente y pensar en todas las necesidades que puedan surgir en el futuro. Téngase en cuenta que nuestra base de datos una vez creada, es inmutable.  
  
En la ruta 'data/querys/query.sql' de este repositorio, encontrarán 10 ejemplos de querys que avalan el rendimiento y la funcionalidad de la recién creada base de datos.

