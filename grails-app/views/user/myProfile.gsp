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

        width: 230px;
    }
    .saveBTN
    {
        padding-left: 30px;
    }
    </style>
    <title>My profile: ${chatapp.DataUser.get(session.currentUserID).username}</title>
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
            <input type="text" id="first_name" class="form-control" style="width:230px;"name="first_name" value="${userProfile.first_name}" required="">
        </div>

        <div class="form-group">
            <label for="last_name">Last name</label>
            <input type="text" class="form-control" id="last_name" style="width: 230px;"  name="last_name" value="${userProfile.last_name}" required="" >
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

        <div class="form-group">
            <label>Birthplace</label><br>
            <g:select name="birthplace" from="['Zagreb', 'Split', 'Osijek', 'Rijeka', 'Other']" value="${userProfile.birthplace}"/>
        </div>
        <div class="form-group">
            <label>Gender</label><br>
            ${userProfile.gender}
        </div>

        <label class="saveBTN"><g:actionSubmit value="Update profile" class="saveBtn" action="saveProfile"></g:actionSubmit>
            <br><br>
            <g:link action="deleteUser">
                <input type="button" value="Delete profile" class="saveBtn" onclick="return confirm('Are you sure you want to delete your profile?')"/>
            </g:link>
        </label>
    </g:form>



</form>
</body>
</html>