<html>
<head>
    <meta name="layout" content="main">
    <style type="text/css">
        h1
        {
            font-size:35px;
            font-weight: bold;
        }
        #unreadMess
        {
            border-radius: 50%;
            width: 20px;
            height:20px;
            background: red;
            border: solid red;
            color: white;
            text-align: center;
            font: 12px Arial;
        }
    </style>
</head>
<body>

<br/>
<h1><center>CONVERSATION STREET</center></h1>

<g:each in="${allConvers}" var="con" status="i">
    <table class="display">
    <tr>
        <g:if test="${session.currentUserID == con.receiver_id}">
            <td width="150px"><h3>${chatapp.DataUser.findById(con.sender_id).username}</h3></td>
                <g:if test="${con.unreadMessages  != 0}">
                    <td width="380px"><b><g:link action="allMessages" id="${con.sender_id}">${con.message_text} </g:link></b>
                    </td>
                    <td width="20px"><div id="unreadMess"> ${con.unreadMessages}</div></td>

                </g:if>
                <g:else>
                    <td width="400px"><g:link action="allMessages" id="${con.sender_id}">${con.message_text} </g:link></td>
                </g:else>
            </td>
        </g:if>
        <g:else>
            <td width="150px"><h3>${chatapp.DataUser.findById(con.receiver_id).username}</h3></td>
            <td width="400px"><g:link action="allMessages" id="${con.receiver_id}">${con.message_text}</g:link></td>
        </g:else>

        <td><h3><g:formatDate format="d. M. yyyy. H:mm" date="${con.send_date}"/></h3></td>
    </tr>
    </table>
</g:each>

</body>
</html>