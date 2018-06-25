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
<fieldset class="form">
    <g:form action="userList" method="GET">
        <div class="fieldcontain">
            <label for="query">Search for users:</label>
            <g:textField name="query" value="${params.query}"/>
        </div>
    </g:form>
</fieldset>
<table class="display">
    <thead>
        <tr>
            <g:sortableColumn property="username" title="USERNAME" />
            <g:sortableColumn property="birthplace" title="BIRTHPLACE" />
            <g:sortableColumn property="birthday" title="Age" />
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