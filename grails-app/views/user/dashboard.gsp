<%@ page import="linkshare.DocumentResource; javax.print.Doc; linkshare.SeriousnessEnum; linkshare.VisibilityEnum; linkshare.Subscription; linkshare.Resource; linkshare.LinkResource;linkshare.DocumentResource" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Dashboard</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
    <asset:javascript src="dashboard.js"></asset:javascript>
</head>
<body class="bg-secondary">
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
                                                <input type="text" class="form-control" id="shareLinkUrl" name="shareLinkUrl" placeholder="Enter link">
                                            </div>
                                            <div class="form-group">
                                                <label for="shareLinkDescription">Description</label>
                                                <textarea class="form-control" id="shareLinkDescription" name="shareLinkDescription" rows="3"></textarea>
                                            </div>
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
                                                    <input type="file" class="custom-file-input"  name="document">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label >Description</label>
                                                <textarea class="form-control" name="documentDescription" rows="3"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label >Topic</label>
                                                <g:select name="documentTopic" id="documentTopic" from="${userDetails["subscribedTopics"]}" noSelection="['':'-Choose Topic-']" required="true" class="form-control"/>
                                            </div>
                                            <div class="modal-footer">
                                                <g:submitButton name="Share" class="btn btn-primary">Share</g:submitButton>
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
<g:if test="${flash.message}">
    <div class="alert alert-success alert-dismissible fade show " role="alert">${flash.message}
        <button type="button" class="btn-close btn-sm" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</g:if>
    <!-- Main Body -->
%{--<g:render template="navbar" />--}%
<div class="container-fluid"  height="100vh"  >
        <div class="row" height="100vh" >
            <div class="col-sm-6" height="100vh">
                <!-- User details card -->
                <div class="row">
                    <div class="card mt-4" style="border-radius: 25px;">
                        <div class="card-body" >
                            <div class="card " >
                                <div class="row">
                                    <div class="col-sm-2 mt-4">
                                        <g:if test="${session.currentUser}">
                                            <a href="/User/userProfile?user=${session.currentUser.id}"><g:img dir="images" id="profilePhoto"  file="${session.currentUser.photo}" width="80" height="80"/></a>
                                        </g:if>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="card-body"></div>
                                        <h5 class="card-title">${session.currentUser.firstName +" "+ session.currentUser.lastName}</h5>
                                        <p class="card-text text-muted"><a href="/User/userProfile?user=${session.currentUser.id}">@${session.currentUser.userName}</a></p>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <p class="card-text"><strong>Subscriptions:</strong> ${userDetails["subscriptionCount"]}</p>
                                            </div>
                                            <div class="col-sm-6">
                                                <p class="card-text"><strong>Topics:</strong>  ${userDetails["topicCount"]}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

