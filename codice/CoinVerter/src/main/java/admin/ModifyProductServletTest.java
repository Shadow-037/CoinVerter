package admin;


import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Test;

import prodotti.ProductDaoDataSource;
import utenti.TestDataSource;


public class ModifyProductServletTest {

	
	@Before
    public void setup() {
        DataSource dataSource = TestDataSource.createMySQLDataSource();
        ProductDaoDataSource.setDataSource(dataSource);
    }
    
	
	@Test
	public void testDoPostHttpServletRequestHttpServletResponse() throws ServletException, IOException {
		// Istanzia la servlet
        ModifyProductServlet MServlet = new ModifyProductServlet();

        // Mock delle dipendenze
        HttpServletRequest request = mock(HttpServletRequest.class);
        HttpServletResponse response = mock(HttpServletResponse.class);
        HttpSession session = mock(HttpSession.class);
       	ServletConfig config = mock(ServletConfig.class);
       	ServletContext context = mock(ServletContext.class);
        
        
        
        // Configura il comportamento dei mock
        when(request.getParameter("id")).thenReturn("1");
        when(request.getSession()).thenReturn(session);
        when(config.getServletContext()).thenReturn(context);
        
        
        // Esegui il metodo doPost
        try {
			MServlet.doPost(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        // Verifica che la sessione sia stata aggiornata
        verify(session).setAttribute(eq("mprod"), any());

        // Verifica che il dispatcher sia stato chiamato
        try {
			verify(response).sendRedirect("admin/ModificaForm.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
