
function sendOTP() {
    $(document).ready(function () {
        var email = document.getElementById("forgotPasswordEmail").value;

        $.ajax({
            url:'/DashboardAccess/sendOTP',
            type: 'POST',
            data: {email:email},
            success: function(response) {
                if (response.success) {
                    $('#sendOTP').hide();
                    $('#verifyOTP').show();
                    $('#error').hide();
                } else {
                    $('#error').show();
                }
            },
            error: function(xhr, status, error) {
                alert('Email not Registered. Please try again.');
            }
        });
    });
}

function cancelVerification(){
    $(document).ready(function () {
        $('#sendOTP').show();
        $('#verifyOTP').hide();
        $('#resetPassword').hide();
    });
}

function verifyOTP(){
    $(document).ready(function () {
        var otp=$('input[id="otp"]').val();
        $.ajax({
            url:'/DashboardAccess/verifyOTP',
            type:'POST',
            data:{otp:otp},
            success: function(response) {
                if(response.success){
                    $('#verifyOTP').hide();
                    $('#resetPassword').show();
                }else{
                    $('#verificationError').show();
                }
            },
            error: function(xhr, status, error){
                $('#verificationError').show();
            }
        });
    });
}

function resetPassword(){
    $(document).ready(function () {
        var newPassword=$('input[id="newPassword"]').val();
        var email=$('input[id="forgotPasswordEmail"]').val();

        $.ajax({
            url:'/DashboardAccess/resetPassword',
            type: 'POST',
            data:{
                newPassword:newPassword,email:email
            },
            success: function(response) {
                $('#resetPassword').hide();
                $('#sendOTP').show();
                $('#resetPasswordError').hide();
                window.location.reload();
            },
            error: function(xhr, status, error){
                $('#resetPasswordError').show();
            }
        });
    });
}

function sendInvitation(){
    $(document).ready(function(){
        var email=$('input[id="#inviteEmail"]').val()
        var topic=$('input[id="#inviteToTopic"]').val()

        $.ajax({
            url: '/DashboardAccess/sendInvitation',
            type: 'POST',
            data: {
                email: email,
                topic: topic
            },
            success: function(response) {
                alert('Invitation sent successfully!');
                // $('#sendInvitationModal').css('display', 'none');
            },
            error: function(xhr, status, error) {
                alert('Failed to send invitation. Please try again.');
            }
        });
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
        console.log(newTopicName)

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





