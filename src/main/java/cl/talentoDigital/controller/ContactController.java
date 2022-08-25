package cl.talentoDigital.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cl.talentoDigital.model.Contacto;

@Controller
@RequestMapping("/contactManager")
public class ContactController {
	
	//llamado a la instancias de contacto del contenedor de beans
	@Autowired
	Contacto contacto;
	
	//genero una lista de contactos que luego le iré agregando contactos con el método addcontact, 
	//y podré mostrar esta lista en la vista, al recorrerla con el foreach
	private ArrayList<Contacto> contactos= new ArrayList<Contacto>();

	//http://localhost:8081/contactManager
	//http://localhost:8081/contactManager/
	@RequestMapping({"","/"})
	public String getContactList(ModelMap model) {
		/*contacto.setIdContacto(1);
		contacto.setNombre("Pepe");
		contacto.setApellidoPaterno("Lota");
		contacto.setApellidoMaterno("Soto");
		contacto.setDireccion("Alameda 123");
		contacto.setTelefono("555555");
		contactos.add(contacto);*/
		
		//voy a enviar a la vista, la lista de contactos que voy a recorrer con el foreach y así imprimir la tabla html
		model.put("listaContactos", contactos);
		//model.put("listaContactos", servicioContacto.getContactList());
	return "contactManager";
	}
	
	//http://localhost:8081/contactManager/addContact
	@RequestMapping(value="/addContact", method=RequestMethod.POST)
	public String addContact(ModelMap model, @ModelAttribute("contactoVista") Contacto contactoEntrante) {
		contactoEntrante.setIdContacto(contactos.size()+1);
		contactos.add(contactoEntrante);
		
		
	//voy a enviar a la vista, la lista de contactos que voy a recorrer con el foreach y así imprimir la tabla html
	model.put("listaContactos", contactos);
		
	return "contactManager";
	}
	
	@RequestMapping(value="/deleteContact", method=RequestMethod.GET)
	public String deleteContact(ModelMap model, @RequestParam("id") String idEntrante) {
		contactos.remove(Integer.parseInt(idEntrante)-1);
		//voy a enviar a la vista, la lista de contactos que voy a recorrer con el foreach y así imprimir la tabla html
		model.put("listaContactos", contactos);			
		return "contactManager";
	}
}