%{--subscription list--}%
                <div class="row mt-3">
                    <div class="card" style="border-radius: 25px;">
                        <div class="card-header">
                            <b>Subscription</b>
                            <a href="#" class="" style="float: right;">View all</a>
                        </div>
                        <div class="card-body">
                            <div class="scrollable-container" style="overflow-y:scroll; max-height:270px">
                                <g:each in="${subscriptionDetails}" var="subsData">
                                    <div class="row" id="topic_${subsData.topic.id}">
                                        <div class="row mt-3" id="topic_${subsData.topic.id}">
                                            <div class="col-sm-2 mt-3">
                                                <a href="/User/userProfile?user=${subsData.createdBy.id}"><g:img dir="images" file="${subsData.createdBy.photo}"  width="80" height="80"/></a>
                                            </div>
                                            <div class="col-md-8">
                                                <h5><a href="/TopicShow/index?topicId=${subsData.topic.id}" class="topicName" id="topicName_${subsData.topic.id}">${subsData.topic.name}</a></h5>
                                                <div class="edit-form" id="editTopicClass_${subsData.topic.id}" style="display:none;">
                                                    <form>
                                                        <input type="text" name="newTopicName">
                                                        <button type="button" onclick="saveTopic('${subsData.topic.id}')" class="save-button" id="saveTopic_${subsData.topic.id}">Save</button>
                                                        <button type="button" onclick="cancelTopic('${subsData.topic.id}')" class="cancel-button"id="cancelTopic_${subsData.topic.id}">Cancel</button>
                                                    </form>
                                                </div>
                                                <p><a href="/User/userProfile?user=${subsData.createdBy.id}"><span>@${subsData.createdBy.userName}</span></a></p>
                                                <div class="row">
                                                    <div class="col">
                                                        <p class="card-text">Subscriptions:</p>
                                                    </div>
                                                    <div class="col">
                                                        <p class="card-text font-weight-bold text-primary">${subsData.topicCount}</p>
                                                    </div>
                                                    <div class="col">
                                                        <p class="card-text">Post:</p>
                                                    </div>
                                                    <div class="col">
                                                        <p class="card-text font-weight-bold text-success">${subsData.topicResourceCount}</p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col">
                                                        <g:if test="${Subscription.findByUserAndTopic(session.currentUser,subsData.topic)}">
                                                            <p><a href="#" onclick="Unsubscribe(${subsData.topic.id},${session.currentUser.id})">Unsubscribe</a></p>
                                                        </g:if>
                                                        <g:else>
                                                            <p><a href="#" onclick="subscribe(${subsData.topic.id},${session.currentUser.id})">Subscribe</a></p>
                                                        </g:else>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row border-bottom">
                                            <div class="col-sm-3">
                                                <div class="dropdown" style="max-width:120px">
                                                    <g:select class="form-select" id="seriousness_${subsData.subscription.id}" name="seriousness_${subsData.subscription.id}" value="${subsData.subscription.seriousness}" aria-label="Select seriousness"
                                                              from="${linkshare.SeriousnessEnum.values()}" optionKey="key" onclick="editSeriousness('${subsData.subscription.id}')">
                                                    </g:select>
                                                </div>
                                            </div>
                                            <g:if test="${session.currentUser.id==subsData.topic.createdBy.id || session.currentUser.isAdmin==true}">
                                                <div class="col-sm-3">
                                                    <div class="dropdown" style="max-width:120px">
                                                        <g:select class="form-select" id="visibility_${subsData.topic.id}" name="visibility_${subsData.topic.id}" value="${subsData.topic.visibility}" aria-label="Select visibility"
                                                                  from="${linkshare.VisibilityEnum.values()}" optionKey="key" onclick="editVisibility('${subsData.topic.id}')">
                                                        </g:select>
                                                    </div>
                                                </div>
                                            </g:if>
                                            <div class="col-sm-1">
                                                <button type="button" class="btn btn-link chat-icon" data-bs-toggle="modal" data-bs-target="sendInvitationmodal_${subsData.topic.id}">
                                                    <g:img dir="images" file="sendInvitation.svg" width="30" height="30"/>
                                                </button>
                                                <div class="modal fade" id="sendInvitationModal_${subsData.topic.id}" tabindex="-1"
                                                     aria-labelledby="sendInvitationModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <!-- Modal Header -->
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="sendInvitationModalLabel_${subsData.topic.id}">Send Invitation</h5>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                        aria-label="Close"></button>
                                                            </div>
                                                            <!-- Modal Body -->
                                                            <div class="modal-body">
                                                                <g:form>
                                                                    <div class="mb-3">
                                                                        <label for="userEmail" class="form-label">Email*:</label>
                                                                        <input type="text" class="form-control" name="userEmail" id="userEmail_${subsData.topic.id}">
                                                                    </div>
                                                                    <div class="mb-3">
                                                                        <label for="shareTopic_${subsData.topic.id}"  class="form-label">Topic*:</label>
                                                                        <select class="form-select" name="invitedForTopic" id="shareTopic_${subsData.topic.id}">
                                                                            <option><a href="#">Topic1</a></option>
                                                                            <option><a href="#">Topic2</a></option>
                                                                        </select>
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
                                            </div>
                                            <g:if test="${session.currentUser.id==subsData.topic.createdBy.id || session.currentUser.isAdmin==true}">
                                                <div class="col-sm-1">
                                                    <button type="button"  id="editTopic_${subsData.topic.id}" class="btn btn-link chat-icon" onclick="editTopicName('${subsData.topic.id}')">
                                                        <g:img dir="images" file="edit.svg" width="30" height="30"/>
                                                    </button>
                                                </div>

                                                <div class="col-sm-1">
                                                    <button type="button" class="btn btn-link chat-icon" id="deleteTopic_${subsData.topic.id}" onclick="deleteTopic('${subsData.topic.id}')">
                                                        <g:img dir="images" file="delete.svg" width="30" height="30"/>
                                                    </button>
                                                </div>
                                            </g:if>
                                        </div>
                                    </div>
                                </g:each>
                            </div>
                        </div>
                    </div>
                </div>

