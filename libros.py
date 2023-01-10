class Libro:
    
    def __init__(self, titulo, autor, editorial, fechaPublicacion, genero, cantidad, estado):
        self.titulo = titulo
        self.autor = autor
        self.editorial = editorial
        self.fechaPublicacion = fechaPublicacion
        self.genero = genero
        self.cantidad = cantidad
        self.estado = estado
        
    def get_titulo(self):
        return self.titulo
    
    def get_autor(self):
        return self.autor
    
    def get_editorial(self):
        return self.editorial
    
    def get_anio(self):
        return self.fechaPublicacion
    
    def get_genero(self):
        return self.genero
    
    def get_disponibles(self):
        return self.disponibles
    
    def aumentar_disponibles(self, cantidad):
        self.disponibles += cantidad
    
    def disminuir_disponibles(self, cantidad):
        self.disponibles -= cantidad
        
    def mostrar_libros(self, libros):
        for libro in libros:
            print("Título: ", libro.get_titulo())
            print("Autor: ", libro.get_autor())
            print("Editorial: ", libro.get_editorial())
            print("Año: ", libro.get_anio())
            print("Género: ", libro.get_genero())
            print("Disponibles :", libro.get_disponibles())
            print()