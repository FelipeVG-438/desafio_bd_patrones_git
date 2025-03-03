# Factory funciones estudiante
from abc import ABC, abstractmethod

class Funcion(ABC):
    @abstractmethod
    def informacion(self):
        pass

class Inscripciones(Funcion):
    def informacion(self):
        return '[Inscripciones]'

class Horarios(Funcion):
    def informacion(self):
        tipo = input('Ingrese el tipo de horario a revisar: ')
        return f'[Horario {tipo}]'

class Calificaciones(Funcion):
    def informacion(self):
        tipo = input('Ingrese el tipo de calificacion a revisar: ')
        return f'[Calificaciones {tipo}]'

class AlumnoFactory:
    @staticmethod
    def execute_operation(type):
        if type == 'inscripciones':
            return Inscripciones()
        elif type == 'horarios':
            return Horarios()
        elif type == 'calificaciones':
            return Calificaciones()
        else:
            return 'Esa opcion no existe'

# Factory funciones profesor
class Funcion(ABC):
    @abstractmethod
    def informacion(self):
        pass

class CursosAsignados(Funcion):
    def informacion(self):
        return '[Cursos Asignado]'

class EstudiantesInscritos(Funcion):
    def informacion(self):
        materia = input('Ingrese el nombre de la materia a revisar: ')
        return f'[Estudiantes inscritos en {materia}]'

class RegistrarCalificacion(Funcion):
    def informacion(self):
        estudiante = input('Ingrese el nombre del estudiante: ')
        return f'[Registrar calificaciones a {estudiante}]'

class ProfesorFactory:
    @staticmethod
    def execute_operation(type):
        if type == 'cursos asignados':
            return CursosAsignados()
        elif type == 'estudiantes inscritos':
            return EstudiantesInscritos()
        elif type == 'registrar calificacion':
            return RegistrarCalificacion()
        else:
            return 'Esa opcion no existe'

# Factory roles usuarios
class Usuario(ABC):
    @abstractmethod
    def permiso(self):
        pass

class Admin(Usuario):
    def permiso(self):
        return "general, profesor, estudiante"

class Teacher(Usuario):
    def permiso(self):
        return "profesor"

class Student(Usuario):
    def permiso(self):
        return "estudiante"

class UsuarioFactory:
    @staticmethod
    def crear_usuario(tipo):
        if tipo == "admin":
            return Admin()
        elif tipo == "profesor":
            return Teacher()
        elif tipo == "estudiante":
            return Student()
        else:
            return 'Tipo de usuario desconocido'