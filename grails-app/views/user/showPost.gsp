<%@ page import="linkshare.DocumentResource; javax.print.Doc; linkshare.SeriousnessEnum; linkshare.VisibilityEnum; linkshare.Subscription; linkshare.Resource; linkshare.LinkResource;linkshare.DocumentResource" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <asset:javascript src="dashboard.js"></asset:javascript>
</head>
<style>

.rating {
    display: inline-block;
    direction: rtl;
}

.rating input {
    display: none;
}

.rating label {
    font-size: 30px;
    color: #ddd;
    cursor: pointer;
    display: inline-block;
    transform: scale(-1, 1);
}

.rating label:before {
    content: '\2605';
}

.rating input:checked ~ label {
    color: #ffce00;
}
</style>
<body class="bg-secondary">
<g:render template="/user/navbar"/>
<div class="container-fluid" height="100vh">
    <div class="row" height="100vh">
        <div class="col-sm-6 " height="100vh">
            <div class="card border-2 mt-4" style="border-radius: 25px;">
                <div class="card-body">
                    <g:if test="${flash.message}">
                        <div class="alert alert-success alert-dismissible fade show " role="alert">${flash.message}
                            <button type="button" class="btn-close btn-sm" data-bs-dismiss="alert"
                                    aria-label="Close"></button>
                        </div>
                    </g:if>
                    <g:if test="${flash.error}">
                        <div class="alert alert-danger alert-dismissible fade show " role="alert">${flash.error}
                            <button type="button" class="btn-close btn-sm" data-bs-dismiss="alert"
                                    aria-label="Close"></button>
                        </div>
                    </g:if>
                    <div class="row">
                        <div class="col-sm-2 mt-2">
                            <a href="/User/userProfile?user=${postDetails.resource.createdBy.id}"><g:img dir="images" id="profilePhoto" file="${postDetails.resource.createdBy.photo}"
                                    width="80" height="100"/>
                            </a>
                        </div>
                        <div class="col-sm-4">
                            <div class="row">
                                <a href="/User/userProfile?user=${postDetails.resource.createdBy.id}"><h5
                                        class="card-text">${postDetails.resource.createdBy.firstName + "." + postDetails.resource.createdBy.lastName}</h5>
                                </a>
                            </div>
                            <div class="row">
                                <p class="card-text text-muted">
                                    <a href="/User/userProfile?user=${postDetails.resource.createdBy.id}">@${postDetails.resource.createdBy.userName}</a>
                                </p>
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="row">
                                <p><a href="/TopicShow/index?topicId=${postDetails.resource.topic.id}">${postDetails.resource.topic.name}</a>
                                </p>
                            </div>

                            <div class="row">
                                <p>CreatedOn- ${postDetails.resource.dateCreated}</p>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <h5>Rate</h5>
                                    <div class="card-block d-flex mt-2">

                                        <div hidden="true" id="post_${postDetails.resource.id}" class="resourceRatingdiv">i</div>

                                        <div class="rating" id="${postDetails.resource.id}">
                                            <input type="radio" id="star5" name="rating" value="5" />
                                            <label for="star5" title="5 stars"></label>
                                            <input type="radio" id="star4" name="rating" value="4" />
                                            <label for="star4" title="4 stars"></label>
                                            <input type="radio" id="star3" name="rating" value="3" />
                                            <label for="star3" title="3 stars"></label>
                                            <input type="radio" id="star2" name="rating" value="2" />
                                            <label for="star2" title="2 stars"></label>
                                            <input type="radio" id="star1" name="rating" value="1" />
                                            <label for="star1" title="1 star"></label>
                                        </div>
                                        <p class="userRating mt-2" id="userRating" style="display:none;"></p>
                                        <p class="mt-2 offset-1">${postDetails.userCount}</p><p>_</p>
                                        <p class="mt-2">ratings</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <p>${postDetails.resource.description}</p>
                    </div>
                    <div class="row">
                        <div class="col-sm-3">
                            <p>Social link</p>
                        </div>
                        <div class="col-sm-9">
                            <g:if test="${postDetails.resource.instanceOf(LinkResource)}"><a
                                    href="${postDetails.resource.url}" target="_blank"
                                    style="font-size: small; margin-left:2ch">View Full Site</a></g:if>
                            <g:else><a href="${postDetails.resource.filePath}"
                                       style="font-size:small">Download</a></g:else>
                            <a href="/ShowPost/index?resourceId=${postDetails.resource.id}"
                               style="font-size: small; margin-left:2ch">View Post</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-sm-6" height="100vh">
            <div class="card border-2 mt-4" style="border-radius: 25px;">
                <div class="card-header">
                    <b>Trending topics</b>
                </div>

                <div class="card-body">
                    <div class="container" style="overflow-y:scroll; max-height:550px">
                        <div class="row">
                            <g:each in="${trendingTopic}" var="trending">
                                <div class="row" id="trendingTopic_${trending.topic.id}">
                                    <div class="row mt-3">
                                        <div class="col-sm-2 mt-3">
                                            <a href="/User/userProfile?user=${trending.topic.createdBy.id}"><g:img dir="images" file="${trending.topic.createdBy.photo}" width="80"
                                                    height="80"/></a>
                                        </div>

                                        <div class="col-md-8">
                                            <h5><a href="/TopicShow/index?topicId=${trending.topic.id}" class="topicName"
                                                   id="trendingTopicName_${trending.topic.id}">${trending.topic.name}</a>
                                            </h5>

                                            <div class="edit-form" id="editTrendingTopicClass_${trending.topic.id}" style="display:none;">
                                                <form>
                                                    <input type="text" name="newTopicName">
                                                    <button type="button" onclick="saveTrendingTopic('${trending.topic.id}')" class="save-button" id="saveTrendingTopic_${trending.topic.id}">Save</button>
                                                    <button type="button" onclick="cancelTrendingTopic('${trending.topic.id}')" class="cancel-button" id="cancelTrendingTopic_${trending.topic.id}">Cancel</button>
                                                </form>
                                            </div>

                                            <p><a href="/User/userProfile?user=${trending.topic.createdBy.id}"><span>@${trending.topic.createdBy.userName}</span>
                                            </a></p>

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
                                            <g:if test="${session.currentUser}">
                                                <div class="row">
                                                    <div class="col">
                                                        <g:if test="${Subscription.findByUserAndTopic(session.currentUser, trending.topic)}">
                                                            <p><a href="#" onclick="Unsubscribe(${trending.topic.id}, ${session.currentUser?.id})">Unsubscribe</a>
                                                            </p>
                                                        </g:if>
                                                        <g:else>
                                                            <p><a href="#" onclick="subscribe(${trending.topic.id}, ${session.currentUser?.id})">Subscribe</a>
                                                            </p>
                                                        </g:else>
                                                    </div>
                                                </div>
                                            </g:if>
                                        </div>
                                    </div>
                                    <g:if test="">
                                        <div class="row border-bottom">
                                            <div class="col-sm-3">
                                                <div class="dropdown" style="max-width:120px">
                                                    <g:select class="form-select" id="seriousness_${trending.topic.id}"
                                                              name="seriousness_" value="seriousness"
                                                              aria-label="Select seriousness"
                                                              from="${linkshare.SeriousnessEnum.values()}" optionKey="key"
                                                              onclick="editTopicSeriousness(${trending.topic.id},${session.currentUser.id})">
                                                    </g:select>
                                                </div>
                                            </div>
                                            <g:if test="${session.currentUser.id == trending.topic.createdBy.id || session.currentUser.isAdmin == true}">
                                                <div class="col-sm-3">
                                                    <div class="dropdown" style="max-width:120px">
                                                        <g:select class="form-select"
                                                                  id="trendingTopicVisibility_${trending.topic.id}"
                                                                  name="visibility_${trending.topic.id}" value="visibility"
                                                                  aria-label="Select visibility"
                                                                  from="${linkshare.VisibilityEnum.values()}"
                                                                  optionKey="key"
                                                                  onclick="editTrendingTopicVisibility(${trending.topic.id})">
                                                        </g:select>
                                                    </div>
                                                </div>
                                            </g:if>
                                            <div class="col-sm-1">
                                                <button type="button" class="btn btn-link chat-icon" data-bs-toggle="modal"
                                                        data-bs-target="#sendInvitationModal_${trending.topic.id}">
                                                    <g:img dir="images" file="sendInvitation.svg" width="30" height="30"/>
                                                </button>
                                                <g:render template="/user/sendInvitationModal"
                                                          model="[subsData: trending]"></g:render>
                                            </div>
                                            <g:if test="${session.currentUser.id == trending.topic.createdBy.id || session.currentUser.isAdmin == true}">
                                                <div class="col-sm-1">
                                                    <button type="button" id="editTrendingTopic_${trending.topic.id}"
                                                            class="btn btn-link chat-icon"
                                                            onclick="editTrendingTopicName(${trending.topic.id})">
                                                        <g:img dir="images" file="edit.svg" width="30" height="30"/>
                                                    </button>
                                                </div>

                                                <div class="col-sm-1">
                                                    <button type="button" class="btn btn-link chat-icon"
                                                            id="deleteTrendingTopic_${trending.topic.id}"
                                                            onclick="deleteTrendingTopic(${trending.topic.id})">
                                                        <g:img dir="images" file="delete.svg" width="30" height="30"/>
                                                    </button>
                                                </div>
                                            </g:if>
                                        </div>
                                    </g:if>
                                </div>
                            </g:each>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    const ratingInputs = document.querySelectorAll('input[name="rating"]');
    let selectedRating = null;

    ratingInputs.forEach(input => {
        input.addEventListener('change', () => {
            selectedRating = input.value;
            const ratingDiv = document.querySelector('.rating')
            $.ajax({url: "/ShowPost/postRating?rating="+selectedRating+"&postId="+ratingDiv.id, success: function(result){
                    $('#userRating').text(result.msg)
                    $("#userRating").show();
                }
            });
        });
    });


    document.addEventListener("DOMContentLoaded", function() {

        var setResourceRating = document.querySelector(".resourceRatingdiv")
        var ratingElement = document.querySelector(".rating");


        if(setResourceRating.id=="1"){
            var star1 = ratingElement.querySelector("#star1");
            star1.checked = true
        }
        else if(setResourceRating.id=="2"){
            var star2 = ratingElement.querySelector("#star2");
            star2.checked = true
        }
        else if(setResourceRating.id=="3"){
            var star3 = ratingElement.querySelector("#star3");
            star3.checked = true
        }
        else if(setResourceRating.id=="4"){
            var star4 = ratingElement.querySelector("#star4");
            star4.checked = true
        }
        else if(setResourceRating.id=="5"){
            var star5 = ratingElement.querySelector("#star5");
            star5.checked = true
        }

    });



</script>
</html>