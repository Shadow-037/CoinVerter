package coin;

import static org.junit.Assert.*;

import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Test;

import prodotti.ProductDaoDataSource;
import utenti.TestDataSource;

public class OrdiniServletTest {

	@Before
    public void setup() {
        DataSource dataSource = TestDataSource.createMySQLDataSource();
        ProductDaoDataSource.setDataSource(dataSource);
    }

	@Test
	public void testDoGetHttpServletRequestHttpServletResponse() {
		fail("Not yet implemented");
	}

}
