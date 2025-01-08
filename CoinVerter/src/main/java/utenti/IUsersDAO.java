package utenti;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IUsersDAO<User> {
	public void doSave(User user) throws SQLException;

	public boolean doDelete(String name) throws SQLException;

	public User doRetrieveByName(String name) throws SQLException;
	
	public ArrayList<User> doRetrieveAll(String order) throws SQLException;

	public void doUpdate(User user) throws SQLException;
	
	//public boolean doFlipAdmin(User user) throws SQLException;
	
}
