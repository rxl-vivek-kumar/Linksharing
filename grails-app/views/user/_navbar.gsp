<%@ page import="linkshare.VisibilityEnum" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid ">
        <a class="navbar-brand" href="#">
            <g:img dir="images" file="logo_linkSharing.png" width="40" height="40"/>
            LinkShare
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse offset-5" id="navbarNav">
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
            <g:if test="${session.currentUser}">
                <ul class="navbar-nav ">
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
                                            <div class="mb-3">
                                                <label for="shareTopic"  class="form-label">Topic*:</label>
                                                <select class="form-select" name="invitedForTopic" id="shareTopic">
                                                    <option><a href="#">Topic1</a></option>
                                                    <option><a href="#">Topic2</a></option>
                                                </select>
                                            </div>
                                            <!-- Modal Footer -->
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-primary">Invite
                                                </button>
                                                <button type="button" class="btn btn-secondary"
                                                        data-bs-dismiss="modal">Cancel
                                                </button>
                                            </div>
                                        </g:form>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item">
                        <!-- User profile section -->
                        <div class="userProfilePhoto mt-2">
                            <label for="defaultPhoto" class="form-label mt-2">
                                <a href="#"><g:img dir="images" id="defaultPhoto" file="defaultPhoto.svg" width="30" height="30"/></a>
                            </label>
                        </div>
                    </li>
                    <li>
                        <div class="dropdown show">
                            <a class="btn btn-outline btn-xs mt-2 dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown"
                               aria-haspopup="true" aria-expanded="false">
                                ${session.currentUser.userName}
                            </a>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-item" href="#">Profile</a>
                                <g:if test="${session.currentUser.isAdmin}">
                                    <a class="dropdown-item" href="#">Users</a>
                                    <a class="dropdown-item" href="#">Topics</a>
                                    <a class="dropdown-item" href="#">Posts</a>
                                </g:if>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="/Access/logoutUser">Logout</a>
                            </div>
                        </div>
                    </li>
                </ul>
            </g:if>
    </div>
</nav>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
        integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
        integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous">
    </script>
</body>
</html>