%{-- Trending Topic--}%
                <div class="row mt-3">
                    <div class="card" style="border-radius: 25px;">
                        <div class="card-header">
                            <b>Trending topics</b>
                        </div>
                        <div class="card-body">
                            <div class="scrollable-container" style="overflow-y:scroll; max-height:270px">
                                <div class="row">
                                    <g:each in="${trendingTopic}" var="trending">
                                        <div class="row" id="trendingTopic_${trending.topic.id}">
                                            <div class="row mt-3">
                                                <div class="col-sm-2 mt-3">
                                                    <a href="/User/userProfile?user=${trending.topic.createdBy.id}"><g:img dir="images" file="${trending.topic.createdBy.photo}"  width="80" height="80"/></a>
                                                </div>
                                                <div class="col-md-8">
                                                    <h5><a href="/TopicShow/index?topicId=${trending.topic.id}" class="topicName" id="trendingTopicName_${trending.topic.id}">${trending.topic.name}</a></h5>
                                                    <div class="edit-form" id="editTrendingTopicClass_${trending.topic.id}" style="display:none;">
                                                        <form>
                                                            <input type="text" name="newTopicName">
                                                            <button type="button" onclick="saveTrendingTopic('${trending.topic.id}')" class="save-button" id="saveTrendingTopic_${trending.topic.id}">Save</button>
                                                            <button type="button" onclick="cancelTrendingTopic('${trending.topic.id}')" class="cancel-button"id="cancelTrendingTopic_${trending.topic.id}">Cancel</button>
                                                        </form>
                                                    </div>
                                                    <p><a href="/User/userProfile?user=${trending.topic.createdBy.id}"><span>@${trending.topic.createdBy.userName}</span></a></p>
                                                    <div class="row">
                                                        <div class="col">
                                                            <p class="card-text">Subscriptions:</p>
                                                        </div>
                                                        <div class="col">
                                                            <p class="card-text font-weight-bold text-primary">${trending.subscriptionCount}</p>
                                                        </div>
                                                        <div class="col">
                                                            <p class="card-text">Post:</p>
                                                        </div>
                                                        <div class="col">
                                                            <p class="card-text font-weight-bold text-success">${trending.postCount}</p>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <g:if test="${Subscription.findByUserAndTopic(session.currentUser,trending.topic)}">
                                                                <p><a href="#" onclick="Unsubscribe(${trending.topic.id},${session.currentUser.id})">Unsubscribe</a></p>
                                                            </g:if>
                                                            <g:else>
                                                                <p><a href="#" onclick="subscribe(${trending.topic.id},${session.currentUser.id})">Subscribe</a></p>
                                                            </g:else>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row border-bottom">
                                                <div class="col-sm-3">
                                                    <div class="dropdown" style="max-width:120px">
                                                        <g:select class="form-select" id="seriousness_${trending.topic.id}" name="seriousness_" value="seriousness" aria-label="Select seriousness"
                                                                  from="${linkshare.SeriousnessEnum.values()}" optionKey="key" onclick="editTopicSeriousness(${trending.topic.id},${session.currentUser.id})" >
                                                        </g:select>
                                                    </div>
                                                </div>
                                                <g:if test="${session.currentUser.id==trending.topic.createdBy.id || session.currentUser.isAdmin==true}">
                                                    <div class="col-sm-3">
                                                        <div class="dropdown" style="max-width:120px">
                                                            <g:select class="form-select" id="trendingTopicVisibility_${trending.topic.id}" name="visibility_${trending.topic.id}" value="${trending.topic.visibility}" aria-label="Select visibility"
                                                                      from="${linkshare.VisibilityEnum.values()}" optionKey="key" onclick="editTrendingTopicVisibility(${trending.topic.id})">
                                                            </g:select>
                                                        </div>
                                                    </div>
                                                </g:if>
                                                <div class="col-sm-1">
                                                    <button type="button" class="btn btn-link chat-icon" data-bs-toggle="modal" data-bs-target="#sendInvitationModal" >
                                                        <g:img dir="images" file="sendInvitation.svg" width="30" height="30"/>
                                                    </button>
                                                </div>
                                                <g:if test="${session.currentUser.id==trending.topic.createdBy.id || session.currentUser.isAdmin==true}">
                                                    <div class="col-sm-1">
                                                        <button type="button"  id="editTrendingTopic_${trending.topic.id}" class="btn btn-link chat-icon" onclick="editTrendingTopicName(${trending.topic.id})">
                                                            <g:img dir="images" file="edit.svg" width="30" height="30"/>
                                                        </button>
                                                    </div>

                                                    <div class="col-sm-1">
                                                        <button type="button" class="btn btn-link chat-icon" id="deleteTrendingTopic_${trending.topic.id}" onclick="deleteTrendingTopic(${trending.topic.id})">
                                                            <g:img dir="images" file="delete.svg" width="30" height="30"/>
                                                        </button>
                                                    </div>
                                                </g:if>
                                            </div>
                                        </div>
                                    </g:each>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--   User Inbox -->

            <div class="col-sm-6 mt-4">
                <div class="card border-2">
                    <div class="card-header border-2">
                        <h2>Inbox</h2>
                    </div>
                    <div class="card-body" style="background-color: rgba(69, 68, 70, 0.144);">
                        <g:each in="${userUnReadResource}" var="resource">
                            <div class="row mt-2" id="resource_${resource.id}">
                                <div class="col-sm-2">
                                    <a href="/User/userProfile?user=${resource.createdBy.id}"><g:img dir="images" file="${resource.createdBy.photo}"  width="80" height="80"/></a>
                                </div>
                                <div class="col-sm-10">
                                    <h5>${resource.description}</h5>
                                    <div class="row mt-4">
                                        <div class="col-sm-2">
                                        </div>
                                        <div class="col-sm-10 offset-4">
                                            <g:if test="${resource.instanceOf(linkshare.LinkResource)}"><a href="${resource.url}" style="font-size: small; margin-left:2ch">View Full Site</a></g:if>
                                            <g:else><a href="${resource.filePath}" style="font-size:small" dowload>Download</a></g:else>
                                            <a href="#" onclick="markAsRead(${resource.id})" style="font-size: small; margin-left:2ch">Mark As Read</a>
                                            <a href="/ShowPost/index?resourceId=${resource.id}" style="font-size: small; margin-left:2ch">View Post</a>
                                        </div>
                                    </div>
                                </div>
                                <span class="border border-secondary mt-1"></span>
                            </div>
                        </g:each>
                    </div>
                </div>
            </div>
        </div>
</div>

</body>
</html>