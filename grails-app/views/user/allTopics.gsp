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
    <link href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <asset:javascript src="admin.js"></asset:javascript>
    <asset:javascript src="inputValidation.js"></asset:javascript>

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
<div class="bg-img" height="100vh">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid ">
            <a class="navbar-brand" href="/User">
                <g:img dir="images" file="logo_linkSharing.png" width="40" height="40"/>
                LinkShare
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse offset-4" id="navbarNav">
                <g:form class="d-flex" role="search" controller="DashboardAccess" action="searchTopic">
                    <input class="form-control me-2" type="search" id="query" name="query" placeholder="Search" aria-label="Search" onclick="textLimit('query')"required>
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </g:form>
                <ul class="navbar-nav ">

                    <!-- Create topic Modal -->
                    <li class="nav-item">
                        <!-- Button to trigger modal -->
                        <button type="button" class="btn btn-link chat-icon mt-2" data-bs-toggle="modal"
                                data-bs-target="#createTopicModal">
                            <g:img dir="images" file="createTopic.svg" width="30" height="30"/>
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="createTopicModal" tabindex="-1"
                             aria-labelledby="createTopicModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <!-- modal Header -->
                                    <div class="modal-header" >
                                        <h5 class="modal-title" id="createTopicModalLabel">Create Topic</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <!-- Modal Body -->
                                    <div class="modal-body">
                                        <g:form controller="DashboardAccess" action="createTopic">
                                            <div class="form-group mb-3">
                                                <label >Name:</label>
                                                <input type="text" class="form-control" id="createTopicName" name="createTopicName" onclick="textLimit('createTopicName')" required>
                                            </div>
                                            <div id="createTopicNameErrorMessage" style="display: none; color: red;"></div>
                                            <div class="form-group mb-3">
                                                <label >Visibility:</label>
                                                <g:select name="visibility" from="${VisibilityEnum.values()}" optionKey="key" />
                                            </div>
                                            <div class="form-group modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                <g:submitButton  name="Create" class="btn btn-primary" >Create</g:submitButton>
                                            </div>
                                        </g:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>

                    <!-- Send Invitation Modal -->
                    <li class="nav-item">
                        <!-- Button to trigger modal -->
                        <button type="button" class="btn btn-link chat-icon mt-2" data-bs-toggle="modal"
                                data-bs-target="#sendInvitationModal">
                            <g:img dir="images" file="sendInvitation.svg" width="30" height="30"/>
                        </button>
                        <!-- Modal -->
                        <div class="modal fade" id="sendInvitationModal" tabindex="-1"
                             aria-labelledby="sendInvitationModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="sendInvitationModalLabel">Send Invitation</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <!-- Modal Body -->
                                    <div class="modal-body">
                                        <g:form>
                                            <div class="mb-3">
                                                <label for="userEmail" class="form-label">Email*:</label>
                                                <input type="text" class="form-control" name="userEmail" id="userEmail">
                                            </div>
                                            <div class="form-group">
                                                <label >Topic*</label>
                                                <g:select name="inviteToTopic" id="inviteToTopic" from="${userDetails["subscribedTopics"]}" noSelection="['':'-Choose Topic-']" required="true" class="form-control"/>
                                            </div>
                                            <!-- Modal Footer -->
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-primary">Invite</button>
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                            </div>
                                        </g:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    %{--Share link modal--}%
                    <li class="nav-item">
                        <!-- Button to trigger modal -->
                        <button type="button" class="btn btn-link chat-icon mt-2" data-bs-toggle="modal"
                                data-bs-target="#shareLinkModal">
                            <g:img dir="images" file="shareLink.svg" width="30" height="30"/>
                        </button>
                        <!-- Modal -->
                        <div class="modal fade" id="shareLinkModal" tabindex="-1"
                             aria-labelledby="shareLinkModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="shareLinkModalLabel">Share Link</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <!-- Modal Body -->
                                    <div class="modal-body">
                                        <g:form controller="shareLink" action="shareLink">
                                            <div class="form-group">
                                                <label for="shareLinkUrl">Url*</label>
                                                <input type="text" class="form-control" id="shareLinkUrl" name="shareLinkUrl" placeholder="Enter link" onclick="textLimit('shareLinkUrl')" required>
                                            </div><div id="shareLinkUrlErrorMessage" style="display: none; color: red;"></div>
                                            <div class="form-group">
                                                <label for="shareLinkDescription">Description</label>
                                                <textarea class="form-control" id="shareLinkDescription" name="shareLinkDescription" rows="3" onclick="textLimit('shareLinkDescription')" required></textarea>
                                            </div><div id="shareLinkDescriptionErrorMessage" style="display: none; color: red;"></div>
                                            <div class="form-group">
                                                <label >Topic</label>
                                                <g:select name="shareLinkTopic" id="shareLinkTopic" from="${userDetails["subscribedTopics"]}" noSelection="['':'-Choose Topic-']" required="true" class="form-control"/>
                                            </div>
                                            <div class="modal-footer">
                                                <g:submitButton name="Share" class="btn btn-primary">Share</g:submitButton>
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                            </div>
                                        </g:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>

                    %{--document share modal--}%
                    <li class="align-self-start">
                        <!-- Button to trigger modal -->
                        <button type="button" class="btn btn-link chat-icon mt-2" data-bs-toggle="modal"
                                data-bs-target="#shareDocumentModal">
                            <g:img dir="images" file="shareDocument.svg" width="30" height="30"/>
                        </button>
                        <!-- Modal -->
                        <div class="modal fade" id="shareDocumentModal" tabindex="-1"
                             aria-labelledby="shareDocumentModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="shareDocumentModalLabel">Share Document</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <!-- Modal Body -->
                                    <div class="modal-body">
                                        <g:uploadForm controller="shareDocument" action="fileUpload">
                                            <div class="form-group">
                                                <label>Document</label>
                                                <div class="custom-file">
                                                    <input type="file" class="custom-file-input" id="documentResource" name="documentResource" onclick="textLimit('documentResource')" required>
                                                </div>
                                            </div><div id="documentResourceErrorMessage" style="display: none; color: red;"></div>
                                            <div class="form-group">
                                                <label >Description</label>
                                                <textarea class="form-control" name="documentDescription" rows="3" onclick="textLimit('documentDescription')" required></textarea>
                                            </div><div id="documentDescriptionErrorMessage" style="display: none; color: red;"></div>
                                            <div class="form-group">
                                                <label >Topic</label>
                                                <g:select name="documentTopic" id="documentTopic" from="${userDetails["subscribedTopics"]}" noSelection="['':'-Choose Topic-']" required="true" class="form-control"/>
                                            </div>
                                            <div class="modal-footer">
                                                <g:submitButton id="shareDocument" name="Share" class="btn btn-primary">Share</g:submitButton>
                                                <Button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</Button>
                                            </div>
                                        </g:uploadForm>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item">
                        <!-- User profile section -->
                        <div class="userProfilePhoto mt-2">
                            <label for="profilePhoto" class="form-label mt-2">
                                <g:if test="${session.currentUser}">
                                    <g:link controller="User" action="userProfile" params="[user:session.currentUser.id]"><g:img dir="images" id="profilePhoto"  file="${session.currentUser.photo}" width="30" height="30"/></g:link>
                                </g:if>
                            </label>
                        </div>
                    </li>
                    <li class="nav-item">
                        <div class="dropdown show">
                            <a class="btn btn-outline btn-xs mt-2 dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown"
                               aria-haspopup="true" aria-expanded="false">
                                ${session.currentUser.userName}
                            </a>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-item" href="/User/editUserProfile?user=${session.currentUser.id}">Profile</a>
                                <g:render template="/user/adminOptions"></g:render>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="/Access/logoutUser">Logout</a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>
