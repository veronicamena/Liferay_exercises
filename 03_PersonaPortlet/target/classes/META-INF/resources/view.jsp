<%@page import="javax.portlet.ActionRequest"%>
<%@page import="serviciopersonas.model.Persona"%>
<%@page import="serviciopersonas.service.PersonaLocalServiceUtil"%>
<%@page import="java.util.List"%>
<%@ include file="/init.jsp" %>

<p>
	<b><liferay-ui:message key="03_PersonaPortlet.caption"/></b>
</p>

<%
	List<Persona> listaPersonas = PersonaLocalServiceUtil.getPersonas(-1, -1);
%>

<table  border="1">
  <tr>
    <th>DNI</th>
    <th>NOMBRE</th>
    <th>EDAD</th>
    <th>BAJA</th>
    <th>MODIFICAR</th>  
  </tr>
  
  <%
  	for(Persona p : listaPersonas) {
  %>
  
 <portlet:actionURL var="deletePersona" >
	<portlet:param name="<%=ActionRequest.ACTION_NAME%>" value="deletePersona"/>
	<portlet:param name="dni" value="<%=p.getDni()%>"/>
</portlet:actionURL>

<portlet:renderURL var="irAModificar">
	<portlet:param name="mvcPath" value="/modificar.jsp" />
	<portlet:param name="dni" value="<%=p.getDni()%>"/>
</portlet:renderURL>

  <tr>
    <td><%=p.getDni() %></td>
    <td><%=p.getNombre() %></td>
    <td><%=p.getEdad() %></td>
    <td><a href="${deletePersona}"> Eliminar </a></td>
    <td><a href="${irAModificar}"> Modificar </a></td>
  </tr>
  </table>
  
  <%
  	}
  %>


<portlet:actionURL var="altaPersona" >
	<portlet:param name="<%=ActionRequest.ACTION_NAME%>" value="addPersona"/>
</portlet:actionURL>
<aui:form action="${altaPersona}" method="post" name="name">
	<aui:input name="dni" type="text" value="DNI" />
	<aui:input name="nombre" type="text" value="Nombre" />
	<aui:input name="edad" type="number" value="Edad" />
	<aui:button type="submit" value="Alta" />
</aui:form>
