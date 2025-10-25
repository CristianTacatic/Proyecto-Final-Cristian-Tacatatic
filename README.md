MANUAL TÉCNICO - GESTOR DE NOTAS

1. Descripción técnica
   Programa en Python que gestiona registros de estudiantes (nombre y nota).
   Ejecutable en línea de comandos. No usa librerías externas.

2. Estructura de archivos
   - gestor_notas.py : código principal
   - pseudocodigo.txt : pseudocódigo generado

3. Estructura del código
   - Funciones: mostrar_menu, registrar_estudiantes_simple, mostrar_estudiantes, busqueda_lineal, busqueda_binaria, calcular_promedio, ver_pila, ver_cola, ordenamiento_burbuja, ordenamiento_insercion, guardar_pseudocodigo.
   - Variables principales: listas `nombres`, `notas`, lista `historial`.

4. Uso de listas, pilas y colas
   - Listas: guardan nombres y notas.
   - Pila: la lista `historial` usa pop() para sacar la última acción.
   - Cola: se copia la lista de nombres y se usa pop(0) para sacar el primero.

5. Algoritmos de ordenamiento
   - Burbuja: explicado con un breve párrafo (compara pares y los intercambia).
   - Inserción: explicado con un breve párrafo (inserta cada elemento en la sublista ordenada).

6. Validaciones
   - Verificación de enteros y flotantes.
   - Rango de notas entre 0 y 100.
   - Nombres vacíos se reemplazan por un nombre por defecto.







MANUAL DE USUARIO - GESTOR DE NOTAS

Objetivo:
Registrar estudiantes y notas, buscar nombres, calcular promedio y ver ejemplos de pilas, colas y ordenamientos.

Requisitos:
- Tener instalado Python 
- Ejecutar desde la línea de comandos

Cómo ejecutar:
1. Abra la terminal (CMD, PowerShell, Terminal).
2. Vaya a la carpeta donde está `gestor_notas.py`.
3. Ejecute: python gestor_notas.py

Uso del menú:
- Opción 1: Registrar estudiantes (pida cantidad, luego nombre y nota).
- Opción 2: Mostrar la lista con estado (Aprobado/Reprobado).
- Opción 3: Buscar por nombre (lineal).
- Opción 4: Buscar por nombre (binaria, requiere lista ordenada internamente).
- Opción 5: Mostrar promedio del grupo.
- Opción 6: Ver pila (historial) y quitar última acción.
- Opción 7: Ver cola (atender estudiantes en orden).
- Opción 8: Ver notas ordenadas por burbuja e inserción.
- Opción 9: Guardar pseudocódigo en `pseudocodigo.txt`.
- Opción 0: Salir.

Errores comunes:
- Introducir letras cuando se pide número.
- No haber registrado estudiantes antes de buscar.



