
// Autor: Jordi Belda Calabuig 1˚DAW SEMI 2023
import java.util.Scanner;

public class JORDI_BELDA_Practica_Recetas {
    public static Scanner entrada = new Scanner(System.in);

    public static void main(String[] args) {

        boolean finalizarMenu = false;
        int opcionSeleccionada;
        String listadoRecetas[][] = inicializarListadoRecetas();

        do {
            pintarMenu();
            System.out.print("SELECCIONE UNA OPCIÓN : ");
            opcionSeleccionada = entrada.nextInt();
            entrada.nextLine();

            switch (opcionSeleccionada) {
                case 1:
                    // TODO -> llamada al método almacenarReceta que recibirá como parámetros el
                    // listado de recetas y la opcion seleccionada por el usuario
                    almacenarReceta(listadoRecetas, opcionSeleccionada);
                    break;
                case 2:
                    // Obtenemos el indice de la receta a eliminar llamando a la función
                    // elegirReceta
                    int indiceRecetaAEliminar = elegirReceta(listadoRecetas);
                    if (indiceRecetaAEliminar != -1) {
                        boolean existeRecetaAEliminar = !listadoRecetas[indiceRecetaAEliminar][0].equals("");
                        if (existeRecetaAEliminar) {
                            eliminarReceta(listadoRecetas, indiceRecetaAEliminar);
                        } else {
                            System.out.println("El índice seleccionado no contienen ninguna receta almacenada");
                        }
                    }
                    break;
                case 3:

                    // TODO -> Implementar lógica necesaria para visualizar una receta seleccionada
                    // por el usuario. Esta implementación es prácticamente idéntica a la del caso
                    // anterior (case 2). La única diferencia es que, una vez seleccionado el índice
                    // de la receta a visualizar, llamaremos al método visualizarReceta en lugar del
                    // eliminarReceta
                    int indiceRecetaMostrar = elegirReceta(listadoRecetas);

                    if (indiceRecetaMostrar != -1) {
                        boolean existeRecetaMostrar = !listadoRecetas[indiceRecetaMostrar][0].equals("");
                        if (existeRecetaMostrar) {
                            visualizarReceta(listadoRecetas, indiceRecetaMostrar);
                        } else {
                            System.out.println("El índice seleccionado no contienen ninguna receta almacenada");
                        }
                    }

                    break;
                case 4:
                    // TODO -> llamada al método listarRecetas al que le pasamos como parámetro el
                    // listado de recetas
                    listarRecetas(listadoRecetas);
                    break;
                case 5:
                    finalizarMenu = true;
                    break;
                default:
                    System.out.println("Opción incorrecta. Por favor, seleccione 1, 2, 3 o 4.");
                    break;
            }

        } while (!finalizarMenu);

    }

    /**
     * Función encargada de inicializar el array de recetas. Recorre todas las
     * posiciones del array y establece los valores a "" (cadena vacía)
     * 
     * @return
     */
    public static String[][] inicializarListadoRecetas() {
        String listadoRecetas[][] = new String[10][4];
        for (int i = 0; i < listadoRecetas.length; i++) {
            listadoRecetas[i][0] = "";
            listadoRecetas[i][1] = "";
            listadoRecetas[i][2] = "";
            listadoRecetas[i][3] = "";
        }
        return listadoRecetas;
    }

    /**
     * Función encargada de listar todas las recetas almacenadas en el sistema. En
     * primer lugar verifica que exista alguna en el listado y, de ser así, imprime
     * el nombre y descripción de cada una
     * 
     * @param listadoRecetas
     * @return
     */
    public static boolean listarRecetas(String[][] listadoRecetas) {
        if (!existeAlgunaReceta(listadoRecetas)) {
            System.out.println("No existen recetas almacenadas");
            return false;
        } else {
            System.out.println("--------- RECETAS ALMACENADAS ------------");
            for (int i = 0; i < listadoRecetas.length; i++) {
                if (!listadoRecetas[i][0].equals("")) {
                    System.out.println((i) + ". " + listadoRecetas[i][0] + ": " + listadoRecetas[i][1]);
                }
            }
            return true;
        }
    }

    /**
     * Función encargada de mostrar por consola el listado de recetas almacenadas.
     * En caso que no exista ninguna, se informará al usuario con el siguiente
     * mensaje: "No existen recetas almacenadas"
     * 
     * @param listadoRecetas
     * @param indiceRecetaAVisualizar
     */
    public static void visualizarReceta(String[][] listadoRecetas, int indiceRecetaAVisualizar) {
        String recetaSeleccionada[] = listadoRecetas[indiceRecetaAVisualizar];
        String nombreRecetaSeleccionada = recetaSeleccionada[0];
        if (!nombreRecetaSeleccionada.equals("")) {
            System.out.println("\n----ESTOS SON LOS DATOS DE LA RECETA SELECCIONADA----");
            System.out.println("--------- " + nombreRecetaSeleccionada + " ------------");
            System.out.println("DESCRIPCIÓN: " + recetaSeleccionada[1]);
            System.out.println("INGREDIENTES: " + recetaSeleccionada[2]);
            System.out.println("PREPARACIÓN: " + recetaSeleccionada[3]);
        }
    }

