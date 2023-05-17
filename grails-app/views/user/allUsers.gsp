<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="linkshare.DocumentResource; javax.print.Doc; linkshare.SeriousnessEnum; linkshare.VisibilityEnum; linkshare.Subscription; linkshare.Resource; linkshare.LinkResource;linkshare.DocumentResource" %>
<%@ taglib prefix="paginate" uri="http://www.grails.org/tags/paginate" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <asset:javascript src="dashboard.js"></asset:javascript>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <asset:javascript src="admin.js"></asset:javascript>
    <link href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>

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
%{--<g:render template="/user/navbar" />--}%
<div class="container" style="padding-top: 50px;">
    <div class="table-responsive">
        <table class="table table-striped table-hover" id="userTable" data-table>
            <thead>
            <tr><h1>Users</h1></tr>

            <tr>
                <th>Id</th>
                <th>Username</th>
                <th>Email</th>
                <th>Firstname</th>
                <th>Lastname</th>
                <th>Active</th>
                <th>Manage</th>
            </tr>
            </thead>
            <tbody>
                    <g:each in="${users}" var="user">
                        <tr>
                            <td id="id_${user.id}">${user.id}</td>
                            <td id="userName_${user.id}">${user.userName}</td>
                            <td id="email_${user.id}">${user.email}</td>
                            <td id="firstName_${user.id}">${user.firstName}</td>
                            <td id="lastName_${user.id}">${user.lastName}</td>
                            <td id="isActive_${user.id}">${user.isActive}</td>
                            <td class="activate-deactivate_${user.id}">
                                <a id="activate-deactivate_${user.id}" href="#"  data-user-id="${user.id}" data-isActive="${user.isActive}" onclick="editUserStance(${user.id},${user.isActive})">
                                ${user.isActive ? 'Deactivate' : 'Activate'}
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
