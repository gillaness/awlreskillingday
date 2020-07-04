package controlador;

import java.io.IOException;
import java.security.MessageDigest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.DatatypeConverter;

import dao.UsuarioDao;
import modelo.Usuario;

/**
 * Servlet implementation class ValidarUsuario
 */
@WebServlet("/ValidarUsuario")
public class ValidarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidarUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.sendRedirect(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		String login = request.getParameter("txtlogin");
		String clave = request.getParameter("txtclave");
		UsuarioDao userdao = new UsuarioDao();
		Usuario user = new Usuario();
		
		String mensaje = "";
		
		if (login.trim().length() == 0 || login == null || clave.trim().length() == 0 || clave == null) {
			mensaje = "Debe ingresar usuario y clave";
		}
		else {
			user = userdao.obtenerUsuarioByLogin(login);
			if (user == null || user.getLogin() == "") {
				mensaje = "El usuario ingresado no existe en la base de datos";
			}
			else {
				
				try {
				    MessageDigest md = MessageDigest.getInstance("MD5");
				    md.update(clave.getBytes());
				    byte[] digest = md.digest();
				    String myHash = DatatypeConverter.printHexBinary(digest).toUpperCase();
				    
				    if (myHash.equals(user.getClave()) == false) {
				    	mensaje = "La clave ingresada no es correcta";
				    }
				    /*else {
				    	mensaje = "Los datos son correctos";
				    }*/
				}
				catch(Exception e) {
					System.out.println(e);
					mensaje = "Ocurrió un error al ingresar al portal";
				}
				
				
			}
		}
		
		if (mensaje.trim().length() > 0 || mensaje.trim() != "") {
			request.setAttribute("lmensaje", mensaje);
			request.getRequestDispatcher("Login.jsp").forward(request, response);			
		}
		else {
			HttpSession misession= (HttpSession) request.getSession(); 
			misession.setAttribute("sesionuser", user); 
			response.sendRedirect(request.getContextPath() + "/ListarUsuarios");
		}
		
		
	}

}

