package com.digital.empleo.portlets;

import java.io.IOException;
import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;

import modelo.entidades.Persona;


public class HolaMundoMVCPortlet extends MVCPortlet {
	
	private static final Log log = LogFactoryUtil.getLog(HolaMundoMVCPortlet.class);

//este metodo solo se ejecuta una vez, cuando se inicie el portlet:
	public void init() throws PortletException {
		super.init();
	}
	
	
@Override
public void doView(RenderRequest renderRequest, RenderResponse renderResponse)
		throws IOException, PortletException {
	log.info("doView-> Entrando");
	System.out.println("doView -> Entrando");
	
	if	(renderRequest.getAttribute("saludo") == null)
		renderRequest.setAttribute("saludo", "Nuestro primer saludo!");
	super.doView(renderRequest, renderResponse);
}


public void saludar(ActionRequest actionRequest, ActionResponse actionResponse)
		throws IOException, PortletException {
//Este puede ser null en caso de que no llegue el parametro nombre
	String nombre = actionRequest.getParameter("nombre");
	log.info("saludar -> " + nombre);
// El ultimo valor es el que por defect tomará nombre en caso de que el parametro"nombre" no llegue informado.
// Con esto evitamos los null pointer exceptions.
	nombre = ParamUtil.get(actionRequest, "nombre", "");
	log.info("saludar -> " + nombre);
	
	actionRequest.setAttribute("saludo", "Hola mundo!");
}


public void altaPersona(ActionRequest actionRequest, ActionResponse actionResponse)
		throws IOException, PortletException {
//recogemos parametros de la nueva forma:
	String nombre = ParamUtil.get(actionRequest, "nombre", "");
	String sEdad = ParamUtil.get(actionRequest, "edad", "");
	String dni = ParamUtil.get(actionRequest, "dni", "");

//pasamos la edad a entero:
	int edad = Integer.parseInt(sEdad);
//creamos persona:
	Persona persona = new Persona();
	persona.setDni(dni);
	persona.setEdad(edad);
	persona.setNombre(nombre);
	
	actionRequest.setAttribute("p", persona);
//Cosa guapa!si ponemos esto del mvcPath decimos directamente a que .jsp ir, sin pasar por el doView:
	actionResponse.setRenderParameter("mvcPath", "/view2.jsp"); 
	}
}