    /**
     * Función encargada de comprobar si existe alguna receta almacenada. Recorre el
     * array de recetas y, si encuentra una con el nombre establecido (esto es,
     * distinto de cadena vacía) retorna true.Si ninguna posición del array contiene
     * un nombre de receta almacenado retorna false
     * 
     * @param listadoRecetas Listado de recetas almacenadas en el sistema
     * @return Retorna true si encuentra alguna posición del array cuyo nombre de
     *         receta no sea cadena vacía y false en caso contrario
     */
    // TODO -> Completar el código de la función existeAlgunaReceta siguiendo las
    // indicaciones de los comentarios
    public static boolean existeAlgunaReceta(String[][] listadoRecetas) {
        for (String[] receta : listadoRecetas) {
            if (receta[0] != "") {
                return true;
            }
        }

        return false;
    }

    /**
     * Función encargada de eliminar del listado de recetas aquella que se encuentra
     * en el índice recibido como parámetro. La eliminación consistirá en establecer
     * a cadena vacía todos los campos de la receta en cuestión
     * 
     * @param listadoRecetas
     * @param indiceRecetaSeleccionada
     */
    public static void eliminarReceta(String[][] listadoRecetas, int indiceRecetaSeleccionada) {
        listadoRecetas[indiceRecetaSeleccionada][0] = "";
        listadoRecetas[indiceRecetaSeleccionada][1] = "";
        listadoRecetas[indiceRecetaSeleccionada][2] = "";
        listadoRecetas[indiceRecetaSeleccionada][3] = "";
        System.out.println("Receta elminada correctamente");
    }

    /**
     * Función encargada de pedir al usuario una palabra a buscar y muestra todas
     * aquellas recetas cuyo texto introducido forme parte del título de la receta
     * 
     * @param listadoRecetas
     * @return
     */
    public static int elegirReceta(String[][] listadoRecetas) {
        int recetaSeleccionada = -1;
        System.out.println("\n----ELECCIÓN DE RECETA----");
        boolean existenRecetas = listarRecetas(listadoRecetas);
        if (existenRecetas) {
            System.out.print("Por favor, seleccione una receta del listado : ");
            recetaSeleccionada = entrada.nextInt();
            entrada.nextLine();
        }
        return recetaSeleccionada;
    }

    /**
     * Función encargada de almacenar una nueva receta. Pedirá al usuario toda la
     * información necesaria y buscará la primera posición libre en donde se pueda
     * almacenar y retornará true si el almacenamiento es satisfactorio. En caso de
     * estar todo el listado completo, retornará false
     * 
     * @param listadoRecetas
     * @param opcion
     * @return
     */
    public static void almacenarReceta(String[][] listadoRecetas, int opcion) {

        // Obtenemos la primera posición libre del array de recetas
        int posicionLibre = buscarPosicionLibre(listadoRecetas);
        // Si posicionLibre no es -1 significa que podemos almacenar la nueva receta en
        // dicha posición del array
        if (posicionLibre != -1) {
            String nombreReceta = "";
            System.out.println("\n----INTRODUZCA LOS DATOS DE LA NUEVA RECETA----");
            do {
                System.out.print("Nombre de la receta (Obligatorio): ");
                nombreReceta = entrada.nextLine();
                // SI DEIXAVA SENSE CONTINGUT EL NOM DE LA RECETA, EL BUCLE DE mostrarRecetas NO
                // FUNCIONAVA CORRECTAMENT PERQUE FILTRA PER EL TITOL DE RECEPTA.
            } while (nombreReceta.length() == 0);

            // TODO -> Completar la petición del resto de campos de la receta (descripción,
            // ingredientes y elaboración)
            System.out.print("Descripción de la receta : ");
            String descripcionReceta = entrada.nextLine();
            System.out.print("Ingredientes de la receta : ");
            String ingredientesReceta = entrada.nextLine();
            System.out.print("Elaboración de la receta : ");
            String elaboracionReceta = entrada.nextLine();

            // Procedemos a registrar cada campo introducido por el usuario en la posición
            // del array correspondiente

            listadoRecetas[posicionLibre][0] = nombreReceta;
            // TODO -> almacenar el resto de campos en la posición del array correspondiente
            listadoRecetas[posicionLibre][1] = descripcionReceta;
            listadoRecetas[posicionLibre][2] = ingredientesReceta;
            listadoRecetas[posicionLibre][3] = elaboracionReceta;

            System.out.println("Se ha almacenado correctamente la receta");
        } else {
            System.out.println("No existe espacio para poder almacenar una nueva receta");
        }

    }

    /**
     * Función encargada de retornar el primer índice del array de recetas cuyo
     * nombre sea igual a la cadena vacía. Retornará el índice de la posición o -1
     * en caso que no haya posiciones libres
     * 
     * @param listadoRecetas Listado de recetas almacenadas en el sistema
     * @return Entero con la primera posición libre o -1 en caso de no existir
     *         ninguna
     */

    // TODO -> Completar el código de la función buscarPosicionLibre siguiendo las
    // indicaciones de los comentarios
    public static int buscarPosicionLibre(String[][] listadoRecetas) {
        for (int i = 0; i < listadoRecetas.length; i++) {
            if (listadoRecetas[i][0] == "") {
                return i;
            }
        }
        return -1;
    }

    public static void pintarMenu() {
        System.out.println("\n----GESTIÓN DE RECETAS----\n");
        System.out.println("1. Almacenar nueva receta");
        System.out.println("2. Eliminar una receta");
        System.out.println("3. Visualizar una receta");
        System.out.println("4. Listar recetas almacenadas");
        System.out.println("5. Salir\n");
    }

}
