class DbConexion:
    _instance = None  # Atributo privado

    def __new__(cls, *args, **kwargs):
        if cls._instance is None:
            cls._instance = super(DbConexion, cls).__new__(cls, *args, **kwargs)
            cls._instance._engine = cls._conectar_db()
        return cls._instance

    @staticmethod
    def _conectar_db():
        try:
            engine = 'POSTGRESQL_CONNECTION'
            print("Conexión exitosa")
            return engine
        except Exception as e:
            print("Error al conectar a la base de datos:", e)
            return None