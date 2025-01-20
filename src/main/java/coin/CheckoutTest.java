package coin;

import static org.junit.Assert.*;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Test;
import org.mockito.BDDMockito.Then;
import org.mockito.InjectMocks;
import org.mockito.Mock;

import prodotti.ProductBean;
import prodotti.ProductDaoDataSource;
import utenti.TestDataSource;
import utenti.User;

public class CheckoutTest {

	@Before
    public void setup() {
        DataSource dataSource = TestDataSource.createMySQLDataSource();
        ProductDaoDataSource.setDataSource(dataSource);
    }
    

	@Test
	public void testDoGetHttpServletRequestHttpServletResponse() {
		
		//setup prodotto
		Checkout CServlet = new Checkout();
		
		// Mock delle dipendenze
        HttpServletRequest request = mock(HttpServletRequest.class);
        HttpServletResponse response = mock(HttpServletResponse.class);
        HttpSession session = mock(HttpSession.class);
       	ServletConfig config = mock(ServletConfig.class);
       	ServletContext context = mock(ServletContext.class);
       	User u = mock(User.class);
       	HashMap<String,Double> port = new HashMap<String,Double>();
       	ProductBean test = new ProductBean(1,"test", 1.12, 1.23, "valuta");
       	
       	//configurazione del mock
       	when(request.getSession()).thenReturn(session);
       	when(session.getAttribute("user")).thenReturn(session);
       	
       	//Esegui il metodo doGet
        try {
			CServlet.doGet(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
