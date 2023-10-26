import javax.swing.JOptionPane;

public class JORDI_BELDA_PracticaObligatoria_1 {
    // Partiendo del siguiente documento, implementad en java el juego de pares y
    // nones que se describe. Debeis tener en cuenta lo siguiente:

    // Para la entrada/salida de datos podéis utilizar el sistema que más cómo os
    // resulte: por consola o por medio de clases del paquete Swing de java.
    // Añadid los comentarios en el código que considereis oportunos para explicar
    // el desarrollo realizado
    // El fichero .java entregado deberá compilar. No será válida la entrega (y por
    // tanto no se correjirá) de un fichero .java con errores de código que no
    // permita ejecutarlo mínimamente.
    // Una vez implementado, entregad como solución de la práctica el fichero .java
    // creado.
    public static void main(String[] args) throws Exception {
        int results[][] = new int[5][4];
        // FILAS ARRAY = PARTIDAS
        // COLUMNAS ARRAY : 1. NUMERO USUARIO 2. NUMERO
        // MAQUINA 3. ELECCION USUARIO [0-PARES;1-NONES]
        // 4.RESULTADO[0-GANA USUARIO;1-GANA MAQUINA ]
        int round = 1;

        String titlePresentation = "Bienvenido al juego de pares o nones";
        String messagePresentation = "<html>Usted va a jugar al juego de pares o nones, condiciones :<br><br><p>1. Jugará contra la maquina</p><p>2. Primero deberá elegir si quiere pares o nones</p><p>3. Elegirá un número de 0 a 50</p><p>4. Si la suma de su numero y el de la maquina es par ganan PARES si no NONES</p><p>5. El mejor de 5 gana la partida</p></html> ";
        String titleProgram = "RONDA ";
        String messageParNone = "Elija: ";
        String parNon[] = { "Nones", "Pares" };
        String messageNum = "Ingrese un numero: ";
        String titleFinal = "RESULTADOS";

        // PANTALLA INFO
        JOptionPane.showMessageDialog(null, messagePresentation, titlePresentation,
                JOptionPane.INFORMATION_MESSAGE);

        for (int i = 0; i < 5; i++) {
            int parNonElection = JOptionPane.showOptionDialog(null, messageParNone, titleProgram + round,
                    JOptionPane.DEFAULT_OPTION,
                    JOptionPane.INFORMATION_MESSAGE, null,
                    parNon, null);

            // PARES = 0 NONES =1
            if (parNonElection >= 0) {
                String stringNum = JOptionPane.showInputDialog(null, messageNum, titleProgram + round,
                        JOptionPane.PLAIN_MESSAGE);
                int num = Integer.parseInt(stringNum);
                // GENERAR NUMERO DE LA MAQUINA
                int machineNum = numGenerator();
                // VARIABLE GANADOR
                int winner = 0;

                if (num >= 0 && num <= 50) {

                    if (parNonElection == 1 && (machineNum + num) % 2 == 0) {
                        // ELIGE PARES Y SALE PARES
                        JOptionPane.showMessageDialog(null,
                                "<html> Ha ganado !!<br> Usted ha elegido PARES<br>La suma de ambos numeros es :<b> "
                                        + (machineNum + num) + "</b><br>Su numero elegido ha sido " + num
                                        + "<br>El numero elegido por la máquina ha sido " + machineNum
                                        + "</html>",
                                titleProgram + round,
                                JOptionPane.PLAIN_MESSAGE);

                    } else if (parNonElection == 1 && (machineNum + num) % 2 != 0) {
                        // ELIGE PARES Y SALE NONES
                        JOptionPane.showMessageDialog(null,
                                "<html> Ha perdido !!<br> Usted ha elegido PARES<br>La suma de ambos numeros es :<b> "
                                        + (machineNum + num) + "</b><br>Su numero elegido ha sido " + num
                                        + "<br>El numero elegido por la máquina ha sido " + machineNum
                                        + "</html>",
                                titleProgram + round,
                                JOptionPane.PLAIN_MESSAGE);
                        winner = 1;
                    } else if (parNonElection == 0 && (machineNum + num) % 2 == 0) {
                        // ELIGE NONES Y SALE PARES
                        JOptionPane.showMessageDialog(null,
                                "<html> Ha perdido !!<br> Usted ha elegido NONES<br>La suma de ambos numeros es : <b>"
                                        + (machineNum + num) + "</b><br>Su numero elegido ha sido " + num
                                        + "<br>El numero elegido por la máquina ha sido " + machineNum
                                        + "</html>",
                                titleProgram + round,
                                JOptionPane.PLAIN_MESSAGE);
                        winner = 1;
                    } else if (parNonElection == 0 && (machineNum + num) % 2 != 0) {
                        // ELIGE NONES Y SALE NONES
                        JOptionPane.showMessageDialog(null,
                                "<html> Ha ganado !!<br> Usted ha elegido NONES<br>La suma de ambos numeros es :<b> "
                                        + (machineNum + num) + "</b><br>Su numero elegido ha sido " + num
                                        + "<br>El numero elegido por la máquina ha sido " + machineNum
                                        + "</html>",
                                titleProgram + round,
                                JOptionPane.PLAIN_MESSAGE);
                    }

                }
                round++;
                int res[] = { num, machineNum, parNonElection, winner };
                results[i] = res;
                winner = 0;
            }

            if (parNonElection == -1) {

                break;

            }

        }

        int countRes = 0;

        // GENERAR CABECERAS TABLA FINAL
        StringBuilder finalResults = new StringBuilder(
                "<html><table><tr><td><b>Ronda</b></td><td><b>N˚Usuario</b></td><td><b>N˚Maquina</b></td><td><b>Eleccion_Usuario</b></td><td><b>GANA</b></td></tr>");

        // LOOP PARA POPULAR TABLA FINAL
        for (int j = 0; j < results.length; j++) {
            finalResults
                    .append("<tr>");
            finalResults.append("<td>");
            // N˚ DE RONDA
            finalResults.append(j + 1);
            finalResults.append("</td>");
            for (int j2 = 0; j2 < results[j].length; j2++) {
                // RESULTADOS
                if (j2 == 2 && results[j][2] == 0) {
                    finalResults.append("<td>NONES</td>");
                } else if (j2 == 2 && results[j][2] == 1) {
                    finalResults.append("<td>PARES</td>");
                } else if (j2 == 3 && results[j][3] == 0) {
                    finalResults.append("<td>USUARIO</td>");
                } else if (j2 == 3 && results[j][3] == 1) {
                    finalResults.append("<td>MÁQUINA</td>");
                    countRes++;
                } else {
                    finalResults.append("<td>" + results[j][j2] + "</td>");
                }

            }
            finalResults.append("</tr><br>");
        }
        if (countRes > 2) {
            finalResults.append("<tr><tdcolspan=5><b>GANA LA MÁQUINA</b></td></tr>");
        } else {
            finalResults.append("<tr><tdcolspan=5><b>GANA EL USUARIO</b></td></tr>");
        }

        finalResults.append("</table></html>");

        JOptionPane.showMessageDialog(null, finalResults, titleFinal, JOptionPane.PLAIN_MESSAGE);
        System.out.println(countRes);

    }

    public static int numGenerator() {
        double random = Math.random() * 50;
        int num = (int) Math.round(random);
        return num;

    }
}
