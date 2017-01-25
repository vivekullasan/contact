package com.example;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Properties;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.google.appengine.labs.repackaged.org.json.JSONException;
import com.google.appengine.labs.repackaged.org.json.JSONObject;
import com.google.appengine.api.datastore.Text;
import com.google.gson.Gson;
import java.security.SecureRandom;

import java.io.BufferedReader;
import java.io.OutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

@Controller
@RequestMapping("")
public class ControllerClass {
	
	String EMAIL_REGEX = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
			+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	
	 
	@RequestMapping(method= RequestMethod.POST, value="Contact/add")
	public void addEntry(HttpServletRequest request, HttpServletResponse resp, ModelMap model,HttpSession session) throws IOException {

		StringBuilder buffer = new StringBuilder();
		BufferedReader reader = request.getReader();
		String line;
		
		Cookie ck[] = request.getCookies();
        String id = ck[0].getValue();
        System.out.println(id+" Add ");
        id = (id.matches(EMAIL_REGEX) ? id : null);
        
        
		PersistenceManager pm= PMF.get().getPersistenceManager();
		while ((line = reader.readLine()) != null) {
			buffer.append(line);
		}
		String input = buffer.toString();
		System.out.println("ividea wthi tta1");
		JSONObject JSON = null;
		try{
			JSON = new JSONObject(input);
			String name=JSON.getString("name");
			String number=JSON.getString("number");
			String mail=JSON.getString("mail");
			
			Query q= pm.newQuery(Contact.class);
			q.setFilter("number == '"+number+"'"+"&&"+"	uid == '"+id+"'");
			q.setOrdering("name desc");
			List<Contact> results = (List<Contact>) q.execute(number);
			if(!(results.isEmpty()))
			{
				

			}else{
			Contact r=new Contact();
			r.setName(name);
			r.setNumber(number);
			r.setmail(mail);
			r.setUid(id);
			pm.makePersistent(r);
			pm.close();
			Gson obj = new Gson();
			String retVal = obj.toJson(r);
			System.out.println(retVal+"added");
			}
			} catch (JSONException e) {
						e.printStackTrace();
			} finally{
			}

		}
	
	@RequestMapping(method=RequestMethod.GET, value="Contact/Contact")
    @ResponseBody
	 public String displayData(HttpServletRequest request,HttpServletResponse resp, ModelMap model,HttpSession session) throws IOException {
		
		resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		resp.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		resp.setDateHeader("Expires", 0); // Proxies.
		
		Cookie ck[] = request.getCookies();
        String id = ck[0].getValue();
        System.out.println(id);
        id = (id.matches(EMAIL_REGEX) ? id : null);
  
		PersistenceManager pm= PMF.get().getPersistenceManager();
		System.out.println("ividea wthi tta");
			Query q = pm.newQuery(Contact.class);
			q.setFilter("uid == '"+id+"'");
			q.setOrdering("name desc");
			List<Contact> list= (List<Contact>) q.execute();
			Gson obj = new Gson();
			String retVal = obj.toJson(list);
			System.out.println(retVal+"get back");
			return retVal;
			
	}

