<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <asset:javascript src="dashboard.js"></asset:javascript>
    <asset:javascript src="inputValidation.js"></asset:javascript>
    <style>
    .custom-row {
        height: 100vh;
    }
    </style>
</head>
<body>
<!-- Navigation bar -->
<g:render template="/user/navbar" />
<g:if test="${flash.message}">
    <div class="alert alert-success alert-dismissible fade show " role="alert">${flash.message}
        <button type="button" class="btn-close btn-sm" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</g:if>
<g:if test="${flash.error}">
    <div class="alert alert-danger alert-dismissible fade show " role="alert">${flash.error}
        <button type="button" class="btn-close btn-sm" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</g:if>

<div class="container-fluid">
    <div class="row bg-dark mt-1">

        %{--Left column of page--}%
        <div class="col-md-7">
            %{--Recent Shares--}%
            <div class="card mt-4 border-2">
                <div class="card-header border-2">
                    <h2>Recent Shares</h2>
                </div>
                <div class="card-body bg-light">
                    <div class="scrollable-container" style="overflow-y:scroll; max-height:270px" >
                        <div class="row">
                            <g:each in="${recentShares}" var="resource">
                                <div class="row">
                                    <div class="col-sm-2 mt-2">
                                        <a href="#"><g:img dir="images" file="${resource.createdBy.photo}" width="80" height="80"/></a>
                                    </div>
                                    <div class="col-sm-10 mt-3" >
                                        <div class="row">
                                            <div class="col-sm-3 ml-0">${resource.createdBy.firstName+"."+resource.createdBy.lastName}</div>
                                            <div class="col-sm-3 ml-0">@${resource.createdBy.userName}</div>
                                            <div class="col-sm-6"><a href="/TopicShow/topicShow1?topicId=${resource.topic.id}">${resource.topic.name}</a></div>
                                        </div>
                                        <div class="row">${resource.description}</div>
                                        <div class="row">
                                            <div class="col-sm-9"></div>
                                            <div class="col-sm-3">
                                                <a href="/ShowPost/showPost1?resourceId=${resource.id}" style="font-size: small; margin-left:2ch">View Post</a>
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

            %{--Trending posts card--}%
            <div class="card mt-4 border-2">
                <div class="card-header border-2">
                    <h2>Top Posts</h2>
                </div>
                <div class="card-body">
                    <div class="scrollable-container" style="overflow-y:scroll; max-height:270px">
                        <g:each in="${topPosts}" var="top">
                            <div class="row">
                                <div class="col-sm-2 mt-2">
                                    <a href="#"><g:img dir="images" file="${top.resource.createdBy.photo}" width="80" height="80"/></a>
                                </div>
                                <div class="col-sm-10 mt-3" >
                                    <div class="row">
                                        <div class="col-sm-3 ml-0">${top.resource.createdBy.firstName+"."+top.resource.createdBy.lastName}</div>
                                        <div class="col-sm-3 ml-0">@${top.resource.createdBy.userName}</div>
                                        <div class="col-sm-6"><a href="/TopicShow/topicShow1?topicId=${top.resource.topic.id}">${top.resource.topic.name}</a></div>
                                    </div>
                                    <div class="row">${top.resource.description}</div>
                                    <div class="row">
                                        <div class="col-sm-9"></div>
                                        <div class="col-sm-3">
                                            <a href="/ShowPost/showPost1?resourceId=${top.resource.id}" style="font-size: small; margin-left:2ch">View Post</a>
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

        %{--Right Column of page--}%
        <div class="col-md-5 mt-4">

            %{--User Login Card--}%
            <div class="card border-2" >
                <div class="card-header border-2" >
                    <h2>Login</h2>
                </div>
                <div class="card-body" style="background-color: rgba(69, 68, 70, 0.144);">
                    <g:form controller="Access" action="loginUser">
                        <div class="form-group">
                            <label for="loginEmail">Email/Username:</label>
                            <input type="text" class="form-control" id="loginEmail" name="loginEmail" onclick="textLimit('loginEmail')" required>
                        </div><div id="loginEmailErrorMessage" style="display: none; color: red;"></div>
                        <div class="form-group">
                            <label for="loginPassword">Password:</label>
                            <input type="password" class="form-control" id="loginPassword" name="loginPassword" onclick="textLimit('loginPassword')"required>
                        </div><div id="loginPasswordErrorMessage" style="display: none; color: red;"></div>
                        <div class="form-group mt-2">
                            <a data-bs-toggle="modal" data-bs-target="#forgotPasswordModal">Forgot Password?</a>
                            <button type="submit" id="login" name="login" class="btn btn-primary offset-4 mt-2">Login</button>
                        </div>
                    </g:form>
                        <div class="modal fade" id="forgotPasswordModal" tabindex="-1"
                             aria-labelledby="forgotPasswordModalLabel" aria-hidden="true">
                            <div class="modal-dialog mt-2">
                                <div class="modal-content mt-2">
                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="forgotPasswordModalLabel">Reset Password</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="sendOTP" id="sendOTP">
                                        <form>
                                            <div class="form-group mt-3">
                                                <label >Email address:</label>
                                                <input type="email" class="form-control mt-1"  id="forgotPasswordEmail" name="forgotPasswordEmail" aria-describedby="emailHelp" placeholder="Enter email" required>
                                            </div>
                                            <div class="error" id="error" style="display:none; color: red">Email not Registered</div>
                                            <div class="form-group mt-2">
                                                <button type="button" onclick="sendOTP()">Send OTP</button>
                                            </div>
                                        </form>
                                    </div>

                                    <div class="verifyOTP" id="verifyOTP" style="display:none;">
                                        <form>
                                            <div class="form-group mt-2">
                                                <input type="text" id="otp" name="otp" placeholder="Enter OTP here" required>
                                                <button type="button" onclick="verifyOTP()">Verify</button>
                                                <button type="button" onclick="cancelVerification()">Cancel</button>
                                            </div>
                                            <div class="error" id="verificationError" style="display:none; color: red">Wrong OTP</div>
                                        </form>
                                    </div>

                                    <div class="resetPassword" id="resetPassword" style="display:none;">
                                        <form>
                                            <div class="form-group mt-1">
                                                <label for="newPassword">New Password:</label>
                                                <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                                            </div>
                                            <button type="button" class="btn btn-primary mt-2" onclick="resetPassword()" name="submit">Submit</button>
                                            <button type="button" onclick="cancelVerification()">Cancel</button>
                                            <div class="error" id="resetPasswordError" style="display:none; color: red">Password Invalid</div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
            </div>

            <!-- Register part -->
            <div class="card mt-3 " >
                <div class="card-header border-2">
                    <h2>Register</h2>
                </div>
                <div class="card-body border-2" style="background-color: rgba(69, 68, 70, 0.144);">
                    <g:uploadForm controller="Access" action="registerUser">
                        <div class="row mb-3">
                            <div class="col-sm-4">First Name*</div>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="firstName" id="firstName" aria-label="First name" onclick="textLimit('firstName')" required>
                            </div>
                        </div>
                        <div id="firstNameErrorMessage" style="display: none; color: red;"></div>
                        <div class="row mb-3">
                            <div class="col-sm-4">Last Name*</div>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="lastName" id="lastName" aria-label="Last name" onclick="textLimit('lastName')" required>
                            </div>
                        </div>
                        <div id="lastNameErrorMessage" style="display: none; color: red;"></div>
                        <div class="row mb-3">
                            <div class="col-sm-4">Email*</div>
                            <div class="col-sm-7">
                                <input type="email"  name="email" class="form-control" id="email" onclick="textLimit('email')" required>
                            </div>
                        </div>
                        <div id="emailErrorMessage" style="display: none; color: red;"></div>
                        <div class="row mb-3">
                            <div class="col-sm-4">Username*</div>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="userName" id="userName" aria-label="userName" onclick="textLimit('userName')" required>
                            </div>
                        </div>
                        <div id="userNameErrorMessage" style="display: none; color: red;"></div>
                        <div class="row mb-3">
                            <div class="col-sm-4">Password*</div>
                            <div class="col-sm-7">
                                <input type="password" class="form-control" name="password" id="password" placeholder="between 5 to 8 Character" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-4">Confirm Password*</div>
                            <div class="col-sm-7">
                                <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-4">Photo</div>
                            <div class="col-sm-7">
                                <input type="file" name="photo" id="userPhoto"/>
                            </div>
                            <div id="registerErrorMessage" style="display: none; color: red;"></div>

                        </div>
                        <div class="row">
                            <div class="col-sm-5 offset-7">
                                <button type="submit" class="btn btn-primary" name="register" id="register">Register</button>
                            </div>
                        </div>
                    </g:uploadForm>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    document.getElementById('register').addEventListener('click', function(event) {
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
        var registerErrorMessage = document.getElementById('registerErrorMessage');
        registerErrorMessage.textContent = message;
        registerErrorMessage.style.display = 'block';
    }

    document.getElementById('userPhoto').addEventListener('change', function(event) {
        var registerErrorMessage = document.getElementById('registerErrorMessage');
        registerErrorMessage.style.display = 'none';
    });
</script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
        integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
        integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous">
    </script>
</body>
</html>
