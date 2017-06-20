<%@page import="modelo.entidades.Persona"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<portlet:defineObjects />

<% Persona persona = (Persona)request.getAttribute("p"); %>

<p> La persona es: <%=persona%> </p>

<portlet:renderURL var="volver" />
<a href="${volver} "> Volver </a>


<portlet:renderURL var="volver2">
<!--  por si queremos ir a otra pagina -->
	<portlet:param name="mvcPath" value="/view.jsp" />
</portlet:renderURL>
<a href="${volver2} "> -BACK- </a>