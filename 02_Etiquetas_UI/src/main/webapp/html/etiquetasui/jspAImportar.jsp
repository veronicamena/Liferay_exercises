<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<p>Este es el contenido de la tab 3 </p>

<portlet:renderURL var="irACalendario">
	<portlet:param name="mvcPath" value="/html/etiquetasui/calendario.jsp"/>
</portlet:renderURL>

<a href="${irACalendario }">Ir a Calendario</a>