<%@ page import="linkshare.DocumentResource; javax.print.Doc; linkshare.SeriousnessEnum; linkshare.VisibilityEnum; linkshare.Subscription; linkshare.Resource; linkshare.LinkResource;linkshare.DocumentResource" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <asset:javascript src="dashboard.js"></asset:javascript>
</head>
<body class="bg-secondary">
<g:render template="navbar" />

<!-- Main Body -->
<div class="container-fluid">
    <div class="row d-flex justify-content-center bg-secondary"  >
        <div class="col-sm-6" height="100vh">
            <!-- User details card -->
            <div class="row">
                <div class="card mt-4" style="border-radius: 25px;">
                    <div class="card-body" >
                        <div class="card " >
                            <div class="row">
                                <div class="col-sm-2 mt-4">
                                    <g:if test="${session.currentUser}">
                                        <a href="#"><g:img dir="images" id="profilePhoto"  file="${thisUser.photo}" width="80" height="80"/></a>
                                    </g:if>
                                </div>
                                <div class="col-sm-6">
                                    <div class="card-body"></div>
                                    <h5 class="card-title">${thisUser.firstName +" "+ thisUser.lastName}</h5>
                                    <p class="card-text text-muted">@${thisUser.userName}</p>
                                    <div class="row">
                                        <div class="col-sm-5">
                                            <a href="#">Subscriptions:</a>
                                        </div>
                                        <div class="col">
                                            <p class="card-text font-weight-bold">${userDetails["subscriptionCount"]}</p>
                                        </div>
                                        <div class="col-sm-4">
                                           <p><a href="#">Topics: </a></p>
                                        </div>
                                        <div class="col">
                                            <p class="card-text font-weight-bold">${userDetails["topicCount"]}</p>
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
                                    <div class="row mt-3">
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
                                            <p><span><a href="/User/userProfile?user=${subsData.createdBy.id}">@${subsData.createdBy.userName}</a></span></p>
                                            <div class="row">
                                                <div class="col">
                                                    <p class="card-text"><a href="#">Subscriptions:</a></p>
                                                </div>
                                                <div class="col">
                                                    <p class="card-text font-weight-bold">${subsData.topicCount}</p>
                                                </div>
                                                <div class="col">
                                                    <p class="card-text"><a href="#">Post:</a></p>
                                                </div>
                                                <div class="col">
                                                    <p class="card-text font-weight-bold">${subsData.topicResourceCount}</p>
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
                                            <button type="button" class="btn btn-link chat-icon" onclick="">
                                                <g:img dir="images" file="sendInvitation.svg" width="30" height="30"/>
                                            </button>
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

