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
    %{--<meta http-equiv="refresh" content="5" >--}%
</head>
<body>

<br/>
<h1><center>CONVERSATION STREET</center></h1>

<g:each in="${allConvers}" var="con">
    <div class="row">
        <g:if test="${session.currentUserID == con.receiver_id}">
            <div class="col-sm-4"><h3>${chatapp.DataUser.findById(con.sender_id).username}</h3></div>
        </g:if>
        <g:else>
            <div class="col-sm-4"><h3>${chatapp.DataUser.findById(con.receiver_id).username}</h3></div>
        </g:else>

        <div class="col-sm-4"><h3>${con.message_text}</h3></div>
        <div class="col-sm-4"><h3><g:formatDate format="dd. MM. yyyy. H:m" date="${con.send_date}"/></h3></div>
    </div>
</g:each>

</body>
</html>