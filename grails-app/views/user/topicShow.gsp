<%@ page import="linkshare.DocumentResource; javax.print.Doc; linkshare.SeriousnessEnum; linkshare.VisibilityEnum; linkshare.Subscription; linkshare.Resource;linkshare.ReadingItem; linkshare.LinkResource;linkshare.DocumentResource" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Topic</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <asset:javascript src="dashboard.js"></asset:javascript>

</head>
<body class="bg-secondary">
<g:render template="/user/navbar" />
<!-- Main Body -->
<div class="container-fluid  "  >
    <div class="row d-flex justify-content-center bg-secondary"  >
        <div class="col-sm-6" height="100vh">
            <!-- Topic details card -->
            <div class="row">
                <div class="card mt-4" style="border-radius: 25px;">
                    <div class="card-header border-2">
                        <div class="row">
                            <div class="col-sm-3">
                                <h5>Topic: </h5>
                            </div>
                            <div class="col-sm-8" style="margin-left: -8ch">
                                <a href="/TopicShow/index?topicId=${topicDetails.topic.id}">${topicDetails.topic.name}</a>
                            </div>
                        </div>
                    </div>
                    <div class="card-body" >
                        <div class="card " >
                            <div class="row">
                                <div class="col-sm-2 mt-4">
                                    <g:if test="${session.currentUser}">
                                        <a href="/User/userProfile?user=${topicDetails.topic.createdBy.id}"><g:img dir="images" id="profilePhoto"  file="${topicDetails.topic.createdBy.photo}" width="80" height="80"/></a>
                                    </g:if>
                                    <g:else>
                                        <g:img dir="images" id="profilePhoto"  file="${topicDetails.topic.createdBy.photo}" width="80" height="80"/>
                                    </g:else>
                                </div>
                                <div class="col-sm-8">
                                    <h5 class="card-title">${topicDetails.topic.name}</h5>
                                    <p class="card-text text-muted">
                                        <a href="/User/userProfile?user=${topicDetails.topic.createdBy.id}">@${topicDetails.topic.createdBy.userName}</a>
                                    </p>
                                    <div class="row">
                                        <div class="col-sm-5">
                                            <a href="#">Subscriptions:</a>
                                        </div>
                                        <div class="col-sm-2">
                                            <p class="card-text font-weight-bold">${topicDetails.subscriptionCount}</p>
                                        </div>
                                        <div class="col-sm-3">
                                            <p><a href="#">Post: </a></p>
                                        </div>
                                        <div class="col-sm-1">
                                            <p class="card-text font-weight-bold">${topicDetails.postCount}</p>
                                        </div>
                                    </div>
                                    <g:if test="${session.currentUser}">
                                        <div class="row">
                                            <div class="col">
                                                <g:if test="${Subscription.findByUserAndTopic(session.currentUser,topicDetails.topic)}">
                                                    <p><a href="#" onclick="Unsubscribe(${topicDetails.topic.id},${session.currentUser.id})">Unsubscribe</a></p>
                                                </g:if>
                                                <g:else>
                                                    <p><a href="#" onclick="subscribe(${topicDetails.topic.id},${session.currentUser.id})">Subscribe</a></p>
                                                </g:else>
                                            </div>
                                        </div>
                                    </g:if>
                                </div>
                                <g:if test="${session.currentUser}">
                                    <div class="row border-bottom">
                                        <div class="col-sm-3 offset-1">
                                            <div class="dropdown" style="max-width:120px">
                                                <g:select class="form-select" id="seriousness_${topicDetails.topic.id}" name="seriousness_${topicDetails.topic.id}" value="" aria-label="Select seriousness"
                                                          from="${linkshare.SeriousnessEnum.values()}" optionKey="key" onclick="">
                                                </g:select>
                                            </div>
                                        </div>
                                        <div class="col-sm-3 offset-1">
                                            <div class="col-sm-1">
                                                <button type="button" class="btn btn-link chat-icon" data-bs-toggle="modal" data-bs-target="#sendInvitationModal_${topicDetails.topic.id}">
                                                    <g:img dir="images" file="sendInvitation.svg" width="30" height="30"/>
                                                </button>
                                                <g:render template="/user/sendInvitationModal" model="[subsData:topicDetails]"></g:render>
                                            </div>
                                        </div>
                                    </div>
                                </g:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            %{--user list--}%
            <div class="row mt-3">
                <div class="card" style="border-radius: 25px;">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-sm-3">
                                <h5>Users: </h5>
                            </div>
                            <div class="col-sm-8" style="margin-left: -8ch">
                                <g:if test="${session.currentUser}"><a href="/TopicShow/index?topicId=${topicDetails.topic.id}">${topicDetails.topic.name}</a></g:if>
                                <g:else>${topicDetails.topic.name}</g:else>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="scrollable-container" style="overflow-y:scroll; max-height:270px">
                            <g:each in="${topicUser}" var="topic">
                                <div class="row mt-3">
                                    <div class="col-sm-2 mt-3">
                                        <g:if test="${session.currentUser}"><a href="/User/userProfile?user=${topic.user.id}"><g:img dir="images" file="${topic.user.photo}"  width="80" height="80"/></a></g:if>
                                        <g:else><g:img dir="images" file="${topic.user.photo}"  width="80" height="80"/></g:else>
                                    </div>
                                    <div class="col-md-8">
                                        <h5>${"${topic.user.firstName}"+"."+"${topic.user.lastName}"}</h5>
                                        <p><g:if test="${session.currentUser}"><a href="/User/userProfile?user=${topic.user.id}"><span>@${topic.user.userName}</span></a></g:if>
                                            <g:else><span>@${topic.user.userName}</span></g:else>
                                        </p>
                                        <div class="row">
                                            <div class="col">
                                                <p class="card-text"><a href="#">Subscriptions:</a></p>
                                            </div>
                                            <div class="col">
                                                <p class="card-text font-weight-bold">${topic.subscriptionCount}</p>
                                            </div>
                                            <div class="col">
                                                <p class="card-text"><a href="#">Topics:</a></p>
                                            </div>
                                            <div class="col">
                                                <p class="card-text font-weight-bold">${topic.topicCount}</p>
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
        <!-- topic Posts -->
        <div class="col-sm-6 mt-4">
            <div class="card border-1">
                <div class="card-header border-1">
                    <div class="row">
                        <div class="col-sm-2 mt-2">
                            <h6>Posts: </h6>
                        </div>
                        <div class="col-sm-7 mt-2" style="margin-left: -5ch">
                            <g:if test="${session.currentUser}"><a href="/TopicShow/index?topicId=${topicDetails.topic.id}">${topicDetails.topic.name}</a></g:if>
                            <g:else>${topicDetails.topic.name}</g:else>
                        </div>
                        <div class="col-sm-3">
                            <div class="input-group rounded">
                                <input type="search" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" />
                                <span class="input-group-text border-0" id="search-addon">
                                    <i class="fas fa-search"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body" style="background-color: rgba(69, 68, 70, 0.144);">
                    <div class="scrollable-container" style="overflow-y:scroll; max-height:270px">
                        <g:each in="${topicPost}" var="topic">
                            <div class="row mt-2">
                                <div class="col-sm-2">
                                    <g:if test="${session.currentUser}"><a href="/User/userProfile?user=${topic.createdBy.id}"><g:img dir="images" file="${topic.createdBy.photo}"  width="80" height="80"/></a></g:if>
                                    <g:else><g:img dir="images" file="${topic.createdBy.photo}"  width="80" height="80"/></g:else>
                                </div>
                                <div class="col-sm-10">
                                    <h5>${topic.description}</h5>
                                    <g:if test="${session.currentUser}">
                                        <div class="row mt-4">
                                             <div class="col-sm-2"></div>
                                             <div class="col-sm-10 offset-3">
                                                <g:if test="${topic.instanceOf(linkshare.LinkResource)}"><a href="${topic.url}" style="font-size: small; margin-left:2ch">View Full Site</a></g:if>
                                                <g:else><a href="${topic.filePath}" style="font-size:small">Download</a></g:else>
                                                 <a href="#" onclick="markAsRead(${topic.id})" style="font-size: small; margin-left:2ch">Mark As Read</a>
                                                <a href="/ShowPost/index?resourceId=${topic.id}" style="font-size: small; margin-left:2ch">View Post</a>
                                            </div>
                                        </div>
                                    </g:if>
                                </div>
                                <span class="border border-secondary mt-1"></span>
                            </div>
                        </g:each>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>