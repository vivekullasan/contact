package com.example;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class FunctionalClass {
	 
	
	public static String safe(String input) {
		
		String sha1 = null;
		
		if(null == input) return null;
		
		try {
			
		MessageDigest digest = MessageDigest.getInstance("SHA-256");
		

		digest.update(input.getBytes(), 0, input.length());

		//Converts message digest value in base 16 (hex) 
		sha1 = new BigInteger(1, digest.digest()).toString(16);

		} catch (NoSuchAlgorithmException e) {

			e.printStackTrace();
		}
		return sha1;
	}
	
	public static String password(String input) {
		SecureRandom random = new SecureRandom();
	    return new BigInteger(130, random).toString(32);
	}
	
	public static void mail(String email, String password) {


	      String to = email;

	      String from = "vivek.ullasan@a-cti.com";

	      String host = "smtp.gmail.com";

	      Properties properties = System.getProperties();

	      properties.setProperty("mail.smtp.host", host);

	      Session session = Session.getDefaultInstance(properties);

	      try{

	         MimeMessage message = new MimeMessage(session);


	         message.setFrom(new InternetAddress(from));


	         message.addRecipient(Message.RecipientType.TO,
	                                  new InternetAddress(to));


	         message.setSubject("Welcome to your Personalised Contact Manager");
	         message.setContent("Hi There,<br><br> You can store your contact entries <b>Contact Book</b> This is your Username: <b>"+email+"</b> password: <b>"+password+"<b><br><br> Thanks,<br><br> Vivek Ullasan", "text/html; charset=utf-8");
	         
	         Transport.send(message);
	         System.out.println(message);
	      }catch (MessagingException mex) {
	         mex.printStackTrace();
	      }
	   }

	
}
