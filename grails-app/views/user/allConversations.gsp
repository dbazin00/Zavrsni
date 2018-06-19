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
    <script>
        $(document).ready(function() {
            setTimeout(function() {
                location.href = location.href;
            }, 3000);
            // 10000 == 10 seconds
            // Change this if you want a different refresh period
        });
    </script>
</head>
<body>

<br/>
<h1><center>CONVERSATION STREET</center></h1>

<g:each in="${allConvers}" var="con">
    <table class="display">
    <tr>
        <g:if test="${session.currentUserID == con.receiver_id}">
            <td width="150px"><h3>${chatapp.DataUser.findById(con.sender_id).username}</h3></td>
            <td width="400px"><g:link action="allMessages" id="${con.sender_id}">${con.message_text}</g:link></td>
        </g:if>
        <g:else>
            <td width="150px"><h3>${chatapp.DataUser.findById(con.receiver_id).username}</h3></td>
            <td width="400px"><g:link action="allMessages" id="${con.receiver_id}">${con.message_text}</g:link></td>
        </g:else>

        <td><h3><g:formatDate format="d. M. yyyy. H:m" date="${con.send_date}"/></h3></td>
    </tr>
    </table>
</g:each>

</body>
</html>