	@RequestMapping(method=RequestMethod.GET, value="Contact/add/{id}")
    @ResponseBody
	 public String editing(HttpServletRequest request,HttpServletResponse resp, ModelMap model,HttpSession session,@PathVariable String id) throws IOException {
    		PersistenceManager pm= PMF.get().getPersistenceManager();
    		
    		Cookie ck[] = request.getCookies();
            String uid = ck[0].getValue();
            System.out.println(uid);
            uid = (uid.matches(EMAIL_REGEX) ? uid : null);
    		
    		long key = Long.parseLong(id);
			Query q = pm.newQuery(Contact.class);
			q.setFilter("id == idParameter"+"&&"+"uid == '"+uid+"'");
			q.declareParameters("String idParameter");
			List<Contact> list= (List<Contact>) q.execute(key);
			Contact	dobj	=	(Contact)list.get(0);
			
			Gson obj = new Gson();
			String retVal = obj.toJson(dobj);
			
			return retVal;

		}
    @RequestMapping(method=RequestMethod.PUT, value="Contact/add/{id}")
	public void updateEntry(HttpServletRequest request, HttpServletResponse resp,@PathVariable String id) throws IOException{
		
		String k=id;
		long key=Long.parseLong(k);
		PersistenceManager pm= PMF.get().getPersistenceManager();
			
			try{
			StringBuilder buffer = new StringBuilder();
		    BufferedReader reader = request.getReader();
		    String line;
		    
		    while ((line = reader.readLine()) != null) {
		        buffer.append(line);
		    }
		    String data = buffer.toString();
		    
		    //Key key=KeyFactory.stringToKey(key1);
		    System.out.println("ividea wthi tta");
		    JSONObject JSON = null;
			try {
				JSON = new JSONObject(data);
				String name=JSON.getString("name");
				String number=JSON.getString("number");
				String mail=JSON.getString("mail");

				
				Contact c = pm.getObjectById(Contact.class, key);
				c.setName(name);
				c.setNumber(number);
				c.setmail(mail);


			
			} catch (JSONException e) {
				
				e.printStackTrace();
			}
			}
			catch(Exception e){
				System.out.println(e);
			}

    }
    
