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
    .saveBtn
    {

        width: 500px;
    }
    .saveBTN
    {
        padding-left: 30px;
    }
    </style>
</head>
<body>

<br/>
<h1><center>Welcome!</center></h1>
<h2><center>This is your profile</center></h2>
<form>
    <g:form action="myProfile">
        <div class="form-group">
            <label>Username</label>
            <br>
            ${userProfile.username}
        </div>

        <div class="form-group">
            <label for="first_name">First name</label>
            <input type="text" id="first_name" class="form-control" style="width:500px;"name="first_name" value="${userProfile.first_name}" required="">
        </div>

        <div class="form-group">
            <label for="last_name">Last name</label>
            <input type="text" class="form-control" id="last_name" style="width: 500px;"  name="last_name" value="${userProfile.last_name}" required="" >
        </div>
        <div class="form-group">
            <label>E-mail</label>
            <br>
            ${userProfile.mail}
        </div>
        <div class="form-group">
            <label>Birthday</label><br>
            <g:formatDate format="d. M. yyyy." date="${userProfile.birthday}"/>
        </div>

        <label class="saveBTN"><g:actionSubmit value="Update profile" class="saveBtn" action="saveProfile"></g:actionSubmit></label>
    </g:form>
</form>
</body>
</html>