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

            width: 500px;
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
        <input type="text" id="username" name="username" class="form-control" style="width:500px;" required>
    </div>

    <div class="form-group">
        <label for="first_name">First name</label>
        <input type="text" id="first_name" class="form-control" style="width:500px;"name="first_name" required="">
    </div>

    <div class="form-group">
        <label for="last_name">Last name</label>
        <input type="text" class="form-control" id="last_name" style="width: 500px;"  name="last_name" required="" >
    </div>
    <div class="form-group">
        <label for="mail">E-mail</label>
        <input type="email" class="form-control" id="mail" style="width: 500px;"  name="mail" required="" >
    </div>
    <div class="form-group">
        <label for="last_name">Password</label><br>
        <input type="password" class="password" id="password" style="width: 500px;"  name="password" required="" >
    </div>
    <div class="form-group">
        <label for="birthday">Birthday</label><br>
        <input type="date" class="birthday" id="birthday" style="width: 500px;"  name="birthday" required="" >
    </div>

%{--<button type="submit" class="btn btn-default">Send</button>--}%
    <label class="regBTN"><g:actionSubmit value="Registrate" class="regBtn" action="registrateNewUser"></g:actionSubmit></label>
</g:form>
</form>
</body>
</html>