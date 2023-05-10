<%@ page import="linkshare.SeriousnessEnum; linkshare.VisibilityEnum" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Dashboard</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
%{--    <g:render template="navbar"></g:render>--}%
<div class="bg-img" height="100vh">

    <!--Navigation bar-->

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid ">
            <a class="navbar-brand" href="#">
                <g:img dir="images" file="logo_linkSharing.png" width="40" height="40"/>
                LinkShare
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse offset-4" id="navbarNav">
                <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
                <ul class="navbar-nav ">

                <g:if test="${session.currentUser}">
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
                                                <input type="text" class="form-control" name="name">
                                            </div>
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
                                            <div class="mb-3">
                                                <label for="shareTopic"  class="form-label">Topic*:</label>
                                                <select class="form-select" name="invitedForTopic" id="shareTopic">
                                                    <option><a href="#">Topic1</a></option>
                                                    <option><a href="#">Topic2</a></option>
                                                </select>
                                            </div>
                                            <!-- Modal Footer -->
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-primary">Invite</button>
                                                <button type="button" class="btn btn-secondary"
                                                        data-bs-dismiss="modal">Cancel</button>
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
                                        <div class="form-group">
                                            <label for="link">Link*</label>
                                            <input type="text" class="form-control" id="link" name="link" placeholder="Enter link">
                                        </div>
                                        <div class="form-group">
                                            <label for="description">Description</label>
                                            <textarea class="form-control" id="description" name="description" rows="3"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label for="topic">Topic</label>
                                            <select class="form-control" id="topic" name="topic">
                                                <option>Select topic</option>
                                                <option>Topic 1</option>
                                                <option>Topic 2</option>
                                                <option>Topic 3</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary">Share</button>
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
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
                                        <div class="form-group">
                                            <label >Document</label>
                                            <div class="custom-file">
                                                <input type="file" class="custom-file-input"  name="browse">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label >Description</label>
                                            <textarea class="form-control" name="description" rows="3"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label >Topic</label>
                                            <select class="form-control" name="topic">
                                                <option>Select topic</option>
                                                <option>Topic 1</option>
                                                <option>Topic 2</option>
                                                <option>Topic 3</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary">Share</button>
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
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
                                    <a href="#"><g:img dir="images" id="profilePhoto"  file="${session.currentUser.photo}" width="30" height="30"/></a>
                                </g:if>
                            </label>
                        </div>
                    </li>
                    <li>
                        <div class="dropdown show">
                            <a class="btn btn-outline btn-xs mt-2 dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown"
                               aria-haspopup="true" aria-expanded="false">
                                ${session.currentUser.userName}
                            </a>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-item" href="#">Profile</a>
                                <g:render template="adminOptions"></g:render>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="/Access/logoutUser">Logout</a>
                            </div>
                        </div>
                    </li>
                </g:if>
                </ul>
            </div>
        </div>
    </nav>
</div>
    <!-- Main Body -->
    <div class="container-fluid">
        <div class="row bg-secondary mt-1">


            <div class="col-sm-6">
                <!-- User details card -->
                <div class="row">
                    <div class="card mt-4" style="border-radius: 25px;">
                        <div class="card-body" >
                            <div class="card " >
                                <div class="row">
                                    <div class="col-sm-2 mt-4">
                                        <g:if test="${session.currentUser}">
                                            <a href="#"><g:img dir="images" id="profilePhoto"  file="${session.currentUser.photo}" width="80" height="80"/></a>
                                        </g:if>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="card-body"></div>
                                        <h5 class="card-title">${session.currentUser.firstName +" "+ session.currentUser.lastName}</h5>
                                        <p class="card-text text-muted">@${session.currentUser.userName}</p>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <p class="card-text"><strong>Subscriptions:</strong> ${userDetails["subscriptions"]}</p>
                                            </div>
                                            <div class="col-sm-6">
                                                <p class="card-text"><strong>Topics:</strong>  ${userDetails["topics"]}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="card" style="border-radius: 25px;">
                        <div class="card-header">
                            <b>Subscription</b>
                            <a href="#" class="" style="float: right;">View all</a>
                        </div>
                        <div class="card-body">
                            <div class="scrollable-container" style="overflow-y:scroll; max-height:270px">
                                <g:each in="${subscriptionDetails}" var="subsData">
                                    <div class="row mt-3">
                                        <div class="col-sm-2 mt-3">
                                            <g:img dir="images" file="${subsData.createdBy.photo}"  width="80" height="80"/>
                                        </div>
                                        <div class="col-md-8">
                                            <h5><a href="#">${subsData.topic.name}</a></h5>
                                            <p><span>@${subsData.createdBy.userName}</span></p>
                                            <div class="row">
                                                <div class="col">
                                                    <p class="card-text">Subscription:</p>
                                                </div>
                                                <div class="col">
                                                    <p class="card-text font-weight-bold text-primary">${subsData.topicCount}</p>
                                                </div>
                                                <div class="col">
                                                    <p class="card-text">Topic:</p>
                                                </div>
                                                <div class="col">
                                                    <p class="card-text font-weight-bold text-success">${subsData.topicCreatedByCount}</p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <p><a href="#">Unsubscribe</a></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row border-bottom">
                                        <div class="col-sm-3">
                                            <div class="dropdown" style="max-width:120px">

                                                <g:select class="form-select" id="seriousness" name="seriousness" aria-label="Select seriousness"
                                                          from="${linkshare.SeriousnessEnum.values()}" optionKey="key" >
                                                </g:select>

                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="dropdown" style="max-width:120px">
                                                <g:select class="form-select" id="visibility" name="visibility" aria-label="Select visibility"
                                                          from="${linkshare.VisibilityEnum.values()}" optionKey="key" >
                                                </g:select>
                                            </div>
                                        </div>
                                        <div class="col-sm-1">
                                            <button type="button" class="btn btn-link chat-icon" data-bs-toggle="modal"
                                                    data-bs-target="#sendInvitationModal">
                                                <g:img dir="images" file="sendInvitation.svg" width="30" height="30"/>
                                            </button>
                                        </div>
                                        <div class="col-sm-1">
                                            <button type="button" class="btn btn-link chat-icon" data-bs-toggle="modal"
                                                    data-bs-target="">
                                                <g:img dir="images" file="edit.svg" width="30" height="30"/>
                                            </button>
                                        </div>

                                        <div class="col-sm-1">
                                            <button type="button" class="btn btn-link chat-icon" data-bs-toggle="modal"
                                                    data-bs-target="">
                                                <g:img dir="images" file="delete.svg" width="30" height="30"/>
                                            </button>
                                        </div>
                                    </div>
                                </g:each>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- User Inbox -->
            <div class="col-sm-6 mt-4">
                <div class="card border-2">
                    <div class="card-header border-2">
                        <h2>Inbox</h2>
                    </div>
                    <div class="card-body" style="background-color: rgba(69, 68, 70, 0.144);">
                        <ul>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--  -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
</body>

</html>