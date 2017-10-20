

import java.util.Hashtable;

import javax.naming.*;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;
import javax.naming.ldap.InitialLdapContext;
import javax.naming.ldap.LdapContext;


public class LDAPTest {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws NamingException {
        
    	String url = "ldap://localhost:389";
    	Hashtable env = new Hashtable();
    	env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
    	env.put(Context.PROVIDER_URL, url);
    	env.put(Context.SECURITY_AUTHENTICATION, "simple");
    	env.put(Context.SECURITY_PRINCIPAL, "uid=sdhangar,ou=groups,dc=example,dc=com");
    	env.put(Context.SECURITY_CREDENTIALS, "root");
    	 
    	try {
    	    DirContext ctx = new InitialDirContext(env);
    	    System.out.println("connected");
    	    System.out.println(ctx.getEnvironment());
    	     
    	    // do something useful with the context...
    	 
    	    ctx.close();
    	 
    	} catch (AuthenticationNotSupportedException ex) {
    	    System.out.println("The authentication is not supported by the server");
    	} catch (AuthenticationException ex) {
    	    System.out.println("incorrect password or username");
    	} catch (NamingException ex) {
    	    System.out.println("error when trying to create the context");
    	}   
    }    
}