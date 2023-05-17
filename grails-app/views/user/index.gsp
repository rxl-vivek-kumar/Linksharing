<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

</head>
<body>

<style>
.custom-row {
    height: 100vh;
}
</style>

<!-- Navigation bar -->
<nav class="navbar navbar-light bg-light">
    <div class="container-fluid bg-body-primary " >
        <a class="navbar-brand" href="#">
            <g:img dir="images" file="logo_linkSharing.png" width="40" height="40"/>LinkShare
        </a>
        <form class="d-flex" role="search">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
    </div>
</nav>
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
<!-- Main Content -->
<div class="container-fluid">
    <div class="row bg-dark mt-1">

        %{--Left column of page--}%
        <div class="col-md-6">


            %{--Recent Shares--}%
            <div class="card mt-4 border-2">
                <div class="card-header border-2">
                    <h2>Recent Shares</h2>
                </div>
                <div class="card-body bg-light">
                    <div class="scrollable-container" style="overflow-y:scroll; max-height:270px" >
                        <div class="row">
                            <g:each in="${recentShares}" var="resource">
                                <div class="col-sm-2 mt-1">
                                    <a href="#"><g:img dir="images" file="${resource.createdBy.photo}" width="60"/></a>
                                </div>
                                <div class="col-sm-10 mt-3" >
                                    <a href="#" target="_blank">${resource.description}</a>
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
                                <div class="col-sm-2">
                                    <a href="#"><g:img dir="images" file="${top.resource.createdBy.photo}" width="60"/></a>
                                </div>
                                <div class="col-sm-5 mt-2">
                                    <a href="#">${top.resource.description}</a>
                                </div>
                            </div>
                        </g:each>
                    </div>
                </div>
            </div>
        </div>

        %{--Right Column of page--}%
        <div class="col-md-6 mt-4">

            %{--User Login Card--}%
            <div class="card border-2" >
                <div class="card-header border-2" >
                    <h2>Login</h2>
                </div>
                <div class="card-body" style="background-color: rgba(69, 68, 70, 0.144);">
                    <g:form controller="Access" action="loginUser">
                        <div class="form-group">
                            <label for="loginEmail">Email/Username:</label>
                            <input type="text" class="form-control" id="loginEmail" name="loginEmail" required>
                        </div>
                        <div class="form-group">
                            <label for="loginPassword">Password:</label>
                            <input type="password" class="form-control" id="loginPassword" name="loginPassword" required>
                        </div>
                        <div class="form-group mt-2">
                            <a data-bs-toggle="modal" data-bs-target="">Forgot Password?</a>
                            <button type="submit" id="login" name="login" class="btn btn-primary offset-4 mt-2">Login</button>
                        </div>
                    </g:form>
%{--                        <div class="modal fade" id="forgotPasswordModal" tabindex="-1"--}%
%{--                             aria-labelledby="forgotPasswordModalLabel" aria-hidden="true">--}%
%{--                            <div class="modal-dialog mt-2">--}%
%{--                                <div class="modal-content mt-2">--}%
%{--                                    <!-- Modal Header -->--}%
%{--                                    <div class="modal-header">--}%
%{--                                        <h5 class="modal-title" id="forgotPasswordModalLabel">Reset Password</h5>--}%
%{--                                        <button type="button" class="btn-close" data-bs-dismiss="modal"--}%
%{--                                                aria-label="Close"></button>--}%
%{--                                    </div>--}%
%{--                                    <g:form id="forgotPasswordForm">--}%
%{--                                        <div class="form-group mt-2">--}%
%{--                                            <label >Email address:</label>--}%
%{--                                            <input type="email" class="form-control"  id="forgotPasswordEmail" name="email" aria-describedby="emailHelp" placeholder="Enter email">--}%
%{--                                        </div>--}%
%{--                                        <div class="form-group">--}%
%{--                                            <label for="newPassword">New Password:</label>--}%
%{--                                            <input type="password" class="form-control" id="newPassword" name="password" required>--}%
%{--                                        </div>--}%
%{--                                        <button type="submit" class="btn btn-primary mt-2" onclick="forgotPassword()" name="submit">Submit</button>--}%
%{--                                    </g:form>--}%
%{--                                </div>--}%
%{--                            </div>--}%
%{--                        </div>--}%
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
                            <div class="col-sm-4">Email*</div>
                            <div class="col-sm-7">
                                <input type="email"  name="email" class="form-control" id="email" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-4">Username*</div>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="userName" id="userName" aria-label="userName" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-4">Password*</div>
                            <div class="col-sm-7">
                                <input type="password" class="form-control" name="password" id="password" required>
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
                                <input type="file" id="" name="photo" />
                            </div>
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

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
        integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
        integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous">
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<asset:javascript src="dashboard.js"></asset:javascript>
</body>
</html>
