package coin;

import static org.junit.Assert.*;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Test;

import prodotti.ProductBean;
import prodotti.ProductDaoDataSource;
import utenti.TestDataSource;

public class CartServletTest {

	
	
	@Before
    public void setup() {
        DataSource dataSource = TestDataSource.createMySQLDataSource();
        ProductDaoDataSource.setDataSource(dataSource);
    }
	
	@Test
	public void testDoPostHttpServletRequestHttpServletResponseAggiungi() {		//set up
		HttpServletRequest request = mock(HttpServletRequest.class);
		HttpServletResponse response = mock(HttpServletResponse.class);
		HttpSession session = mock(HttpSession.class);
		CartServlet servlet = new CartServlet(); 
		Carrello c = new Carrello();
		Random random = new Random();
		int i =  random.nextInt(1000) + 1;
		StringWriter stringWriter = new StringWriter();
        PrintWriter writer = new PrintWriter(stringWriter);
		
		when(request.getSession()).thenReturn(session);
		when(request.getParameter("id")).thenReturn("3");
        
     
		when(session.getAttribute("cart")).thenReturn(c);
		when(session.getAttribute("action")).thenReturn("add");
		when(request.getParameter("quantity")).thenReturn(String.valueOf(i));
		try {
			when(response.getWriter()).thenReturn(writer);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//esecuzione
		try {
			servlet.doPost(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writer.flush();
		String output = stringWriter.toString();
		ArrayList<ProductBean> prodotti = c.getProducts();
		
		//controllo
		System.out.println("output:"+output+" i:"+ i + " conversione i:"+String.valueOf(i));
		assertEquals(output,String.valueOf(i));
		
		assertTrue(!prodotti.isEmpty());
	}

}
