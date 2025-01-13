package prodotti;


import java.io.IOException;
import java.sql.SQLException;

//import prodotti.ProductBean;
import utenti.User;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet("/Gestione")
@MultipartConfig
public class ManageProductServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User u =(User) request.getSession().getAttribute("user");
		if(u == null || !u.isAdmin()) {
			response.sendRedirect("index.jsp");
			return;
		}
		int id =Integer.parseInt(request.getParameter("id"));
		String attività = request.getParameter("activity");
		ProductBean prodotto = new ProductBean();
		ProductDaoDataSource source = new ProductDaoDataSource();
		
		
		
		
		if(attività == null) {
			try {
				prodotto = source.doRetrieveByKey(id);
				request.getSession().setAttribute("mod", prodotto);
				response.sendRedirect("admin/ProdottoForm.jsp");
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		if(attività != null) {
			
			switch(attività) {
				case "modify": 
					System.out.println("dentro modify");
					try {
						
						float prezzo = -1;
						String path = System.getProperty("user.home");
						if(!request.getParameter("prezzo").equals("")) prezzo = Float.parseFloat(request.getParameter("prezzo"));
						else System.out.println("Recupito");
						//int quantità = Integer.parseInt("quantity");
						//boolean disponibile = Boolean.parseBoolean("available");
						String tipo = request.getParameter("tipo");
						//String nome = null;
						String nome = request.getParameter("nome");
						Part filePart = request.getPart("foto");
						
						/*/if(request.getParameter("nome") != null) nome = request.getParameter("nome");
						//else System.out.println("VUOTOT");
						
						else System.out.println("VUOTOT");
						if(request.getParameter("tipo") != null) tipo = request.getParameter("tipo");
						else System.out.println("VUOTOT");
						if(request.getPart("foto") != null) filePart = request.getPart("foto");
						else System.out.println("VUOTOT");// "file" is the name attribute in the form
						*/
						prodotto = source.doRetrieveByKey(id);
						if(nome != null && !nome.equals("")) prodotto.setName(nome);
						
						if(tipo != null) prodotto.setType(tipo);
					
						if(prezzo != -1) prodotto.setPrice(prezzo);
						
						//prodotto.setAvailable(disponibile);
						
						//introdurre cambio foto
						
						 
					     if(filePart != null) {
					    	 String fileName = filePart.getSubmittedFileName();
					    	 //String relativePath = "C:\\Users\\pasto\\git\\repository\\codice\\CoinVerter\\WebContent\\img\\products\\" + fileName;
					    	 String relativePath = path + "\\imgs\\" + fileName;
					    	 
					        filePart.write(relativePath);
					        prodotto.setFoto(relativePath);
					        //prodotto.setFoto("img/products/" + fileName);
					     }						
					
						//if((prodotto.getType() == "ricarica") && quantità > 0) prodotto.setQuantity(quantità);
						//else prodotto.setQuantity(-1)
						source.doUpdate(prodotto);
						System.out.println("fatto doupdate nuovi valori: "+ prodotto.toString());
						
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					break;
				case "add":
					String nome = request.getParameter("name");
					float prezzo = Float.parseFloat(request.getParameter("price"));
					int quantità = Integer.parseInt("quantity");
					boolean disponibile = Boolean.parseBoolean("available");
					String tipo = request.getParameter("type");
					
					try {	
						if(id > 0) prodotto.setCode(id);
						
						if(nome != null && !nome.equals("")) prodotto.setName(nome);
						
						if(tipo != null) prodotto.setType(tipo);
					
						if(prezzo != -1) prodotto.setPrice(prezzo);
						
						prodotto.setAvailable(disponibile);
						
						//introdurre cambio foto
						
						if((prodotto.getType() == "ricarica" && quantità > 0)) prodotto.setQuantity(quantità);
						else prodotto.setQuantity(-1);
						
						source.doSave(prodotto);
					
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					break;
					
				case "remove":
					try {
						if(id > 0)source.doRemove(id);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				break;
			
				case "delete":
					try {
						if(id > 0)source.doDelete(id);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				break;
			
			}//switch
			response.sendRedirect("ProdottiAD");
		}
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	
	
	
	
}	