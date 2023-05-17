function forgotPassword(){

    const email = document.getElementById("forgotPasswordEmail").value;
    const password = document.getElementById("newPassword").value;

    $.ajax({
        type: "POST",
        url: "/forgotPassword/resetPassword",
        data: { email, password },
        success: function(response) {
            if (response.success) {
                alert("Password updated successfully!");
            } else {
                alert("There was an error updating your password.");
            }
        },
        error: function(xhr, status, error) {
            alert("There was an error updating your password.");
            console.error(xhr.responseText);
        }
    });
}

// SUBSCRIBED TOPIC SECTION
function editTopicName(topicId) {
    $(document).ready(function () {
        $('#topicName_' + topicId).hide();
        $('#editTopicClass_' + topicId).show();
    });
}
function cancelTopic(topicId) {
    $(document).ready(function () {
        $('#topicName_' + topicId).show();
        $('#editTopicClass_' + topicId).hide();
    });
}
function saveTopic(topicId) {
    $(document).ready(function () {
        var newTopicName = $('input[name="newTopicName"]').val();

        $.ajax({
            url: '/editSubscribedTopic/index',
            type: 'POST',
            data: {id: topicId, name: newTopicName},
            success: function (response) {
                $('#topicName_' + topicId).text(newTopicName);
                $('#topicName_' + topicId).show();
                $('#editTopicClass_' + topicId).hide();
                window.location.reload()
            },
            error: function (error) {
                console.log(error);
            }
        });
    });
}
function deleteTopic(topicId){
    $(document).ready(function(){
        $.ajax({
            url: '/editSubscribedTopic/deleteTopic',
            type: 'POST',
            data: {topicId:topicId},
            success: function(response) {
                $('#topic_'+topicId).remove()
            },
            error: function(error) {
                console.log(error);
            }

        });
    });
}
function editVisibility(topicId){
    $(document).ready(function(){
        var visibility=document.getElementById("visibility_"+topicId).value;
        $.ajax({
            url:'/editSubscribedTopic/editVisibility',
            type: 'POST',
            data: {visibility,topicId},
            success: function(response) {
                $('#visibility_'+topicId).attr('value',`${visibility}`);
                window.location.reload()
            },
            error: function(error) {
                console.log(error);
            }
        })
    });
}

function editSeriousness(subscriptionId){
    $(document).ready(function(){
        var seriousness=document.getElementById("seriousness_"+subscriptionId).value;
        console.log(seriousness);
        $.ajax({
            url:'/editSubscribedTopic/editSeriousness',
            type: 'POST',
            data: {seriousness,subscriptionId},
            success: function(response) {
                $('#seriousness_'+subscriptionId).attr('value',`${seriousness}`)
            },
            error: function(error) {
                console.log(error);
            }
        });
    });
}
function editTopicSeriousness(topicId,userId){
    $(document).ready(function(){
        var seriousness=document.getElementById("seriousness_"+topicId).value;
        console.log(seriousness);
        $.ajax({
            url:'/editSubscribedTopic/editTopicSeriousness',
            type: 'POST',
            data: {seriousness,topicId,userId},
            success: function(response) {
                $('#seriousness_'+topicId).attr('value',`${seriousness}`)
            },
            error: function(error) {
                console.log(error);
            }
        });
    });
}


// TRENDING TOPIC SECTION
function editTrendingTopicName(topicId) {
    $(document).ready(function () {
        $('#trendingTopicName_' + topicId).hide();
        $('#editTrendingTopicClass_' + topicId).show();
    });
}
function cancelTrendingTopic(topicId) {
    $(document).ready(function () {
        $('#trendingTopicName_' + topicId).show();
        $('#editTrendingTopicClass_' + topicId).hide();
    });
}
function saveTrendingTopic(topicId) {
    $(document).ready(function () {
        var newTopicName = $('input[name="newTopicName"]').val();

        $.ajax({
            url: '/editSubscribedTopic/index',
            type: 'POST',
            data: {id: topicId, name: newTopicName},
            success: function (response) {
                $('#trendingTopicName_' + topicId).text(newTopicName);
                $('#trendingTopicName_' + topicId).show();
                $('#editTrendingTopicClass_' + topicId).hide();
            },
            error: function (error) {
                console.log(error);
            }
        });
    });
}
function deleteTrendingTopic(topicId){
    $(document).ready(function(){
        $.ajax({
            url: '/editSubscribedTopic/deleteTopic',
            type: 'POST',
            data: {topicId:topicId},
            success: function(response) {
                $('#trendingTopic_'+topicId).remove()
            },
            error: function(error) {
                console.log(error);
            }

        });
    });
}

