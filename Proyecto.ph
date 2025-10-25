#gestor_notas

def mostrar_menu():
    print("\n--- GESTOR DE NOTAS - MENÚ ---")
    print("1) Registrar estudiantes")
    print("2) Mostrar estudiantes")
    print("3) Buscar (lineal)")
    print("4) Buscar (binaria)")
    print("5) Mostrar promedio")
    print("6) Ver pila (historial)")
    print("7) Ver cola (revisión)")
    print("8) Ordenar notas (burbuja / inserción)")
    print("9) Guardar ejemplo de pseudocódigo (texto)")
    print("0) Salir")

def pedir_entero_mensaje(mensaje):
    # función auxiliar simple para pedir un entero
    while True:
        try:
            v = int(input(mensaje))
            return v
        except:
            print("Por favor, ingrese un número entero válido.")

def pedir_float_validado(mensaje, minimo=0.0, maximo=100.0):
    # pedir un número decimal
    while True:
        try:
            v = float(input(mensaje))
            if v < minimo or v > maximo:
                print(f"Valor fuera de rango. Debe estar entre {minimo} y {maximo}.")
            else:
                return v
        except:
            print("Entrada no válida. Escriba un número (ej: 75.5).")


# OPERACION PRINCIPAL
def registrar_estudiantes():
    nombres = []
    notas = []
    n = pedir_entero_mensaje("¿Cuántos estudiantes desea registrar? ")
    if n <= 0:
        print("Debe registrar al menos 1 estudiante.")
        return nombres, notas

    for i in range(n):
        print(f"\nEstudiante {i+1}:")
        nombre = input("  Nombre: ").strip()
        if nombre == "":
            nombre = f"Alumno{i+1}"   # evitar nombre vacío
            print("  Nombre vacío, se asignó:", nombre)
        nota = pedir_float_validado("  Nota (0-100): ", 0.0, 100.0)
        nombres.append(nombre)
        notas.append(nota)

    print("\nRegistros guardados correctamente.")
    return nombres, notas

def mostrar_estudiantes(nombres, notas):
    print("\n--- LISTA DE ESTUDIANTES ---")
    if len(nombres) == 0:
        print("No hay estudiantes registrados.")
        return
    for i in range(len(nombres)):
        estado = "Aprobado" if notas[i] >= 60 else "Reprobado"
        print(f"{i+1}) {nombres[i]} - {notas[i]} - {estado}")

def busqueda_lineal(nombres, buscar):
    pasos = 0
    for i in range(len(nombres)):
        pasos += 1
        if nombres[i].lower() == buscar.lower():
            print(f"{buscar} encontrado en posición {i} (pasos: {pasos})")
            return i, pasos
    print(f"{buscar} no encontrado (pasos: {pasos})")
    return -1, pasos

def busqueda_binaria(nombres, buscar):
    # la búsqueda binaria necesita lista ordenada
    if len(nombres) == 0:
        print("Lista vacía.")
        return -1, 0
    nombres_orden = sorted(nombres, key=lambda s: s.lower())
    inicio = 0
    fin = len(nombres_orden) - 1
    pasos = 0
    while inicio <= fin:
        pasos += 1
        medio = (inicio + fin) // 2
        medio_val = nombres_orden[medio].lower()
        if medio_val == buscar.lower():
            print(f"{buscar} encontrado en lista ordenada posición {medio} (pasos: {pasos})")
            return medio, pasos
        elif buscar.lower() < medio_val:
            fin = medio - 1
        else:
            inicio = medio + 1
    print(f"{buscar} no encontrado en lista ordenada (pasos: {pasos})")
    return -1, pasos

def calcular_promedio(notas):
    if len(notas) == 0:
        print("No hay notas registradas.")
        return None
    total = 0
    for n in notas:
        total = total + n
    prom = total / len(notas)
    print("\nPromedio del grupo:", round(prom, 2))
    return prom


# PILA y COLA
def ver_pila(historial):
    print("\n--- PILA (Historial de acciones) ---")
    if len(historial) == 0:
        print("Historial vacío.")
        return
    print("Historial (arriba = última):", historial)
    ultima = historial.pop()   # quita la última acción
    print("Se sacó:", ultima)
    print("Historial ahora:", historial)

def ver_cola(nombres):
    print("\n--- COLA (Revisión de estudiantes) ---")
    if len(nombres) == 0:
        print("No hay estudiantes en la cola.")
        return
    cola = nombres.copy()
    print("Cola inicial:", cola)
    while len(cola) > 0:
        persona = cola.pop(0)   # saca el primero
        print("Atendiendo a:", persona, " | Cola restante:", cola)

