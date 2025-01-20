package coin;

import static org.junit.Assert.*;
import static org.mockito.Mockito.when;

import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;

public class OrderDaoDataSourceTest {

	@Before
	public void setUp() throws Exception {
		OrderDaoDataSource ODDS = new OrderDaoDataSource();
		
	}
	
	@Mock
	Context IC;
	Context EC;
	DataSource DS;
	
	@InjectMocks
	OrderDaoDataSource ODDS;
	

	@Test
	public void testDoRetrieveAllOrders() {
		
		try {
			Context realCtx = new InitialContext();
			ODDS.doRetrieveAllOrders();
			when(IC = new InitialContext()).thenReturn(realCtx);
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	public void testDoRetrieveByDateFilter() {
		fail("Not yet implemented");
	}

	@Test
	public void testDoRetrieveByNameFilter() {
		fail("Not yet implemented");
	}

}
