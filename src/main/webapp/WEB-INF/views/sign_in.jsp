<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Sign In | Elearning</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/sign_in.css"/>">

</head>
    <body>
        <c:if test="${sessionScope.user_status != null}">
            <c:redirect url="/${sessionScope.user_status}"/>
        </c:if>
				<div class="deconstructed">
		  ELearning
		  <div>ELearning</div>
		  <div>ELearning</div>
		  <div>ELearning</div>
		  <div>ELearning</div>
		</div>
			
        <form:form id="submit-form" class="login-block" method="post" action="/accounts/sign_in/validate" modelAttribute="user">
            <h1>Sign In</h1>
            <small><form:errors cssClass="error" path="username"/></small>
            <label for="username"></label><form:input type="text" value="" placeholder="Username" id="username" required="" path="username"/>
            <small><form:errors cssClass="error" path="password"/></small>
            <label for="password"></label><form:input type="password" value="" placeholder="Password" id="password" required="" path="password"/>
            <button type="submit" id="submit-user">Submit</button>
            <br><br>
            <select name="language" id="select-language" >
                <option value="en">English</option>
                <option value="al">Shqip</option>
            </select>
            <c:if test="${noUser}">
              
                 <div style="margin-top: 17px;" class="alert alert-danger"> <strong>User</strong> credential are incorrect.</div>
            </c:if>
        </form:form>
    </body>
</html>