<%@page import="java.util.Locale"%>
<%@page import="com.liferay.portal.kernel.util.LocaleUtil"%>
<%@page import="javax.portlet.ActionRequest"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="theme" %>

<portlet:defineObjects />
<theme:defineObjects />
<!-- Uno de los objetos más importantes que se nos definen es
el de "user" que contiene información relativa al usuario
 -->
<p>Usuario</p>
<p>Nombre: <%=user.getFirstName() %></p>
<p>Nombre: <%=user.getLastName() %></p>
<p>Nombre: <%=user.getRoles() %></p>
<!-- Otro objeto podria ser el de "company" que tiene información
acerca de la empresa que tiene liferay
 -->
 <p>Compañia</p>
 <p>Nombre: <%=company.getName() %></p>

<p>Zona horaria</p>
<%= timeZone.getDisplayName() %> 


<!-- Podemos declarar los errores mediante la etiqueta liferay-ui -->
<liferay-ui:error message="El parametro no puede estar vacio" 
				  key="errorParametroVacio"/>

<!-- Tambien podemos declarar exitos -->
<liferay-ui:success message="El parametro esta correctamente informado"
					key="parametroRelleno"/>


<liferay-ui:message key="title"/>

<portlet:actionURL var="pruebaMensajesURL" >
	<portlet:param name="<%=ActionRequest.ACTION_NAME %>" 
			value="pruebaMensajes"/>
</portlet:actionURL>

<aui:form action="${pruebaMensajesURL}" method="post" name="name">
	<aui:input name="parametro"></aui:input>
	<aui:button type="submit" value="button.send"/>
</aui:form>

<portlet:actionURL var="vamosTabs">
	<portlet:param name="mvcPath" value="/html/etiquetasui/uiTabs.jsp"/>
</portlet:actionURL>

<a href="${vamosTabs}">Enlace</a>