<div id="queryErrorMessage" style="display: none; color: red;"></div>
<div class="container-fluid" style="padding-top: 50px;">
    <div class="row">
        <div class="table-responsive">
            <table class="table table-striped table-hover" id="topicTable" data-table>
                <thead>
                <tr><h5>Topics</h5></tr>

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
</div>
<script>
    document.getElementById('shareDocument').addEventListener('click', function(event) {
        var fileInput = document.getElementById('documentResource');
        var maxFileSize = 128 * 1024;

        if (fileInput.files.length > 0) {
            var file = fileInput.files[0];

            if (file.size > maxFileSize) {
                displayErrorMessage("Error: The file size exceeds the maximum allowed size of 128KB.");
                event.preventDefault();
                return;
            }

            var allowedTypes = ['file/pdf', 'file/docx', 'file/pptx','file/xls'];
            if (!allowedTypes.includes(file.type)) {
                displayErrorMessage("Error: Please choose a proper file (pdf, docx, pptx, xls).");
                event.preventDefault();
            }
        }
    });

    function displayErrorMessage(message) {
        var registerErrorMessage = document.getElementById('documentResourceErrorMessage');
        registerErrorMessage.textContent = message;
        registerErrorMessage.style.display = 'block';
    }

    document.getElementById('documentResource').addEventListener('change', function(event) {
        var registerErrorMessage = document.getElementById('documentResourceErrorMessage');
        registerErrorMessage.style.display = 'none';
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
</body>
</html>
