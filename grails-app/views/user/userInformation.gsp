<html>
<head>
    <meta name="layout" content="main">
    <style type="text/css">
    h1
    {
        font-size:35px;
        font-weight: bold;
    }
    .form-group
    {
        padding-left: 30px;
    }

    </style>
    <title>${userInf.username}</title>
</head>
<body>
<br/>
<h1><center>${userInf.username}</center></h1>

<div class="form-group">
    <label>First name</label>
    <br>
    ${userInf.first_name}
</div>

<div class="form-group">
    <label>Last name</label>
    <br>
    ${userInf.last_name}
</div>

<div class="form-group">
    <label>Birthday</label>
    <br>
    <g:formatDate format="d. M. yyyy." date="${userInf.birthday}"/>
</div>

<div class="form-group">
    <label>Birthplace</label>
    <br>
    ${userInf.birthplace}
</div>

<div class="form-group">
    <label>Gender</label>
    <br>
    ${userInf.gender}
</div>


<label class="form-group"><g:link action="allMessages" id="${userInf.id}">Send message</g:link></label>

</body>
</html>