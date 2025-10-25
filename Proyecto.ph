def mostrar_menu():
    print("\n--- GESTOR DE NOTAS - MENÚ ---")
    print("1) Registrar estudiantes y notas")
    print("2) Mostrar todos los estudiantes")
    print("3) Buscar estudiante (lineal)")
    print("4) Buscar estudiante (binaria)")
    print("5) Mostrar promedios por curso")
    print("6) Ver pila (historial)")
    print("7) Ver cola (revisión)")
    print("8) Ordenar promedios (burbuja / inserción)")
    print("9) Guardar pseudocódigo")
    print("0) Salir")

def pedir_entero_mensaje(mensaje):
    while True:
        try:
            numero = int(input(mensaje))
            return numero
        except:
            print("Por favor, ingrese un número entero válido.")

def pedir_float_validado(mensaje, minimo=0, maximo=100):
    while True:
        try:
            numero = float(input(mensaje))
            if numero < minimo or numero > maximo:
                print("La nota debe estar entre 0 y 100.")
            else:
                return numero
        except:
            print("Ingrese un número válido.")


# REGISTRO DE ESTUDIANTES

def registrar_estudiantes(lista_estudiantes):
    cantidad = pedir_entero_mensaje("¿Cuántos estudiantes desea registrar? ")

    if cantidad <= 0:
        print("Debe ser un número mayor que 0.")
        return 0

    for i in range(cantidad):
        print(f"\nEstudiante {i + 1}:")
        nombre = input("Nombre: ").strip()
        if nombre == "":
            nombre = f"Alumno{i + 1}"
            print("Nombre vacío, se asignó:", nombre)

        # Aca se solicitan las notas de los 3 cursos
        mate = pedir_float_validado("Nota de Matemática (0-100): ")
        lengua = pedir_float_validado("Nota de Lenguaje (0-100): ")
        compu = pedir_float_validado("Nota de Computación (0-100): ")

        estudiante = {
            "nombre": nombre,
            "matematica": mate,
            "lenguaje": lengua,
            "computacion": compu
        }

        lista_estudiantes.append(estudiante)

    print("\nEstudiantes registrados correctamente.")
    return cantidad


# MOSTRAR ESTUDIANTES

def mostrar_estudiantes(lista_estudiantes):
    if len(lista_estudiantes) == 0:
        print("No hay estudiantes registrados.")
        return

    print("\n--- LISTA DE ESTUDIANTES ---")
    for i, e in enumerate(lista_estudiantes):
        promedio = (e["matematica"] + e["lenguaje"] + e["computacion"]) / 3
        estado = "Aprobado" if promedio >= 60 else "Reprobado"

        print(f"\n{i + 1}) {e['nombre']}")
        print(f"   Matemática: {e['matematica']}")
        print(f"   Lenguaje: {e['lenguaje']}")
        print(f"   Computación: {e['computacion']}")
        print(f"   Promedio: {round(promedio, 2)} - {estado}")


# BÚSQUEDAS

def busqueda_lineal(lista_estudiantes, buscar):
    pasos = 0
    for i in range(len(lista_estudiantes)):
        pasos += 1
        if lista_estudiantes[i]["nombre"].lower() == buscar.lower():
            print(f"{buscar} encontrado en la posición {i} (pasos: {pasos})")
            return
    print(f"{buscar} no encontrado (pasos: {pasos})")

def busqueda_binaria(lista_estudiantes, buscar):
    if len(lista_estudiantes) == 0:
        print("No hay estudiantes registrados.")
        return
    
    # ordenar lista por nombre
    lista_ordenada = sorted(lista_estudiantes, key=lambda x: x["nombre"].lower())
    inicio = 0
    fin = len(lista_ordenada) - 1
    pasos = 0

    while inicio <= fin:
        pasos += 1
        medio = (inicio + fin) // 2
        nombre_medio = lista_ordenada[medio]["nombre"].lower()

        if nombre_medio == buscar.lower():
            print(f"{buscar} encontrado (pasos: {pasos})")
            return
        elif buscar.lower() < nombre_medio:
            fin = medio - 1
        else:
            inicio = medio + 1

    print(f"{buscar} no encontrado (pasos: {pasos})")



# PROMEDIOS

