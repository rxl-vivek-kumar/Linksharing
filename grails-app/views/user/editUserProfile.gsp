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
<g:render template="/user/navbar" />

<div class="container-fluid">
    <div class="row d-flex justify-content-center">
        <div class="col-sm-6" height="100vh">
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
%{--User Topics--}%
            <div class="row mt-3">
                <div class="card" style="border-radius: 25px;">
                    <div class="card-header">
                        <b>Topics</b>
                        <a href="#" class="" style="float: right;">View all</a>
                    </div>
                    <div class="card-body">
                        <div class="scrollable-container" style="overflow-y:scroll; max-height:270px">
                            <g:each in="${userTopicDetails}" var="topicData">
                                <div class="row mt-3">
                                    <div class="col-sm-2 mt-3">
                                        <a href="/User/userProfile?user=${topicData.createdBy.id}"><g:img dir="images" file="${topicData.createdBy.photo}"  width="80" height="80"/></a>
                                    </div>
                                    <div class="col-md-8">
                                        <h5><a href="/TopicShow/index?topicId=${topicData.topic.id}" class="topicName" id="topicName_${topicData.topic.id}">${topicData.topic.name}</a></h5>
                                        <div class="edit-form" id="editTopicClass_${topicData.topic.id}" style="display:none;">
                                            <form>
                                                <input type="text" name="newTopicName">
                                                <button type="button" onclick="saveTopic('${topicData.topic.id}')" class="save-button" id="saveTopic_${topicData.topic.id}">Save</button>
                                                <button type="button" onclick="cancelTopic('${topicData.topic.id}')" class="cancel-button"id="cancelTopic_${topicData.topic.id}">Cancel</button>
                                            </form>
                                        </div>
                                        <p><a href="/User/userProfile?user=${topicData.createdBy.id}"><span>@${topicData.createdBy.userName}</span></a></p>
                                        <div class="row">
                                            <div class="col">
                                                <p class="card-text">Subscriptions:</p>
                                            </div>
                                            <div class="col">
                                                <p class="card-text font-weight-bold text-primary">${topicData.subscriptionCount}</p>
                                            </div>
                                            <div class="col">
                                                <p class="card-text">Post:</p>
                                            </div>
                                            <div class="col">
                                                <p class="card-text font-weight-bold text-success">${topicData.resourceCount}</p>
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
                                            <g:select class="form-select" id="seriousness_${topicData.topic.id}" name="seriousness_${topicData.topic.id}" value="${topicData.subscription.seriousness}" aria-label="Select seriousness"
                                                      from="${linkshare.SeriousnessEnum.values()}" optionKey="key" onclick="editTopicSeriousness(${topicData.topic.id},${session.currentUser.id})">
                                            </g:select>
                                        </div>
                                    </div>
                                    <g:if test="${session.currentUser.id==topicData.topic.createdBy.id || session.currentUser.isAdmin==true}">
                                        <div class="col-sm-3">
                                            <div class="dropdown" style="max-width:120px">
                                                <g:select class="form-select" id="visibility_${topicData.topic.id}" name="visibility_${topicData.topic.id}" value="${topicData.topic.visibility}" aria-label="Select visibility"
                                                          from="${linkshare.VisibilityEnum.values()}" optionKey="key" onclick="editVisibility('${topicData.topic.id}')">
                                                </g:select>
                                            </div>
                                        </div>
                                    </g:if>
                                    <div class="col-sm-1">
                                        <button type="button" class="btn btn-link chat-icon" onclick="">
                                            <g:img dir="images" file="sendInvitation.svg" width="30" height="30"/>
                                        </button>
                                    </div>
                                    <g:if test="${session.currentUser.id==topicData.topic.createdBy.id || session.currentUser.isAdmin==true}">
                                        <div class="col-sm-1">
                                            <button type="button"  id="editTopic_${topicData.topic.id}" class="btn btn-link chat-icon" onclick="editTopicName('${topicData.topic.id}')">
                                                <g:img dir="images" file="edit.svg" width="30" height="30"/>
                                            </button>
                                        </div>

                                        <div class="col-sm-1">
                                            <button type="button" class="btn btn-link chat-icon" id="deleteTopic_${topicData.topic.id}" onclick="deleteTopic('${topicData.topic.id}')">
                                                <g:img dir="images" file="delete.svg" width="30" height="30"/>
                                            </button>
                                        </div>
                                    </g:if>
                                </div>
                            </g:each>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6" height="100vh">
            <div class="card mt-3 " >
                <div class="card-header border-2">
                    <h5>Profile</h5>
                </div>
                <div class="card-body border-2" style="background-color: rgba(69, 68, 70, 0.144);">
                    <g:uploadForm controller="User" action="updateUserProfile">
                        <div class="row mb-3">
                            <div class="col-sm-4">First Name*</div>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="firstName" id="firstName" aria-label="First name" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-4">Last Name*</div>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="lastName" id="lastName" aria-label="Last name" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-4">Username*</div>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="userName" id="userName" aria-label="userName" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-4">Photo</div>
                            <div class="col-sm-7">
                                <input type="file" id="userPhoto" name="userPhoto" accept="gif|jpeg|bmp|png|jpg" />
                            </div>
                            <div id="errorMessage" style="display: none; color: red;"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-5 offset-7">
                                <button type="submit" class="btn btn-primary" name="updateUserProfile" id="updateUserProfile">Update</button>
                            </div>
                        </div>
                    </g:uploadForm>
                </div>
            </div>
            <div class="card mt-3 " >
                <div class="card-header border-2">
                    <h5>Change Password</h5>
                </div>
                <div class="card-body border-2" style="background-color: rgba(69, 68, 70, 0.144);">
                    <g:uploadForm controller="User" action="changeUserPassword">
                        <div class="row mb-3">
                            <div class="col-sm-4">New Password*</div>
                            <div class="col-sm-7">
                                <input type="password" class="form-control" name="newPassword" id="newPassword">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-4">Confirm Password*</div>
                            <div class="col-sm-7">
                                <input type="password" class="form-control" name="confirmPassword" id="confirmPassword">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-5 offset-7">
                                <button type="submit" class="btn btn-primary" name="changePassword" id="changePassword">Update</button>
                            </div>
                        </div>
                    </g:uploadForm>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    document.getElementById('updateUserProfile').addEventListener('click', function(event) {
        var fileInput = document.getElementById('userPhoto');
        var maxFileSize = 128* 1024;

        if (fileInput.files.length > 0) {
            var file = fileInput.files[0];

            if (file.size > maxFileSize) {
                displayErrorMessage("Error: The file size exceeds the maximum allowed size of 128KB.");
                event.preventDefault(); // Prevent form submission
                return;
            }

            var allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];
            if (!allowedTypes.includes(file.type)) {
                displayErrorMessage("Error: Please choose an image file (JPEG, PNG, GIF).");
                event.preventDefault(); // Prevent form submission
            }
        }
    });

    function displayErrorMessage(message) {
        var errorMessage = document.getElementById('errorMessage');
        errorMessage.textContent = message;
        errorMessage.style.display = 'block';
    }

    document.getElementById('userPhoto').addEventListener('change', function(event) {
        var errorMessage = document.getElementById('errorMessage');
        errorMessage.style.display = 'none';
    });
</script>
</body>
</html>