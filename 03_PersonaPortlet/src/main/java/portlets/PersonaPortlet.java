package portlets;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;
import com.liferay.portal.kernel.util.ParamUtil;

import serviciopersonas.model.Persona;
import serviciopersonas.service.PersonaLocalServiceUtil;

import java.io.IOException;
import java.util.List;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.Portlet;
import javax.portlet.PortletException;

import org.osgi.service.component.annotations.Component;

@Component(
	immediate = true,
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.instanceable=true",
		"javax.portlet.display-name=03_PersonaPortlet Portlet",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class PersonaPortlet extends MVCPortlet {
	
	public void addPersona(ActionRequest actionRequest, ActionResponse actionResponse)
			throws IOException, PortletException {
		String dni = ParamUtil.get(actionRequest, "dni", "");
		String nombre = ParamUtil.get(actionRequest, "nombre", "");
		String sEdad = ParamUtil.get(actionRequest, "edad", "");
		int iEdad = Integer.parseInt(sEdad); //lo paso a entero, porque parametros son string.
	//CREAMOS LA PERSONA:
		Persona persona = PersonaLocalServiceUtil.createPersona(dni);
	//SERIA EQUIVALENTE A HACER: Persona persona = new Persona(dni);
		persona.setNombre(nombre);
		persona.setEdad(iEdad);
	//POR FIN YA PERSISTIMOS:
		PersonaLocalServiceUtil.addPersona(persona);				
	}
	

	public void deletePersona(ActionRequest actionRequest, ActionResponse actionResponse)
			throws IOException, PortletException {
		String dni = ParamUtil.get(actionRequest, "dni", "");
		try	{
			PersonaLocalServiceUtil.deletePersona(dni);
		}catch (PortalException e)	{
			e.printStackTrace();
		}
	}

	
	public void updatePersona(ActionRequest actionRequest, ActionResponse actionResponse)
			throws IOException, PortletException {
		String dni = ParamUtil.get(actionRequest, "dni", "");
		String nombre = ParamUtil.get(actionRequest, "nombre", "");
		String sEdad = ParamUtil.get(actionRequest, "edad", "");
		int iEdad = Integer.parseInt(sEdad); //lo paso a entero, porque parametros son string.
	//RECUPERAMOS LA PERSONA DE LA BASE DE DATOS:
		try {
			Persona persona = PersonaLocalServiceUtil.getPersona(dni);
			persona.setNombre(nombre);
			persona.setEdad(iEdad);
			persona.setDni(dni);
			//persistimos en base de datos:
			PersonaLocalServiceUtil.updatePersona(persona);
		} catch (PortalException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	public void listarPersona(ActionRequest actionRequest, ActionResponse actionResponse)
			throws IOException, PortletException {
		List<Persona> listaPersonas = PersonaLocalServiceUtil.getPersonas(-1, -1); //para tenerlo de principio a fin
		actionRequest.setAttribute("listaPersonas", listaPersonas);
	}

}