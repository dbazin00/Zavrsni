<html>
<head>
    <meta name="layout" content="main">
    <style type="text/css">
    h1
    {
        font-size:35px;
        font-weight: bold;
    }
    </style>
</head>
<body>

<br/>
<h1><center>ALL USERS</center></h1>
<div class="row">
    <div class="col-sm-4"><h3><b>NO</b></h3></div>
    <div class="col-sm-4"><h3><b>USERNAME</b></h3></div>
    <div class="col-sm-4"><h3><b>AGE</b></h3></div>
</div>
<g:each in="${persons}" var="person" status="i">
    <div class="row">
        <div class="col-sm-4"><h3>${i+1}.</h3></div>
        <div class="col-sm-4"><h3><g:link action="userInformation" params="persons[1]">${person.username}</g:link></h3></div>
        <div class="col-sm-4"><h3><g:formatDate format="d. M. yyyy." date="${person.birthday}"/></h3></div>
    </div>
</g:each>
</body>
</html>