<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Login</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>

<body>
    <div class="bg-img" height: 100vh;>

        <!--Navigation bar-->

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <img src="images/logo_linkSharing.ico" width="50" height="50"
                        class="d-inline-block align-text-center">
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
                    <ul class="navbar-nav ">

                        <!-- Create topic Modal -->
                        <li class="nav-item">
                            <!-- Button to trigger modal -->
                            <button type="button" class="btn btn-link chat-icon mt-2" data-bs-toggle="modal"
                                data-bs-target="#createTopicModal">
                                <img src="images/createTopic.svg" height="30" width="30"></img>
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="createTopicModal" tabindex="-1"
                                aria-labelledby="createTopicModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <!-- modal Header -->
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="createTopicModalLabel">Create Topic</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <!-- Modal Body -->
                                        <div class="modal-body">
                                            <form>
                                                <div class="mb-3">
                                                    <label for="topicName" class="form-label">Name</label>
                                                    <input type="text" class="form-control" id="topicName">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="visibility" class="form-label">Visibility</label>
                                                    <select class="form-select" id="visibility">
                                                        <option value="public">Public</option>
                                                        <option value="private">Private</option>
                                                    </select>
                                                </div>
                                            </form>
                                        </div>
                                        <!-- Modal Footer -->
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary"
                                                data-bs-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary">Create</button>
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
                                <img src="images/sendInvitation.svg" height="30" width="30"></img>
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
                                            <form>
                                                <div class="mb-3">
                                                    <label for="userEmail" class="form-label">Email*:</label>
                                                    <input type="text" class="form-control" id="userEmail">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="shareTopic" class="form-label">Topic*:</label>
                                                    <select class="form-select" id="shareTopic">
                                                        <option><a href="#">Topic1</a></option>
                                                        <option><a href="#">Topic2</a></option>
                                                    </select>
                                                </div>
                                            </form>
                                        </div>
                                        <!-- Modal Footer -->
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary">Invite</button>
                                            <button type="button" class="btn btn-secondary"
                                                data-bs-dismiss="modal">Cancel</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item">
                            <!-- User profile section -->
                            <div class="userProfilePhoto mt-2">
                                <label for="userProfilePhoto" class="form-label mt-2">
                                    <a href="#"><img src="images/userProfilePhoto.svg" height="30" width="30"></a>
                                </label>
                            </div>
                        </li>
                        <li>
                            <div class="dropdown">
                                <select class="form-select form-select-sm mt-3 mb-2"
                                    aria-label=".form-select-lg example">
                                    <option selected><a href="#">userName</a></option>
                                    <option><a href="#">Profile</a></option>
                                    <option><a href="#">Users</a></option>
                                    <option><a href="#">Topics</a></option>
                                    <div class="dropdown-divider"></div>
                                    <option><a href="#">Logout</a></option>
                                </select>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="bi bi-person"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>

    <!-- Main Body -->
    <div class="container-fluid">
        <div class="row">

            <!-- User details card -->
            <div class="col-md-6">
                <div class="userDetailsCard mt-4 border-2">
                    <div class="userDetailsCardBody">
                        <div class="card">
                            <div class="row">
                                <div class="col-sm-3 mt-4 border-2">
                                     <img src="images/defaultProfileImage.avif" class="profilePhoto-img-left" height="100" width="100" alt="User profile picture">
                                </div>
                                <div class="col-sm-6">
                                    <div class="card-body"></div>
                                        <h5 class="card-title">John Doe</h5>
                                        <p class="card-text">johndoe@example.com</p>
                                        <p class="card-text"><strong>Subscriptions:</strong> 10</p>
                                        <p class="card-text"><strong>Topics:</strong> 5</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <!-- Subscription details card -->
                <div class="card mt-3 border-2">
                    <div class="card-header border-2">
                        <h2>Subscriptions</h2>
                    </div>
                    <div class="card-body">
                        <div class="scrollable-container">
                            <!-- Add top posts here -->
                            <ul>
                                <li></li>
                                <li></li>
                                <li></li>
                                <li></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- Trending Topics card -->
                <div class="card mt-3 border-2">
                    <div class="card-header border-2">
                        <h2>Trending Topics</h2>
                    </div>
                    <div class="card-body">
                        <div class="scrollable-container">
                            <!-- Add top posts here -->
                            <ul>
                                <li></li>
                                <li></li>
                                <li></li>
                                <li></li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>

            <!-- User Inbox -->
            <div class="col-md-6 mt-4">
                <div class="card border-2">
                    <div class="card-header border-2">
                        <h2>Inbox</h2>
                    </div>
                    <div class="card-body" style="background-color: rgba(69, 68, 70, 0.144);">
                        <ul>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--  -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
</body>

</html>