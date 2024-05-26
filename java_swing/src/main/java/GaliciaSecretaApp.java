
import controller.view.Controller;
import view.Vista;
/**
 *
 * @author Lucía Méndez Rodríguez
 */
public class GaliciaSecretaApp {
        public static void main(String[] args) {
        Vista vista = new Vista();
        Controller controller = new Controller(vista);
        vista.setVisible(true);
        controller.iniciar();
        
    }
}
