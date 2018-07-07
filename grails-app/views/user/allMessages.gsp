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
    <title>Chat with ${chatapp.DataUser.get(session.chatFriend).username}</title>
</head>
<body>

<br/>
<g:form controller="user" action="sendMessage" enctype="multipart/form-data">
<center><g:textArea rows="4" cols="50" style="resize: none" placeholder="Write your message..." maxlength="255" name="message_body" required=""></g:textArea></center>
    <center><input type="file" name="userFile"/> </center>
 <center><label><input type="submit" value="Send message"/> </label></center>
</g:form>
<br/><br/>
<g:each in="${messages}" var="mess">

    <table class="display">
        <td width="150px"><h3>${chatapp.DataUser.findById(mess.sender_id).username}</h3><td>
        <td width="400px"><h3><center>${mess.message_text}</center></h3>
        <center><g:link action="downloadFile" id="${mess.id}">${mess.filename}</g:link></center>
        </td>

        <td><h3><g:formatDate format="d. M. yyyy. H:mm" date="${mess.send_date}"/></h3></td>
    </table>
</g:each>
</body>
</html>