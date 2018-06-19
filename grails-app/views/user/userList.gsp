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
<table class="display">
    <tr>
    <th><h3><b>NO</b></h3></th>
    <th><h3><b>USERNAME</b></h3></th>
    <th><h3><b>AGE</b></h3></th>
    </tr>

<g:each in="${persons}" var="person" status="i">
        <tr>
            <td><h3>${i+1}.</h3></td>
        <td><h3><g:link action="userInformation" id="${person.username}">${person.username}</g:link></h3></td>
        <td><h3>${person.age}</h3></td>
    </tr>


</g:each>
</table>
</body>
</html>