def mostrar_promedios(lista_estudiantes):
    if len(lista_estudiantes) == 0:
        print("No hay estudiantes registrados.")
        return

    total_mate = 0
    total_lengua = 0
    total_compu = 0

    for e in lista_estudiantes:
        total_mate += e["matematica"]
        total_lengua += e["lenguaje"]
        total_compu += e["computacion"]

    n = len(lista_estudiantes)

    print("\n--- PROMEDIOS POR CURSO ---")
    print("Matemática:", round(total_mate / n, 2))
    print("Lenguaje:", round(total_lengua / n, 2))
    print("Computación:", round(total_compu / n, 2))

    promedio_general = (total_mate + total_lengua + total_compu) / (n * 3)
    print("Promedio general del grupo:", round(promedio_general, 2))


# PILA Y COLA

def ver_pila(historial):
    print("\n--- PILA (Historial) ---")
    if len(historial) == 0:
        print("Historial vacío.")
        return
    print("Historial actual:", historial)
    ultima = historial.pop()
    print("Se quitó la última acción:", ultima)
    print("Historial ahora:", historial)

def ver_cola(lista_estudiantes):
    print("\n--- COLA (Revisión de estudiantes) ---")
    if len(lista_estudiantes) == 0:
        print("No hay estudiantes registrados.")
        return
    cola = [e["nombre"] for e in lista_estudiantes]
    print("Cola inicial:", cola)
    while len(cola) > 0:
        actual = cola.pop(0)
        print("Atendiendo a:", actual, "| Cola restante:", cola)



# ORDENAMIENTOS

def ordenamiento_burbuja(lista):
    lista_copia = lista.copy()
    n = len(lista_copia)
    for i in range(n - 1):
        for j in range(n - 1 - i):
            if lista_copia[j] > lista_copia[j + 1]:
                lista_copia[j], lista_copia[j + 1] = lista_copia[j + 1], lista_copia[j]
    return lista_copia

def ordenamiento_insercion(lista):
    lista_copia = lista.copy()
    for i in range(1, len(lista_copia)):
        clave = lista_copia[i]
        j = i - 1
        while j >= 0 and lista_copia[j] > clave:
            lista_copia[j + 1] = lista_copia[j]
            j -= 1
        lista_copia[j + 1] = clave
    return lista_copia



# GUARDAR PSEUDOCÓDIGO

def guardar_pseudocodigo():
    texto = (
        "PSEUDOCODIGO GESTOR DE NOTAS\n"
        "1. Mostrar menu\n"
        "2. Registrar estudiantes con 3 cursos\n"
        "3. Mostrar estudiantes\n"
        "4. Buscar (lineal y binaria)\n"
        "5. Mostrar promedios\n"
        "6. Mostrar pila y cola\n"
        "7. Ordenar promedios (burbuja e inserción)\n"
        "0. Salir\n"
    )
    with open("pseudocodigo.txt", "w", encoding="utf-8") as f:
        f.write(texto)
    print("Archivo pseudocodigo.txt guardado correctamente.")


# PROGRAMA PRINCIPAL

def main():
    estudiantes = []
    historial = []

    print("Bienvenido al Gestor de Notas (versión principiante).")

    while True:
        mostrar_menu()
        opcion = input("Seleccione una opción: ")

        if opcion == "1":
            cantidad = registrar_estudiantes(estudiantes)
            historial.append(f"Se registraron {cantidad} estudiantes")
        elif opcion == "2":
            mostrar_estudiantes(estudiantes)
            historial.append("Se mostraron estudiantes")
        elif opcion == "3":
            nombre = input("Nombre a buscar (lineal): ")
            busqueda_lineal(estudiantes, nombre)
            historial.append("Búsqueda lineal")
        elif opcion == "4":
            nombre = input("Nombre a buscar (binaria): ")
            busqueda_binaria(estudiantes, nombre)
            historial.append("Búsqueda binaria")
        elif opcion == "5":
            mostrar_promedios(estudiantes)
            historial.append("Se calcularon promedios")
        elif opcion == "6":
            ver_pila(historial)
        elif opcion == "7":
            ver_cola(estudiantes)
        elif opcion == "8":
            promedios = []
            for e in estudiantes:
                prom = (e["matematica"] + e["lenguaje"] + e["computacion"]) / 3
                promedios.append(prom)
            print("\nPromedios originales:", promedios)
            print("Burbuja:", ordenamiento_burbuja(promedios))
            print("Inserción:", ordenamiento_insercion(promedios))
            historial.append("Se usaron ordenamientos")
        elif opcion == "9":
            guardar_pseudocodigo()
            historial.append("Se guardó pseudocódigo")
        elif opcion == "0":
            print("Saliendo del programa... ¡Gracias!")
            break
        else:
            print("Opción no válida, intente de nuevo.")


# EJECUTAR
if __name__ == "__main__":
    main()
