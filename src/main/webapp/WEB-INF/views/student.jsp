<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>StudentVieW</title>

    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <!-- Our Custom CSS -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/style5.css"/>">

    <link rel="stylesheet" type="text/css" href="<c:url value="/css/form.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/radio.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/checkbox.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/loader1.css"/>">

    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
</head>

<body>

<div class="wrapper">
    <!-- Sidebar Holder -->
    <nav id="sidebar">
        <div class="sidebar-header"><h3>UPT</h3></div>

        <ul class="list-unstyled components">
            <li><a id="courses">Course</a></li>
            <li><a id="results">Results</a></li>
        </ul>
    </nav>

    <!-- Page Content Holder -->
    <div id="content">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">

                <button type="button" id="sidebarCollapse" class="navbar-btn">
                    <span></span>
                    <span></span>
                    <span></span>
                </button>
                <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-align-justify"></i>
                </button>
                <div id="window-header" style="padding-left: 20px"></div>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="nav navbar-nav ml-auto">
                        <li class="nav-item active"><a class="nav-link" id="profile">Profile</a></li>
                        <li class="nav-item"><a class="nav-link" href="/accounts/sign_out" id="logout">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div id="no-data" style="color: orangered"></div>

        <form id="student-profile" class="login-block" method="post">
            <div><h1 style="display: inline">Profile Data</h1> <a id="enable-profile-edit"><i class="fa fa-edit" style="display: inline;font-size:20px;color:#7386D5;float: right"></i></a></div>
            <table style="width: 100%; margin-top: 10px;">
                <tr>
                    <td>First Name</td>
                    <td style="padding-left: 10px">Last Name</td>
                </tr>
                <tr>
                    <td style="padding-right: 10px"><label for="student-first-name"></label><input value="${student.firstName}" id="student-first-name" type="text" required/></td>
                    <td style="padding-left: 10px"><label for="student-last-name"></label><input value="${student.lastName}" id="student-last-name" type="text" required/></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td style="padding-left: 10px">Birthdate</td>
                </tr>
                <tr>
                    <td style="padding-right: 10px"><label for="student-gender"></label><input value="${student.gender}" id="student-gender" type="text" required/></td>
                    <td style="padding-left: 10px"><label for="student-birthdate"></label><input value="${student.birthdate}" id="student-birthdate" type="text" onfocus="(this.type='date')" required/></td>
                </tr>
                <tr>
                    <td>Username</td>
                    <td style="padding-left: 10px">Password</td>
                </tr>
                <tr>
                    <td style="padding-right: 10px"><label for="student-username"></label><input value="${student.user.username}" id="student-username" type="text" required/></td>
                    <td style="padding-left: 10px"><label for="student-password"></label><input value="${student.user.password}" id="student-password" type="text" required/></td>
                </tr>
            </table>
            <button id="submit-student" type="submit" value="${student.id}" userId="${student.userId}" style="float: right; width: 30%">Save Changes</button>
        </form>

        <div id="course-exams">
            <table id="course-table" class="table" style="float: left; width: 35%; box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);">
                <thead class="thead-light"><tr>
                    <th scope="col">Course Description</th><th scope="col">Pedagogue</th>
                </tr></thead>
                <tbody>
                <c:forEach var="course" items="${courses}">
                    <tr class="course-row" val="${course.id}" val1="${course.description}">
                        <td>${course.description}</td>
                        <td>${course.pedagogueFullName}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <div id="exams" class="login-block" class="buttonAlign"">
                <h1 id="course">Course Exams</h1>

                <div id="exam-error" style="color: orangered"></div>

                <table id="exam-table" class="table" style="margin-top: 20px; box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);">
                    <thead class="thead-light"><tr>
                        <th scope="col" style="width: 40%">Header</th><th scope="col" style="width: 60%">Description</th>
                    </tr></thead>
                    <tbody>
                    </tbody>
                </table>
            </div>

        </div>

        <form id="exam-form" class="login-block" method="post" style="width: 75%;margin-top: 50px">
            <div><h1 style="text-align: center; font-size: 24px" id="exam-header"></h1><a id="hide-exam" style="display: inline; color: red; float: right"><i><u>Close</u></i></a></div>
            <div id="exam-description" style="margin-top:20px; font-size: 20px;"></div>
            <div id="exam-course" style="margin-bottom: 20px; font-size: 20px;"></div>
            <div style="margin-top:20px; margin-bottom: 20px; font-size: 18px;" id="questions-number" >Questions</div>

            <div id="question-container">

            </div>

            <button value="{$student.id}" id="submit-exam" type="submit" class="buttonAlign">Submit</button>
        </form>

        <table id="results-table" class="table" style="float: left; width: 100%; box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);">
            <thead class="thead-light"><tr>
                <th scope="col">Course</th><th scope="col">Exam Header</th><th scope="col">Description</th><th scope="col">Date</th><th scope="col" style="width: 15%; text-align: right">Result</th>
            </tr></thead>
            <tbody>
            <c:forEach var="examTaken" items="${examTakenLists}">
                <tr class="course-row"">
                    <td>${examTaken.course}</td>
                    <td>${examTaken.examHeader}</td>
                    <td>${examTaken.examDescription}</td>
                    <td>${examTaken.holdingDate}</td>
                    <td style="width: 15%; text-align: right">${examTaken.result}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

<%--        <div id="preloader">--%>
<%--            <div id="loader"></div>--%>
<%--        </div>--%>
    </div>
</div>

<!-- jQuery CDN - Slim version (=without AJAX) -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<!-- Popper.JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="<c:url value="/js/student.js"/>"></script>

</body>
</html>