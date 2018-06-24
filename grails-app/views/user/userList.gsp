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
    <thead>
        <tr>
            <g:sortableColumn property="username" title="USERNAME" />
            <g:sortableColumn property="birthplace" title="BIRTHPLACE" />
            <th><b>AGE</b></th>
        </tr>
    </thead>
    <tbody>
        <g:each in="${persons}" var="person">
            <tr>
                <td><h3><g:link action="userInformation" id="${person.username}">${person.username}</g:link></h3></td>
                <td><h3>${person.birthplace}</h3></td>
                <td><h3>${person.age}</h3></td>
            </tr>
        </g:each>
    </tbody>
</table>
</body>
</html>