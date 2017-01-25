package com.example;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
import com.google.appengine.api.datastore.Text;


@PersistenceCapable
public class Contact {

	
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	@PrimaryKey
	Long id;
	
	@Persistent
    String name;

	@Persistent
	String number;

	@Persistent
	String mail;
	
	@Persistent
	private String uid;
	
	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}



    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

    
    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getEmail() {
        return mail;
    }

    public void setmail(String mail) {
        this.mail = mail;
    }


    public Contact(){

		super();
	}


}
