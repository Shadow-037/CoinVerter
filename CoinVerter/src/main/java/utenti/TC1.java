package utenti;

import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.junit.Before;

import org.junit.Test;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import java.io.IOException;

import java.util.List;

public class TC1 { 

	@Before
	public void setupJNDI() throws Exception {
	   
		DataSource ds;
		final String TABLE_NAME = "utente";

		
			try {
				Context initCtx = new InitialContext();
				Context envCtx = (Context) initCtx.lookup("java:comp/env");

				ds = (DataSource) envCtx.lookup("jdbc/coinverter");

			} catch (NamingException e) {
				System.out.println("Error:" + e.getMessage());
			}
		}
	
	
	
    @Test
    public void testCredenzialiCorrette() throws ServletException, IOException {
        // Crea un'istanza della servlet
        Login loginServlet = new Login();

        // Crea mock per HttpServletRequest e HttpServletResponse
        HttpServletRequest request = mock(HttpServletRequest.class);
        HttpServletResponse response = mock(HttpServletResponse.class);

        // Imposta le credenziali di login corrette
        when(request.getParameter("email")).thenReturn("pincopallino@mail.com");
        when(request.getParameter("pwd")).thenReturn("testpas$");

        // Esegui il metodo doPost della servlet
        loginServlet.doPost(request, response);

        // Verifica che la risposta sia quella attesa
        // Puoi verificare il comportamento della servlet, come il reindirizzamento
        verify(response).sendRedirect("index.jsp");
    }

    @Test
    public void testFormatoMailErrato() throws ServletException, IOException {
    	 // Crea un'istanza della servlet
        Login loginServlet = new Login();

        // Crea mock per HttpServletRequest e HttpServletResponse
        HttpServletRequest request = mock(HttpServletRequest.class);
        HttpServletResponse response = mock(HttpServletResponse.class);

        // Imposta le credenziali di login corrette
        when(request.getParameter("email")).thenReturn("pincopallinomail.com");
        when(request.getParameter("pwd")).thenReturn("testpas$");

        // Esegui il metodo doPost della servlet
        loginServlet.doPost(request, response);

        // Verifica che la risposta sia quella attesa
        // Puoi verificare il comportamento della servlet, come il reindirizzamento
        List<String> errors = (List<String>)request.getAttribute("errors");
        assertTrue(errors.isEmpty());
    }

}