function editTrendingTopicVisibility(topicId){
    $(document).ready(function(){
        var visibility=document.getElementById("trendingTopicVisibility_"+topicId).value;
        $.ajax({
            url:'/editSubscribedTopic/editVisibility',
            type: 'POST',
            data: {visibility,topicId},
            success: function(response) {
                $('#trendingTopicVisibility_'+topicId).attr('value',`${visibility}`);
                window.location.reload()
            },
            error: function(error) {
                console.log(error);
            }
        })
    });
}

function editTrendingTopicSeriousness(subscriptionId){
    $(document).ready(function(){
        var seriousness=document.getElementById("trendingTopicSeriousness_"+subscriptionId).value;
        console.log(seriousness);
        $.ajax({
            url:'/editSubscribedTopic/editSeriousness',
            type: 'POST',
            data: {seriousness,subscriptionId},
            success: function(response) {
                $('#trendingTopicSeriousness_'+subscriptionId).attr('value',`${seriousness}`)
            },
            error: function(error) {
                console.log(error);
            }
        })
    });
}

//USER TOPICS SECTION IN USER PROFILE PAGE
function editUserTopicName(topicId) {
    $(document).ready(function () {
        $('#userTopicName_' + topicId).hide();
        $('#editUserTopicClass_' + topicId).show();
    });
}
function cancelUserTopic(topicId) {
    $(document).ready(function () {
        $('#userTopicName_' + topicId).show();
        $('#editUserTopicClass_' + topicId).hide();
    });
}
function saveUserTopic(topicId) {
    $(document).ready(function () {
        var newTopicName = $('input[name="newTopicName"]').val();

        $.ajax({
            url: '/editSubscribedTopic/index',
            type: 'POST',
            data: {id: topicId, name: newTopicName},
            success: function (response) {
                $('#userTopicName_' + topicId).text(newTopicName);
                $('#userTopicName_' + topicId).show();
                $('#editUserTopicClass_' + topicId).hide();
            },
            error: function (error) {
                console.log(error);
            }
        });
    });
}
function deleteUserTopic(topicId){
    $(document).ready(function(){
        $.ajax({
            url: '/editSubscribedTopic/deleteTopic',
            type: 'POST',
            data: {topicId:topicId},
            success: function(response) {
                $('#topic_'+topicId).remove();
            },
            error: function(error) {
                console.log(error);
            }

        });
    });
}

function editUserTopicVisibility(topicId){
    $(document).ready(function(){
        var visibility=document.getElementById("userTopicVisibility_"+topicId).value;
        $.ajax({
            url:'/editSubscribedTopic/editVisibility',
            type: 'POST',
            data: {visibility,topicId},
            success: function(response) {
                $('#userTopicVisibility_'+topicId).attr('value',`${visibility}`)
            },
            error: function(error) {
                console.log(error);
            }
        })
    });
}

function editUserTopicSeriousness(subscriptionId){
    $(document).ready(function(){
        var seriousness=document.getElementById("userTopicSeriousness_"+subscriptionId).value;
        $.ajax({
            url:'/editSubscribedTopic/editSeriousness',
            type: 'POST',
            data: {seriousness,subscriptionId},
            success: function(response) {
                $('#userTopicSeriousness_'+subscriptionId).attr('value',`${seriousness}`)
            },
            error: function(error) {
                console.log(error);
            }
        })
    });
}

function markAsRead(resourceId) {
    $(document).ready(function() {
        console.log(resourceId)
        $.ajax({
            url: '/ReadingItem/markAsRead',
            type: 'POST',
            data: {
                resourceId: resourceId
            },
            success: function(response) {
                $('#resource_' + resourceId).remove();
            },
            error: function(error) {
                console.log(error);
            }
        });
    });
}

function Unsubscribe(topicId,userId){
    $(document).ready(function(){
        $.ajax({
            url: '/Subscription/unsubscribeTopic',
            type: 'POST',
            data: {topicId:topicId,userId:userId},
            success: function(response) {
                // $('#topic_'+topicId).remove();
                window.location.reload()
            },
            error: function(error) {
                console.log(error);
            }

        });
    });
}

function subscribe(topicId,userId){
    $(document).ready(function(){
        var seriousness=document.getElementById('seriousness_'+topicId).value
        $.ajax({
            url: '/Subscription/subscribeTopic',
            type: 'POST',
            data: {topicId:topicId,userId:userId,seriousness:seriousness},
            success: function(response) {
                window.location.reload()
            },
            error: function(error) {
                console.log(error);
            }

        });
    });
}

function postRating(resourceId,value){
    $(document).ready(function(){
        $.ajax({
           url: '/ShowPost/postRating',
           type: 'POST',
           data: {resourceId:resourceId,value:value},
            success: function(response) {
                window.location.reload()
            },
            error: function(error) {
                console.log(error);
            }
        });
    });
}



