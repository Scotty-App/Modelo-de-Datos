CREATE TABLE Usuarios (
id_usuario INT PRIMARY KEY NOT NULL
, nombre VARCHAR(100) NOT NULL
, email VARCHAR(150) NOT NULL
, contrasena VARCHAR(255) NOT NULL
, tipo_usuario VARCHAR(10) NOT NULL
, fecha_registro DATETIME NOT NULL
)

CREATE TABLE Lenguajes_Programacion (
id_lenguaje INT PRIMARY KEY NOT NULL
, nombre VARCHAR(80) NOT NULL
, descripcion VARCHAR(MAX) NULL
, nivel_dificultad NVARCHAR(15) NOT NULL
)

CREATE TABLE Cursos (
id_curso INT PRIMARY KEY NOT NULL
, nombre VARCHAR(150) NOT NULL
, descripcion VARCHAR(MAX) NULL
, id_lenguaje INT NOT NULL
, FOREIGN KEY (id_lenguaje) REFERENCES Lenguajes_Programacion (id_lenguaje)
)

CREATE TABLE Usuarios_Cursos (
id_usuario INT NOT NULL
, id_curso INT NOT NULL
, fecha_inscripcion DATE NOT NULL
, estado VARCHAR(15) NOT NULL
, PRIMARY KEY (id_usuario, id_curso)
, FOREIGN KEY (id_usuario) REFERENCES Usuarios (id_usuario)
, FOREIGN KEY (id_curso) REFERENCES Cursos (id_curso)
)

CREATE TABLE Quiz (
id_quiz INT PRIMARY KEY NOT NULL
, titulo VARCHAR(150) NOT NULL
, id_lenguaje INT NOT NULL
, dificultad NVARCHAR(15) NOT NULL
, FOREIGN KEY (id_lenguaje) REFERENCES Lenguajes_Programacion (id_lenguaje)
)

CREATE TABLE Preguntas (
id_pregunta INT PRIMARY KEY NOT NULL
, enunciado VARCHAR(MAX) NOT NULL
, id_quiz INT NOT NULL
, FOREIGN KEY (id_quiz) REFERENCES Quiz (id_quiz)
)

CREATE TABLE Respuestas (
id_respuesta INT PRIMARY KEY NOT NULL
, texto VARCHAR(500) NOT NULL
, es_correcta BIT NOT NULL
, id_pregunta INT NOT NULL
, FOREIGN KEY (id_pregunta) REFERENCES Preguntas (id_pregunta)
)

CREATE TABLE Resultados (
id_resultado INT PRIMARY KEY NOT NULL
, id_usuario INT NOT NULL
, id_quiz INT NOT NULL
, puntuacion INT NOT NULL
, fecha DATETIME NOT NULL
, FOREIGN KEY (id_usuario) REFERENCES Usuarios (id_usuario)
, FOREIGN KEY (id_quiz) REFERENCES Quiz (id_quiz)
)

CREATE TABLE Progreso (
id_progreso INT PRIMARY KEY NOT NULL
, id_usuario INT NOT NULL
, id_lenguaje INT NOT NULL
, porcentaje_completado DECIMAL(5,2) NOT NULL
, FOREIGN KEY (id_usuario)  REFERENCES Usuarios (id_usuario)
, FOREIGN KEY (id_lenguaje) REFERENCES Lenguajes_Programacion (id_lenguaje)
)