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
        .regBtn
        {

            width: 230px;
        }
        .regBTN
        {
            padding-left: 30px;
        }
    </style>
</head>
<body>

<br/>
<h1><center>REGISTRATION</center></h1>
<form>
<g:form>
    <div class="form-group">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" class="form-control" style="width:230px;" required>
    </div>

    <div class="form-group">
        <label for="first_name">First name</label>
        <input type="text" id="first_name" class="form-control" style="width:230px;"name="first_name" required="">
    </div>

    <div class="form-group">
        <label for="last_name">Last name</label>
        <input type="text" class="form-control" id="last_name" style="width: 230px;"  name="last_name" required="" >
    </div>
    <div class="form-group">
        <label for="mail">E-mail</label>
        <input type="email" class="form-control" id="mail" style="width: 230px;"  name="mail" required="" >
    </div>
    <div class="form-group">
        <label for="password">Password</label><br>
        <input type="password" class="password" id="password" style="width: 230px;"  name="password" required="" >
    </div>
    <div class="form-group">
        <label for="birthday">Birthday</label><br>
        <input type="date" class="birthday" id="birthday" style="width: 230px;"  name="birthday" required="" >
    </div>
    <div class="form-group">
        <label for="birthplace">Birthplace</label><br>
        <g:select name="birthplace" from="['Zagreb', 'Split', 'Osijek', 'Rijeka', 'Other']"/>

    </div>
    <div class="form-group">
        <label for="gender">Gender</label><br>
        <g:radioGroup name="gender"
                      labels="['Female','Male']"
                      values="['Female','Male']" value="Female">
            <p>${it.radio} ${it.label} </p>
        </g:radioGroup>
    </div>
    <div class="form-group">
        <font color="red">${flash.message}</font>
    </div>
    <label class="regBTN"><g:actionSubmit value="Register" class="regBtn" action="registerNewUser"></g:actionSubmit></label>
</g:form>

</body>
</html>