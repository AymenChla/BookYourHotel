package controllers;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.ClientRepository;
import dao.UserRepository;
import entities.Client;

@Controller
public class GestionCompteController {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private ClientRepository clientRepository;
	
	@RequestMapping(value="/compteinfos",method = RequestMethod.GET)
	public String parametreCompte(HttpServletRequest request, ModelMap model)
	{
		//client authentified
		String username = request.getRemoteUser();
		//String username = "aymen";
		Client client = (Client) userRepository.findByUserName(username);
		

		
		model.put("client", client);
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String dateNaissance = df.format(client.getDateNaissance());
		model.put("dateNaissance", dateNaissance);
		return "compteinfos";
	}
	
	@RequestMapping(value="/compteinfos",method = RequestMethod.POST)
	public String changeParametreCompte(Client c,HttpServletRequest request, ModelMap model)
	{
		//client authentified
		String username = request.getRemoteUser();
		//String username = "aymen";
		Client  client = (Client) userRepository.findByUserName(username);
		
		client = client.update(c);
		clientRepository.save(client);
		
		model.put("client",client);
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String dateNaissance = df.format(client.getDateNaissance());
		model.put("dateNaissance", dateNaissance);
		return "compteinfos";
	}
	
	@RequestMapping(value="/comptepass",method =RequestMethod.GET)
	public String viewModifierMdp(ModelMap model)
	{
		return "comptepass";
	}
	
	@RequestMapping(value="/comptepass" ,method=RequestMethod.POST)
	public String modifierMdp(HttpServletRequest request,ModelMap model,String password,String newPassword, String confirmation)
	{
		//client authentified
		String username = request.getRemoteUser();
		//String username = "aymen";
		Client  client = (Client) userRepository.findByUserName(username);
		
		String msg="";
		if(!client.getPassword().equals(password))
		{
			msg="password not correct";
		}
		else if(newPassword.equals("") || !newPassword.equals(confirmation)){
			msg="password not match";
		}
		else{
			client.setPassword(newPassword);
			clientRepository.save(client);
			msg = "votre mot de passe est modifié";
		}
				
		model.put("msg",msg);
		return "comptepass";
	}
}
