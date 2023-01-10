# IMPORTAMOS EL MISMO MYSQL.CONNECTOR A NUESTRO ARCHIVO BIBLIOTECA_METHODS.PY
from mysql.connector import connect, Error

#############################################################################################################
# COMENZAMOS POR LOS METODOS PARA INSERTAR ALGO EN CADA UNA DE LAS TABLAS

# 1.- INSERTAR AUTOR (TABLA: AUTORES)   
     
def insertar_autor(self, nombre, fechaNacimiento, pais, genero, biografia, id_libro):
    try:
        sql_query = "INSERT INTO autores (nombre, fechaNacimiento, pais, genero, biografia, id_libro) VALUES (%s, %s, %s, %s, %s, %s)"
        values = (nombre, fechaNacimiento, pais, genero, biografia, id_libro)
        self.cursor.execute(sql_query, values)
        self.connection.commit()
        print(f"Autor '{nombre}' insertado exitosamente")
    except Error as e:
        print(f"Error al insertar autor: {e}")


# 2.- INSERTAR EDITORIAL (TABLA: EDITORIALES) 
      
def insertar_editorial(self, nombre, direccion, pais, id_libro, id_autor):
    try:
        sql_query = "INSERT INTO editorial (nombre, direccion, pais, id_libro, id_autor) VALUES (%s, %s, %s, %s, %s)"
        value = (nombre, direccion, pais, id_libro, id_autor)
        self.cursor.execute(sql_query,value)
        self.connection.commit()
        print(f"Editorial '{nombre}' insertada exitosamente")
    except Error as e:
        print(f"Error al insertar editorial: {e}")
        
         
# 3.- INSERTAR EJEMPLAR (TABLA: EJEMPLARES)

def insertar_ejemplar(self, id_libro, estado, ubicacion, fechaVencimiento):
    
    try:
        sql_query = "INSERT INTO ejemplares (id_libro, estado, ubicacion, fechaVencimiento) VALUES (%s, %s, %s, %s)"
        values = (id_libro, estado, ubicacion, fechaVencimiento)
        self.cursor.execute(sql_query, values)
        self.connection.commit()
        print(f"Ejemplar del libro {id_libro} insertado exitosamente")
    except Error as e:
        print(f"Error al insertar ejemplar: {e}")
                        
# 4.- INSERTAR LIBRO (TABLA: LIBROS)

def insertar_libro(self, titulo, autor, editorial, fechaPublicacion, genero, cantidad, estado, isbn):
    try:
        sql_query = "INSERT INTO libros (titulo, autor, editorial, ano) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
        values = (titulo, autor, editorial, fechaPublicacion, genero, cantidad, estado, isbn)
        self.cursor.execute(sql_query, values)
        self.connection.commit()
        print(f"Libro '{titulo}' insertado exitosamente")
    except Error as e:
        print(f"Error al insertar libro: {e}")
            
            
# 5.- INSERTAR PRESTAMO (TABLA: PRESTAMOS)

def insertar_prestamo(self, id_usuario, id_ejemplar, fechaPrestamo, fechaDevolucion, estado):
    try:
        sql_query = "INSERT INTO prestamos (id_usuario, id_ejemplar, fechaPrestamo, fechaDevolucion, estado) VALUES (%s, %s, %s, %s)"
        values = (id_usuario, id_ejemplar, fechaPrestamo, fechaDevolucion, estado)
        self.cursor.execute(sql_query, values)
        self.connection.commit()
        print(f"Préstamo del ejemplar {id_ejemplar} insertado exitosamente")
    except Error as e:
        print(f"Error al insertar préstamo: {e}")
        
