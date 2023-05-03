<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
     integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <title>Welcome to LinkShare</title>
</head>
<body>
    <style>
        .custom-row {
            height: 100vh;
        }
    </style>

    <!-- Navigation bar -->
    <nav class="navbar navbar-light bg-dark">
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

    <!-- Main Content -->
    <div class="container-fluid">
		<div class="row bg-dark mt-1">
			<div class="col-md-6">
				<div class="card mt-4 border-2">
					<div class="card-header border-2">
						<h2>Recent Status</h2>
					</div>
					<div class="card-body">
						<div class="scrollable-container">
							<!-- Add recent status here -->
                            <ul>
                                <li></li>
                                <li></li>
                                <li></li>
                                <li></li>
                            </ul>
						</div>
					</div>
				</div>

				<div class="card mt-3 border-2">
					<div class="card-header border-2">
						<h2>Top Posts</h2>
					</div>
					<div class="card-body">
						<div class="scrollable-container" style="overflow-y:scroll; max-height:150px">
							<!-- Add top posts here -->
                            <ul>
                                <li></li>
                                <li></li>
                                <li></li>
                                <li></li>
                                <li></li>
                                <li></li>
                                <li></li>
                                <li></li>
                                <li></li>
                                <li></li>
                            </ul>
						</div>
					</div>
				</div>
			</div>

            <!-- login part -->
            <div class="col-md-6 mt-4">
				<div class="card border-2" >
					<div class="card-header border-2" >
						<h2>Login</h2>
					</div>
					<div class="card-body" style="background-color: rgba(69, 68, 70, 0.144);">
						<g:form controller="Access" action="loginUser">
							<div class="form-group">
								<label for="email">Email/Username:</label>
								<input type="text" class="form-control" id="loginEmail" name="loginEmail" required>
							</div>
							<div class="form-group">
								<label for="password">Password:</label>
								<input type="password" class="form-control" id="loginPassword" name="loginPassword" required>
							</div>
							<div class="form-group mt-2">
								<a href="#" id="forgotPassword">Forgot Password?</a>
							    <button type="submit" id="login" name="login" class="btn btn-primary offset-5 mt-2">Login</button>
                            </div>
						</g:form>
					</div>
				</div>

                <!-- Register part -->
                <div class="card mt-3 " >
					<div class="card-header border-2">
						<h2>Register</h2>
					</div>
					<div class="card-body border-2" style="background-color: rgba(69, 68, 70, 0.144);">
                        <g:form controller="Access" action="registerUser">
                            <div class="row mb-3">
                                <div class="col-sm-4">First Name*</div>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" name="firstName" id="firstName" aria-label="First name">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-4">Last Name*</div>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" name="lastName" id="lastName" aria-label="Last name">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-4">Email*</div>
                                <div class="col-sm-7">
                                    <input type="email"  name="registerEmail" class="form-control" id="registerEmail" >
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-4">Username*</div>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" name="registerUserName" id="registerUserName" aria-label="registerUserName">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-4">Password*</div>
                                <div class="col-sm-7">
                                    <input type="password" class="form-control" name="registerPassword" id="registerPassword">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-4">Confirm Password*</div>
                                <div class="col-sm-7">
                                    <input type="password" class="form-control" name="confirmPassword" id="confirmPassword">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-4">Photo</div>
                                <div class="col-sm-7">
                                    <input type="file" name="photo" id="profilePhoto" accept="image/x-png,image/gif,image/jpeg,image/avif" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-5 offset-7">
                                    <button type="submit" class="btn btn-primary" name="register" id="register">Register</button>
                                </div>
                            </div>
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="controllers" role="navigation">
            <h2>Available Controllers:</h2>
            <ul>
                <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                    <li class="controller">
                        <g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link>
                    </li>
                </g:each>
            </ul>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
            integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
            integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous">
    </script>
</body>
</html>