%{-- User Topic--}%
            <div class="row mt-3">
                <div class="card" style="border-radius: 25px;">
                    <div class="card-header">
                        <b>Topics</b>
                    </div>
                    <div class="card-body">
                        <div class="scrollable-container" style="overflow-y:scroll; max-height:270px">
                            <div class="row">
                                <g:each in="${userTopicDetails}" var="topicData">
                                    <div class="row" id="topic_${topicData.topic.id}">
                                        <div class="row mt-3">
                                            <div class="col-sm-2 mt-3">
                                                <a href="/User/userProfile?user=${topicData.createdBy.id}"><g:img dir="images" file="${topicData.createdBy.photo}"  width="80" height="80"/></a>
                                            </div>
                                            <div class="col-md-8">
                                                <h5><a href="/TopicShow/index?topicId=${topicData.topic.id}" class="topicName" id="userTopicName_${topicData.topic.id}">${topicData.topic.name}</a></h5>
                                                <div class="edit-form" id="editUserTopicClass_${topicData.topic.id}" style="display:none;">
                                                    <form>
                                                        <input type="text" name="newTopicName">
                                                        <button type="button" onclick="saveUserTopic('${topicData.topic.id}')" class="save-button" id="saveUserTopic_${topicData.topic.id}">Save</button>
                                                        <button type="button" onclick="cancelUserTopic('${topicData.topic.id}')" class="cancel-button"id="cancelUserTopic_${topicData.topic.id}">Cancel</button>
                                                    </form>
                                                </div>
                                                <p><span><a href="/User/userProfile?user=${topicData.createdBy.id}">@${topicData.createdBy.userName}</a></span></p>
                                                <div class="row">
                                                    <div class="col">
                                                        <p class="card-text"><a href="#">Subscriptions:</a></p>
                                                    </div>
                                                    <div class="col">
                                                        <p class="card-text font-weight-bold">${topicData.subscriptionCount}</p>
                                                    </div>
                                                    <div class="col">
                                                        <p class="card-text"><a href="#">Post:</a></p>
                                                    </div>
                                                    <div class="col">
                                                        <p class="card-text font-weight-bold">${topicData.resourceCount}</p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col">
                                                        <g:if test="${Subscription.findByUserAndTopic(session.currentUser,topicData.topic)}">
                                                            <p><a href="#" onclick="Unsubscribe(${topicData.topic.id},${session.currentUser.id})">Unsubscribe</a></p>
                                                        </g:if>
                                                        <g:else>
                                                            <p><a href="#" onclick="subscribe(${topicData.topic.id},${session.currentUser.id})">Subscribe</a></p>
                                                        </g:else>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row border-bottom">
                                            <div class="col-sm-3">
                                                <div class="dropdown" style="max-width:120px">

                                                    <g:select class="form-select" id="userTopicSeriousness_${topicData.subscription.id}" name="seriousness_${topicData.subscription.id}" value="${topicData.subscription.seriousness}" aria-label="Select seriousness"
                                                              from="${linkshare.SeriousnessEnum.values()}" optionKey="key" onclick="editUserTopicSeriousness('${topicData.subscription.id}')">
                                                    </g:select>

                                                </div>
                                            </div>
                                            <g:if test="${session.currentUser.id==topicData.createdBy.id || session.currentUser.isAdmin==true}">
                                                <div class="col-sm-3">
                                                    <div class="dropdown" style="max-width:120px">
                                                        <g:select class="form-select" id="userTopicVisibility_${topicData.topic.id}" name="visibility_${topicData.topic.id}" value="${topicData.topic.visibility}" aria-label="Select visibility"
                                                                  from="${linkshare.VisibilityEnum.values()}" optionKey="key" onclick="editUserTopicVisibility(${topicData.topic.id})">
                                                        </g:select>
                                                    </div>
                                                </div>
                                            </g:if>
                                            <div class="col-sm-1">
                                                <button type="button" class="btn btn-link chat-icon" >
                                                    <g:img dir="images" file="sendInvitation.svg" width="30" height="30"/>
                                                </button>
                                            </div>
                                            <g:if test="${session.currentUser.id==topicData.createdBy.id || session.currentUser.isAdmin==true}">
                                                <div class="col-sm-1">
                                                    <button type="button"  id="editUserTopic_${topicData.topic.id}" class="btn btn-link chat-icon" onclick="editUserTopicName(${topicData.topic.id})">
                                                        <g:img dir="images" file="edit.svg" width="30" height="30"/>
                                                    </button>
                                                </div>

                                                <div class="col-sm-1">
                                                    <button type="button" class="btn btn-link chat-icon" id="deleteUserTopic_${topicData.topic.id}" onclick="deleteUserTopic(${topicData.topic.id})">
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
        <!-- User Posts -->
        <div class="col-sm-6 mt-4">
            <div class="card border-2">
                <div class="card-header border-2">
                    <h2>Posts</h2>
                </div>
                <div class="card-body" style="background-color: rgba(69, 68, 70, 0.144);">
                    <g:each in="${userPost}" var="post">
                        <div class="row mt-0">
                            <a href="/TopicShow/index?topicId=${post.topic.id}">${post.topic.name}</a>
                        </div>
                        <div class="row border mt-3">
                            <p>${post.description}</p>
                        </div>
                        <div class="row">
                            <div class="col-sm-5">

                            </div>
                            <div class="col-sm-10 offset-5">
                                <g:if test="${post.instanceOf(linkshare.LinkResource)}"><a href="${post.url}" style="font-size: small; margin-left:2ch">View Full Site</a></g:if>
                                <g:else><a href="${post.filePath}" style="font-size:small">Download</a></g:else>
                                <a href="#" style="font-size: small; margin-left:2ch">Mark As Read</a>
                                <a href="/ShowPost/index?resourceId=${post.id}" style="font-size: small; margin-left:2ch">View Post</a>
                            </div>
                            <span class="border border-secondary"></span>
                        </div>
                    </g:each>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
</body>
</html>