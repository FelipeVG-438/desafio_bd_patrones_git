from connection import DbConexion
from funcionesFactory import ProfesorFactory, AlumnoFactory, UsuarioFactory
from gestionEstudiantes import *
from reportes import *

db = DbConexion()

def funcionesEstudiante(): # Funciones que puede realizar un estudiante
    accion = input('Que desea revisar ? (inscripciones, horarios, calificaciones, salir): ')
    if accion != 'salir':
        estudiante = AlumnoFactory.execute_operation(accion)
        print(estudiante.informacion())
    
def funcionesProfesor(): # Funciones que puede realizar un profesor
    accion = input('Que desea revisar ? (cursos asignados, estudiantes inscritos, registrar calificacion, salir): ')
    if accion != 'salir':
        profesor = ProfesorFactory.execute_operation(accion)
        print(profesor.informacion())
    
    print("El usuario tiene acceso al sistema.")

def revisionAlumnos(): # Funciones de administrador para revisar informacion de los alumnos
    revision = input('Que desea revisar del alumnado? (datos personales, historial academico, inscripciones a cursos, seguimiento de progreso): ')
    revisiones = {'datos personales': DatosPersonales, 'historial academico': HistorialAcademico, 'inscripciones a cursos': InscripcionesCursos, 'seguimiento de progreso': SeguimientoProgreso, 'todo': Alumno}
    if revision in revisiones: # Se realiza la revision decidida
        alumno = revisiones[revision](Alumno())
        print(alumno.informacion())
    else:
        print('Opción no válida.')

def realizarReporte(): # Funcion para realizar reportes
    builder = Builder()
    reportes = Reportes(builder)
    reporte = None
    
    # Dependiendo el tipo de reporte escogido manda aquello que requiere ese reporte
    plantilla = input('Que tipo de reporte desea realizar? (rendimiento, estadisticas cursos, progreso programas, listado inscritos): ')
    if 'rendimiento' in plantilla:
        reporte = reportes.rendimientoEstudiantil()
        print(reporte.show())
    elif 'estadisticas' in plantilla:
        reporte = reportes.estadisticasCursos()
        print(reporte.show())
    elif 'progreso' in plantilla:
        reporte = reportes.progresoProgramas()
        print(reporte.show())
    elif 'listado' in plantilla:
        reporte = reportes.listadoInscritos()
        print(reporte.show())
    else:
        print('Opción no válida.')
        
if __name__ == '__main__':
    
    # Flujo para el programa
    accesos = input('Que tipo de usuario eres? (admin, profesor, estudiante): ')
    if accesos in ['admin', 'profesor', 'estudiante']:
        usuario = UsuarioFactory.crear_usuario(accesos) # Se crea el usuario
        
        # Dependiendo el tipo de usuario se le dan las opciones que puede realizar
        if 'admin' in accesos:
            tipo = input('Que desea hacer? (revision alumnos, realizar reporte, profesores, estudiantes, salir): ')
            if tipo != 'salir':
                if tipo == 'revision alumnos':
                    revisionAlumnos()
                if tipo == 'realizar reporte':
                    realizarReporte()
                elif tipo == 'profesores':
                    funcionesProfesor()
                elif tipo == 'estudiantes':
                    funcionesEstudiante()
                else:
                    print('Opción no válida.')
        elif 'profesor' in usuario.permiso():
            funcionesProfesor()
        elif 'estudiante' in usuario.permiso():
            funcionesEstudiante()
        else:
            print("No cuenta con los permisos necesarios del sistema.")
    else:
        print('Tipo de usuario desconocido.')