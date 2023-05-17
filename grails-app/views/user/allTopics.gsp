<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="linkshare.DocumentResource; javax.print.Doc; linkshare.SeriousnessEnum; linkshare.VisibilityEnum; linkshare.Subscription; linkshare.Resource; linkshare.LinkResource;linkshare.DocumentResource" %>
<%@ taglib prefix="paginate" uri="http://www.grails.org/tags/paginate" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Topics</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <asset:javascript src="dashboard.js"></asset:javascript>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <asset:javascript src="admin.js"></asset:javascript>

    <style>
    table, th, td {
        border: 1px solid black;
        border-collapse: collapse;
        padding: 5px;
    }
    th {
        background-color: #ccc;
    }
    </style>
</head>
<body class="bg-light">
%{--<g:render template="navbar" />--}%
<div class="container" style="padding-top: 50px;">
    <div class="table-responsive">
        <table class="table table-striped table-hover" id="topicTable" data-table>
            <thead>
            <tr><h1>topics</h1></tr>

            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>CreatedBy</th>
                <th>dateCreated</th>
                <th>lastUpdated</th>
                <th>visibility</th>
                <th>Manage</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${topics}" var="topic">
                <tr>
                    <td id="id_${topic.id}">${topic.id}</td>
                    <td id="topicName_${topic.id}">${topic.name}</td>
                    <td id="createdBy_${topic.id}"><a href="/User/userProfile?user=${topic.createdBy.id}">@${topic.createdBy.userName}</a></td>
                    <td id="dateCreated_${topic.id}">${topic.dateCreated}</td>
                    <td id="lastUpdated_${topic.id}">${topic.lastUpdated}</td>
                    <td id="visibility_${topic.id}">${topic.visibility}</td>
                    <td class="delete_${topic.id}">
                        <a id="deleteTopic_${topic.id}" href="#"  data-topic-id="${topic.id}"  onclick="deleteTopic(${topic.id})">
                            Delete
                        </a>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
