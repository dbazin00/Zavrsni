<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>
<body>

    <div class="navbar navbar-default navbar-static-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/#">
		    <asset:image src="grails.svg" alt="Grails Logo"/>
                </a>
            </div>
            <div class="navbar-collapse collapse" aria-expanded="false" style="height: 0.8px;">
                <ul class="nav navbar-nav navbar-left">
                    <li><g:link controller="user" action="userList">User list</g:link></li>
                    <li><g:link controller="user" action="myProfile">My profile</g:link></li>
                    <li><g:link controller="user" action="allConversations">Messages</g:link></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <g:pageProperty name="page.nav" />
                    <g:if test="${session.currentUserID != null}">
                        <li><g:link controller="user" action="logout" onclick="return confirm('Are you sure you want to logout?')">Logout</g:link></li>
                    </g:if>
                </ul>
            </div>
        </div>
    </div>

    <g:layoutBody/>

    <center><div class="footer" role="contentinfo">&#169;<g:formatDate format="dd-MM-yyyy" date="${new Date()}"/></div></center>

    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>

    <asset:javascript src="application.js"/>

</body>
</html>
