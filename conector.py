from mysql.connector import connect, Error

class Biblioteca:
    
    def __init__(self):
        try:
            # Establecemos la conexión con la base de datos
            aux = connect(  
                user='root',
                password='abc.123',
                host='127.0.0.1',
                database='biblioteca'
                
            )
            self.connection = aux
            self.cursor = self.connection.cursor()
            
        except Error as e:
            print("Error" + e)
            
            
    
            
