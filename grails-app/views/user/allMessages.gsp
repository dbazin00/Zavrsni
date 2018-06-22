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
<g:form>
<center><g:textArea rows="4" cols="50" style="resize: none" placeholder="Write your message..." maxlength="255" name="message_body"></g:textArea></center>
    <center><input type="file" name="userFile"/> </center>
 <center><label><g:actionSubmit value="Send message" controller="user" action="sendMessage"></g:actionSubmit></label></center>
</g:form>
<br/><br/>
<g:each in="${messages}" var="mess">

    <table class="display">
        <td width="150px"><h3>${chatapp.DataUser.findById(mess.sender_id).username}</h3><td>
        <td width="400px"><h3><center>${mess.message_text}</center></h3></td>

        <td><h3><g:formatDate format="d. M. yyyy. H:mm" date="${mess.send_date}"/></h3></td>
    </table>
</g:each>
</body>
</html>