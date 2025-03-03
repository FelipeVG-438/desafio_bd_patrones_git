# Decorator
from abc import ABC, abstractmethod

class Sistema(ABC):
    @abstractmethod
    def informacion(self):
        pass

class Alumno(Sistema):
    def informacion(self):
        return 'Informacion del alumno a revisar: '
    
class Gestion(Sistema):    
    def __init__(self, gestor):
        self.gestor = gestor
        
    def informacion(self):
        return self.gestor.informacion()
   
class DatosPersonales(Gestion):
    def informacion(self):
        return self.gestor.informacion() + '[Datos personales]'

class HistorialAcademico(Gestion):
    def informacion(self):
        return self.gestor.informacion() + '[Historial academico]'

class InscripcionesCursos(Gestion):
    def informacion(self):
        return self.gestor.informacion() + '[Inscripciones a cursos]'

class SeguimientoProgreso(Gestion):
    def informacion(self):
        return self.gestor.informacion() + '[Seguimiento de progreso]'