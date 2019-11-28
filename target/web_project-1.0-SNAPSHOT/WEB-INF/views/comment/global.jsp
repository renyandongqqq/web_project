<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%-- 基准域名 --%>
<c:set var="basePathFull" value="${pageContext.request.scheme}://${pageContext.request.serverName}${pageContext.request.serverPort!=80?':'.concat(pageContext.request.serverPort):''}${pageContext.request.contextPath}" />

<c:set var="basePath" value="${pageContext.request.contextPath}" />

<%-- 静态资源域名 --%>
<c:set var="staticPath" value="${basePath}" />

<%-- 系统当前时间[DATE类型] --%>
<jsp:useBean id="now" class="java.util.Date" />

<%-- 系统当前时间[String类型，格式化] --%>
<fmt:formatDate var="datetime" value="${now}" type="DATE" pattern="yyyy-MM-dd HH:mm:ss" />

<%-- 版本号version --%>
<c:set var="version" value="?t=1527437113000" />
