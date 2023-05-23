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
    <asset:javascript src="inputValidation.js"></asset:javascript>

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
                                            <p>Subscriptions:</p>
                                        </div>
                                        <div class="col">
                                            <p class="card-text font-weight-bold">${userDetails["subscriptionCount"]}</p>
                                        </div>
                                        <div class="col-sm-4">
                                            <p>Topics: </p>
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
                        <button type="button" class="btn btn-link chat-icon mt-2 offset-8" data-bs-toggle="modal"
                                data-bs-target="#userTopicListModal">
                            <a href="#" style="float: right;">View all</a>
                        </button>
                        <!-- Modal -->
                        <div class="modal fade" id="userTopicListModal" tabindex="-1"
                             aria-labelledby="userTopicListModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <!-- modal Header -->
                                    <div class="modal-header" >
                                        <h5 class="modal-title" id="userTopicListModalLabel">Topic List</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close">
                                        </button>
                                    </div>
                                    <!-- Modal Body -->
                                    <div class="modal-body">
                                        <div class="scrollable-container" style="overflow-y:scroll; max-height:270px">
                                            <g:each in="${userTopicDetails}" var="topicData">
                                                <div class="row" id="userTopic_${topicData.topic.id}">
                                                    <div class="row mt-3">
                                                        <div class="col-sm-2 mt-3">
                                                            <a href="/User/userProfile?user=${topicData.createdBy.id}"><g:img dir="images" file="${topicData.createdBy.photo}"  width="80" height="80"/></a>
                                                        </div>
                                                        <div class="col-md-8 offset-1 mt-3">
                                                            <h6><a href="/TopicShow/index?topicId=${topicData.topic.id}" class="topicName" id="listTopicName_${topicData.topic.id}">${topicData.topic.name}</a></h6>
                                                            <p><a href="/User/userProfile?user=${topicData.createdBy.id}"><span>@${topicData.createdBy.userName}</span></a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </g:each>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
                <g:if test="${flash.update}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">${flash.update}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="close"></button>
                    </div>
                </g:if>
                <div class="card-body border-2" style="background-color: rgba(69, 68, 70, 0.144);">
                    <g:uploadForm controller="User" action="updateUserProfile">
                        <div class="row mb-3">
                            <div class="col-sm-4">First Name*</div>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="firstName" id="firstName" aria-label="First name" onclick="textLimit('firstName')">
                            </div>
                        </div><div id="firstNameErrorMessage" style="display: none; color: red;"></div>
                        <div class="row mb-3">
                            <div class="col-sm-4">Last Name*</div>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="lastName" id="lastName" aria-label="Last name" onclick="textLimit('lastName')">
                            </div>
                        </div><div id="lastNameErrorMessage" style="display: none; color: red;"></div>
                        <div class="row mb-3">
                            <div class="col-sm-4">Username*</div>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="userName" id="userName" aria-label="userName" onclick="textLimit('userName')">
                            </div>
                        </div><div id="userNameErrorMessage" style="display: none; color: red;"></div>
                        <div class="row mb-3">
                            <div class="col-sm-4">Photo</div>
                            <div class="col-sm-7">
                                <input type="file" name="photo" id="userPhoto"/>
                            </div>
                            <div id="photoUpdateErrorMessage" style="display: none; color: red;"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-5 offset-7">
                                <button type="submit" class="btn btn-primary" name="updateUserProfile" id="updateUserProfile" onclick="imageValidation('updateUserProfile','userPhoto')">Update</button>
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
                                <input type="password" class="form-control" name="newPassword" id="newPassword" onclick="textLimit('newPassword')" required>
                            </div>
                        </div><div id="newPasswordErrorMessage" style="display: none; color: red;"></div>
                        <div class="row mb-3">
                            <div class="col-sm-4">Confirm Password*</div>
                            <div class="col-sm-7">
                                <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" onclick="textLimit('confirmPassword')">
                            </div>
                        </div><div id="confirmPasswordErrorMessage" style="display: none; color: red;"></div>
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
        var maxFileSize = 128 * 1024;

        if (fileInput.files.length > 0) {
            var file = fileInput.files[0];

            if (file.size > maxFileSize) {
                displayErrorMessage("Error: The file size exceeds the maximum allowed size of 128KB.");
                event.preventDefault();
                return;
            }

            var allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];
            if (!allowedTypes.includes(file.type)) {
                displayErrorMessage("Error: Please choose an image file (JPEG, PNG, GIF).");
                event.preventDefault();
            }
        }
    });

    function displayErrorMessage(message) {
        var photoUpdateErrorMessage = document.getElementById('photoUpdateErrorMessage');
        photoUpdateErrorMessage.textContent = message;
        photoUpdateErrorMessage.style.display = 'block';
    }

    document.getElementById('userPhoto').addEventListener('change', function(event) {
        var photoUpdateErrorMessage = document.getElementById('photoUpdateErrorMessage');
        photoUpdateErrorMessage.style.display = 'none';
    });
</script>
</body>
</html>