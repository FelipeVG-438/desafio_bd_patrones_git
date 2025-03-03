class Reporte:
    def __init__(self):
        self.info = []
    
    def add_info(self, info):
        self.info.append(info)
    
    def show(self):
        return 'Información consultada: '  + ', '.join(self.info)

class Builder:
    def __init__(self):
        self.product = Reporte()
    
    def alumno(self):
        self.product.add_info('Alumno')
        return self
    
    def calificaciones(self):
        self.product.add_info('Calificaciones')
        return self
    
    def profesor(self):
        self.product.add_info('Profesor')
        return self
    
    def parcial(self):
        self.product.add_info('Parcial')
        return self
    
    def curso(self):
        self.product.add_info('Curso')
        return self
    
    def programa(self):
        self.product.add_info('Programa')
        return self
    
    def get_product(self):
        return self.product

class Reportes:
    def __init__(self, builder):
        self.builder = builder
    
    def rendimientoEstudiantil(self):
        return self.builder.alumno().calificaciones().get_product()
    
    def estadisticasCursos(self):
        return self.builder.curso().calificaciones().get_product()
    
    def progresoProgramas(self):
        return self.builder.programa().parcial().get_product()
    
    def listadoInscritos(self):
        return self.builder.alumno().curso().get_product()