<%@page import="java.util.GregorianCalendar"%>
<%@page import="javax.portlet.ActionRequest"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
    
<h1>Bienvenidos a Calendario</h1>

<%
	Object oFechaEscogida = request.getAttribute("fechaEscogida");
	int dia = 0;
	int mes = 0;
	int año = 0;
	if(oFechaEscogida == null){
		//La clase date sirve para manejar fechas
		//guarda un long que representa el numero de milisegundos
		//que han pasado desde el año 1970
		Date date = new Date();
		out.print(date.getTime());
		//Esto nos devuevle un calendario con la fecha actual
		Calendar calendar = Calendar.getInstance();
		dia = calendar.get(Calendar.DAY_OF_MONTH);//10
		mes = calendar.get(Calendar.MONTH);
		año = calendar.get(Calendar.YEAR);
	}else{
		Date date = (Date)oFechaEscogida;
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);//modificando la fecha actual del
		//sistema con al que nos viene en el parametro
		dia = calendar.get(Calendar.DAY_OF_MONTH);//10
		mes = calendar.get(Calendar.MONTH);
		año = calendar.get(Calendar.YEAR);
	}
%>


<liferay-ui:calendar 
	day="<%= dia%>"
	month="<%= mes%>"
	year="<%=año%>"	
/>

<portlet:actionURL var="viewForm">
	<portlet:param name="<%=ActionRequest.ACTION_NAME %>" 
		value="procesarFecha"/>
</portlet:actionURL>

<aui:form action="${viewForm}" method="post" name="name">
	<liferay-ui:input-date 
		name="fechaEscogida"
		dayValue="<%= dia%>"
		monthValue="<%= mes%>"
		yearValue="<%= año%>"		
	/>
	<aui:button type="submit" value="Actualizar Fecha"></aui:button>
</aui:form>


