from connection import DbConexion
from funcionesFactory import ProfesorFactory, AlumnoFactory, UsuarioFactory
from gestionEstudiantes import *
from reportes import *

db = DbConexion()

def funcionesEstudiante():
    accion = input('Que desea revisar ? (inscripciones, horarios, calificaciones, salir): ')
    if accion != 'salir':
        estudiante = AlumnoFactory.execute_operation(accion)
        print(estudiante.informacion())
    
def funcionesProfesor():
    accion = input('Que desea revisar ? (cursos asignados, estudiantes inscritos, registrar calificacion, salir): ')
    if accion != 'salir':
        profesor = ProfesorFactory.execute_operation(accion)
        print(profesor.informacion())
    
    print("El usuario tiene acceso al sistema.")

def revisionAlumnos():
    revision = input('Que desea revisar del alumnado? (datos personales, historial academico, inscripciones a cursos, seguimiento de progreso): ')
    revisiones = {'datos personales': DatosPersonales, 'historial academico': HistorialAcademico, 'inscripciones a cursos': InscripcionesCursos, 'seguimiento de progreso': SeguimientoProgreso, 'todo': Alumno}
    if revision in revisiones:
        alumno = revisiones[revision](Alumno())
        print(alumno.informacion())
    else:
        print('Opción no válida.')

def realizarReporte():
    builder = Builder()
    reportes = Reportes(builder)
    reporte = None
    
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
    
    accesos = input('Que tipo de usuario eres? (admin, profesor, estudiante): ')
    if accesos in ['admin', 'profesor', 'estudiante']:
        usuario = UsuarioFactory.crear_usuario(accesos)
        
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