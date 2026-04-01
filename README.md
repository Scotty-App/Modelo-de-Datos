# Plataforma Web de Aprendizaje de Programación — Base de Datos

## Descripción

Base de datos relacional diseñada para una plataforma web donde los usuarios pueden aprender distintos lenguajes de programación, inscribirse en cursos y realizar quizzes para evaluar su conocimiento.

---

## Tecnología

- **Motor de base de datos:** Microsoft SQL Server
- **Lenguaje:** T-SQL (compatible con SQL Server Management Studio)

---

## Tipos de usuario

El sistema contempla tres roles:

- **admin** — gestiona el contenido de la plataforma
- **normal** — usuario registrado con acceso completo
- **invitado** — acceso limitado sin registro completo

---

## Estructura de la base de datos

La base de datos está compuesta por 9 tablas:

### Usuarios
Almacena los datos de todos los usuarios del sistema: nombre, email, contraseña, tipo de usuario y fecha de registro.

### Lenguajes_Programacion
Catálogo de lenguajes disponibles en la plataforma, con su descripción y nivel de dificultad (principiante, intermedio, avanzado).

### Cursos
Cursos estructurados asociados a un lenguaje de programación concreto.

### Usuarios_Cursos
Tabla intermedia que resuelve la relación muchos a muchos entre usuarios y cursos. Almacena la fecha de inscripción y el estado (inscrito, en_progreso, completado, abandonado).

### Quiz
Cuestionarios vinculados a un lenguaje y con un nivel de dificultad definido.

### Preguntas
Ítems que componen cada quiz.

### Respuestas
Opciones de respuesta para cada pregunta. El campo `es_correcta` (BIT) indica cuál es la respuesta correcta.

### Resultados
Registra cada intento de un usuario en un quiz, guardando la puntuación obtenida y la fecha.

### Progreso
Hace seguimiento del porcentaje de avance de un usuario en cada lenguaje de programación.

---

## Modelo relacional

```
Usuarios            (id_usuario, nombre, email, contrasena, tipo_usuario, fecha_registro)
Lenguajes_Prog      (id_lenguaje, nombre, descripcion, nivel_dificultad)
Cursos              (id_curso, nombre, descripcion, id_lenguaje -> Lenguajes_Programacion)
Usuarios_Cursos     (id_usuario -> Usuarios, id_curso -> Cursos, fecha_inscripcion, estado)
Quiz                (id_quiz, titulo, id_lenguaje -> Lenguajes_Programacion, dificultad)
Preguntas           (id_pregunta, enunciado, id_quiz -> Quiz)
Respuestas          (id_respuesta, texto, es_correcta, id_pregunta -> Preguntas)
Resultados          (id_resultado, id_usuario -> Usuarios, id_quiz -> Quiz, puntuacion, fecha)
Progreso            (id_progreso, id_usuario -> Usuarios, id_lenguaje -> Lenguajes_Programacion, porcentaje_completado)
```

---

## Relaciones principales

| Relación | Tipo |
|---|---|
| Usuarios → Resultados | 1 : N |
| Usuarios → Progreso | 1 : N |
| Usuarios ↔ Cursos (vía Usuarios_Cursos) | N : M |
| Lenguajes_Programacion → Cursos | 1 : N |
| Lenguajes_Programacion → Quiz | 1 : N |
| Lenguajes_Programacion → Progreso | 1 : N |
| Quiz → Preguntas | 1 : N |
| Quiz → Resultados | 1 : N |
| Preguntas → Respuestas | 1 : N |

---

## Cómo ejecutar el script

1. Abrir **SQL Server Management Studio**
2. Conectarse a la instancia de SQL Server
3. Abrir el archivo `PlataformaProgramacion_DB.sql`
4. Ejecutar con `F5` o el botón **Ejecutar**

> Las tablas están ordenadas respetando las dependencias de claves foráneas, por lo que el script puede ejecutarse directamente sin errores de orden.

---

## Autor

José Ramón Castillo Amat (Miembro del Equipo de SCOTTY).
