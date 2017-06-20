<%--
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@page import="javax.portlet.ActionRequest"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@taglib uri="http://liferay.com/tld/aui" prefix="aui" %>

<portlet:defineObjects />

This is the <b> 01_HolaMundo</b>

<a href='<portlet:renderURL portletMode="EDIT"/> '> Va al doEdit</a>

<portlet:actionURL var="saludarURL">
	<portlet:param name="<%=ActionRequest.ACTION_NAME %>" value="saludar"/>
	<portlet:param name="nombre" value="veronica" />
</portlet:actionURL>

<%
	String name = "nombre";
%>


<form action="<%=saludarURL%>" method="post">
	<input type="submit" value="Enviar" />
</form>
<portlet:actionURL var="altaPersona">
	<portlet:param name="<%=ActionRequest.ACTION_NAME %>" value="altaPersona"/>
</portlet:actionURL>

<!-- Mejor usar este forumulario para mandar parametros, da menos problemas -->
<aui:form action="${altaPersona}" method="post"> 
	<aui:input type="text" name="nombre" label="Nombre:"> </aui:input>
	<aui:input type="number" name="edad" label="Edad:"> </aui:input>
	<aui:input type="number" name="dni" label="DNI:"> </aui:input>
	<aui:button type="submit" value="Alta"></aui:button>
</aui:form>


<%=request.getAttribute("saludo") %>