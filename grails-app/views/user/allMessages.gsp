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
    <meta http-equiv="refresh" content="5" >
</head>
<body>

<br/>
<h1><center>CONVERSATION STREET</center></h1>

<g:each in="${messages}" var="mess">

    <table class="display">
        <td width="150px"><h3>${chatapp.DataUser.findById(mess.sender_id).username}</h3><td>
        <td width="400px"><h3><center>${mess.message_text}</center></h3></td>

        <td><h3><g:formatDate format="d. M. yyyy. H:m" date="${mess.send_date}"/></h3></td>
    </table>
</g:each>
</body>
</html>