# ORDENAMIENTOS (burbuja e inserción)
def ordenamiento_burbuja(lista):
    a = lista.copy()
    n = len(a)
    for i in range(n-1):
        for j in range(n-1-i):
            if a[j] > a[j+1]:
                a[j], a[j+1] = a[j+1], a[j]
    return a

def ordenamiento_insercion(lista):
    a = lista.copy()
    for i in range(1, len(a)):
        clave = a[i]
        j = i - 1
        while j >= 0 and a[j] > clave:
            a[j+1] = a[j]
            j = j - 1
        a[j+1] = clave
    return a


# GUARDAR PSEUDOCODIGO 
def guardar_pseudocodigo():
    texto = (
        "PSEUDOCODIGO GESTOR DE NOTAS\n"
        "1. Mostrar menu\n"
        "2. Si opcion = 1 -> pedir estudiantes y notas, guardar en listas\n"
        "3. Si opcion = 2 -> mostrar estudiantes\n"
        "4. Si opcion = 3 -> pedir nombre, hacer busqueda lineal\n"
        "5. Si opcion = 4 -> pedir nombre, hacer busqueda binaria (usar lista ordenada)\n"
        "6. Si opcion = 5 -> calcular promedio\n"
        "7. Si opcion = 6 -> mostrar pila (pop)\n"
        "8. Si opcion = 7 -> mostrar cola (pop(0))\n"
        "9. Si opcion = 8 -> mostrar ordenamientos burbuja e insercion\n"
        "0. Salir\n"
    )
    try:
        with open("pseudocodigo.txt", "w", encoding="utf-8") as f:
            f.write(texto)
        print("pseudocodigo.txt guardado en la carpeta actual.")
    except:
        print("Error al guardar pseudocodigo (quizá permisos de carpeta).")


# PROGRAMA PRINCIPAL (menú)
def main():
    nombres = []
    notas = []
    historial = []

    print("Bienvenido al Gestor de Notas (versión principiante).")
    while True:
        mostrar_menu()
        opcion = input("Seleccione una opción: ").strip()
        if opcion == "1":
            n, m = registrar_estudiantes_simple(nombres, notas)
            # la función que registra añade a las listas existentes, retorna contadores simples
            historial.append(f"Se registraron {m} estudiantes")
        elif opcion == "2":
            mostrar_estudiantes(nombres, notas)
            historial.append("Se mostraron estudiantes")
        elif opcion == "3":
            if len(nombres) == 0:
                print("No hay estudiantes registrados para buscar.")
            else:
                buscar = input("Nombre a buscar (lineal): ")
                busqueda_lineal(nombres, buscar)
                historial.append("Búsqueda lineal")
        elif opcion == "4":
            if len(nombres) == 0:
                print("No hay estudiantes registrados para buscar.")
            else:
                buscar = input("Nombre a buscar (binaria): ")
                busqueda_binaria(nombres, buscar)
                historial.append("Búsqueda binaria")
        elif opcion == "5":
            calcular_promedio(notas)
            historial.append("Calculo promedio")
        elif opcion == "6":
            ver_pila(historial)
        elif opcion == "7":
            ver_cola(nombres)
        elif opcion == "8":
            print("\nNotas originales:", notas)
            print("Burbuja:", ordenamiento_burbuja(notas))
            print("Inserción:", ordenamiento_insercion(notas))
            historial.append("Ordenamientos mostrados")
        elif opcion == "9":
            guardar_pseudocodigo()
            historial.append("Se guardó pseudocodigo.txt")
        elif opcion == "0":
            print("Saliendo... ¡gracias!")
            break
        else:
            print("Opción no válida. Intente otra vez.")

# Función auxiliar que permite añadir nuevos registros a las listas existentes
def registrar_estudiantes_simple(nombres, notas):
    cantidad = pedir_entero_mensaje("¿Cuántos estudiantes desea agregar ahora? ")
    agregados = 0
    if cantidad <= 0:
        print("Debe ser un número mayor que 0.")
        return cantidad, agregados
    for i in range(cantidad):
        nombre = input(f"Nombre del estudiante {len(nombres)+1}: ").strip()
        if nombre == "":
            nombre = f"Alumno{len(nombres)+1}"
            print("Nombre vacío, se asignó:", nombre)
        nota = pedir_float_validado("Nota (0-100): ", 0.0, 100.0)
        nombres.append(nombre)
        notas.append(nota)
        agregados += 1
    print(f"{agregados} estudiantes agregados.")
    return cantidad, agregados

# Ejecutar si se llama directamente
if __name__ == "__main__":
    main()