    @RequestMapping(method=RequestMethod.DELETE, value="Contact/add/{id}")
    public void deleteData(HttpServletRequest request,HttpServletResponse resp, @PathVariable String id) throws IOException {
    	
    	String k=id;
		long key=Long.parseLong(k);
    	
    	try{
    		
	    	PersistenceManager pm = PMF.get().getPersistenceManager();
	    	

    		Contact c = pm.getObjectById(Contact.class, key);
    		pm.deletePersistent(c);
    	}
    	catch(Exception e){
    		System.out.println(e);
    	}

    }
	@RequestMapping(value="Contact/Signup",method={RequestMethod.POST})
	public void Signup(HttpServletRequest req, HttpServletResponse resp,HttpSession session)
	throws IOException, ServletException {
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		Query q= pm.newQuery(Login.class);
		q.setFilter("email == '" + email + "'");	
		List<Login> results = (List<Login>) q.execute(email);
		if(!(results.isEmpty()))
		{
			
			resp.sendRedirect("../Errorpage2");
			
		}	else{
		Login c = new Login();
		
		c.setEmail(email);
		c.setName(name);
		c.setPassword(password);
						
		try {
			pm.makePersistent(c);
			this.signIn(req, resp, session);
		} finally {
			pm.close();
			}
		}
		
		
   		
	this.signIn(req, resp, session);
   }
	
	
	@RequestMapping(value="Contact/Signin",method={RequestMethod.POST})
	public void signIn(HttpServletRequest request, HttpServletResponse res, HttpSession session)
	throws IOException, ServletException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		Query q= pm.newQuery(Login.class);
		q.setFilter(" email == '" + email + "'"+ "&&" + " password == '" + FunctionalClass.safe(password) + "'");
		List<Login> results = (List<Login>) q.execute(email);
		if(!(results.isEmpty()))
		{
			
			Cookie ck=new Cookie("email", email);//creating cookie object  
		    res.addCookie(ck);//adding cookie in the response  
			
	   		session.setAttribute("email", email);
	   		session.setMaxInactiveInterval(6*60*60);
	   		res.sendRedirect("../Contact");
	   		
            
		}else{
			
			res.sendRedirect("../../Errorpage1");
			
		}

	
	}
	
	// Login Credentials //
    @RequestMapping(value="Contact/Login",method={RequestMethod.GET})
	public void doGet(HttpServletRequest req, HttpServletResponse resp,HttpSession session)
	throws IOException {

	UserService userService = UserServiceFactory.getUserService();
	User user = userService.getCurrentUser();
	
	
	resp.setContentType("text/html; charset=UTF-8");
	resp.setCharacterEncoding("UTF-8");
	resp.getWriter().println("<h2>Integrating Google user account</h2>");

	if (user != null) {
		String name = user.getNickname();
		String email = user.getEmail();
		
		
		Cookie ck=new Cookie("email", email);//creating cookie object  
	    resp.addCookie(ck);//adding cookie in the response  
		
   		session.setAttribute("email", email);
   		session.setMaxInactiveInterval(6*60*60);
   		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Query q= pm.newQuery(Login.class);
		q.setFilter(" email == '" + email + "'");	
		List<Login> results = (List<Login>) q.execute(email);
		if(!(results.isEmpty()))
		{
			resp.sendRedirect("/Contact");
		}	
		else{
		String password = null;
		password = FunctionalClass.password(password);
		System.out.println(password);
		FunctionalClass.mail(email,password);
		password = FunctionalClass.safe(password);
		System.out.println(password);
		Login c = new Login();
		c.setName(name);
		c.setEmail(email);
		c.setPassword(password);
		try {
			pm.makePersistent(c);
		}
		finally{
			pm.close();
			resp.sendRedirect("/Contact");
			}
		}
		ck=new Cookie("email", email);//creating cookie object  
	    resp.addCookie(ck);//adding cookie in the response  
		

		} else {
			resp.sendRedirect(userService.createLoginURL(req.getRequestURI()));
			}
		}
    
    @RequestMapping(value="Contact/Logout",method={RequestMethod.GET})
    public void logOut(HttpServletRequest req, HttpServletResponse resp,HttpSession session)
	throws IOException {
    	Cookie ck=new Cookie("email","");  
        ck.setMaxAge(0);  
        resp.addCookie(ck);    	
		resp.sendRedirect("../LoginPage");
    }
    
    @RequestMapping(value = "/LoginPage", method = RequestMethod.GET)
	public ModelAndView loginPage(HttpServletResponse resp,HttpServletRequest req,HttpSession session) throws IOException, ServletException {
    	
    	return new ModelAndView("signin-page");	
	}
    
    @RequestMapping(value = "/SignupPage", method = RequestMethod.GET)
    public ModelAndView signUpPage(HttpServletResponse resp,HttpServletRequest req,HttpSession session) throws IOException, ServletException {
    	
    	return new ModelAndView("signup-page");
	}
    @RequestMapping(value = "/Errorpage1", method = RequestMethod.GET)
    public ModelAndView ErrorsignUp(HttpServletResponse resp,HttpServletRequest req,HttpSession session) throws IOException, ServletException {
    	
    	return new ModelAndView("LoginError");
	}
    @RequestMapping(value = "/Errorpage2", method = RequestMethod.GET)
    public ModelAndView ErrorsignIn(HttpServletResponse resp,HttpServletRequest req,HttpSession session) throws IOException, ServletException {
    	
    	return new ModelAndView("SignupError");
	}
    
    @RequestMapping(value = "/Contact", method = RequestMethod.GET)
	public ModelAndView Main(HttpServletResponse resp,HttpServletRequest req,HttpSession session) throws IOException,NullPointerException {
    	try{
    		Cookie ck[] = req.getCookies();
    		String id = ck[0].getValue();
    		id = (id.matches(EMAIL_REGEX) ? id : null);
    		if(id==null){
    			return new ModelAndView("signin-page");
    		}else{
    			return new ModelAndView("contact-page");	
    		}
    	}catch(Exception e){
    		return new ModelAndView("signin-page");
    	}	
    }
    @RequestMapping(value = "/Users", method = RequestMethod.GET)
	public ModelAndView valid(HttpServletResponse resp,HttpServletRequest req,HttpSession session) throws IOException,NullPointerException {
    	try{
    		Cookie ck[] = req.getCookies();
    		String id = ck[0].getValue();
    		id = (id.matches(EMAIL_REGEX) ? id : null);
    		if(id==null){
    			System.out.println("user null");
    			return new ModelAndView("signin-page");
    		}else{
    			System.out.println("User present");
    			return new ModelAndView("contact-page");	
    			
    		}
    	}catch(Exception e){
    		System.out.println("user exception");
    		return new ModelAndView("signin-page");
    	}	
    }
}
