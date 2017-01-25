
<html lang="en">
<head>
<meta charset="utf-8" />

<link rel="icon" type="image/png"
	href="">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Sign Up | Contact Book</title>

<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />

<!--     Fonts and icons     -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons" />
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

<!-- CSS Files -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">


</head>

<body class="signup-page">
	<nav class="navbar successbg-primary tainer">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				
				<a class="navbar-brand" href="#">Contact Book</a>
			</div>

			<div class="collapse navbar-collapse" id="navigation-example">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"> Home </a></li>
					<li><a href="LoginPage"> Login </a></li>
					
				</ul>
			</div>
		
	</nav>

	<div class="container">
				<div class="row">
					<div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
						<div class="card card-signup">

								<div class="header header-primary text-center">
									<h4>Sign Up</h4>
							
							<form class="form" method="POST" action="Contact/Signup">
								<div class="content">
									<div class="input-group">
										<span class="input-group-addon" id="sizing-addon2">&#9786;
										</span>
										</span> <input type="text" class="form-control"
											placeholder="First Name..." name="name">
									</div>
<br>
									<div class="input-group">
										<span class="input-group-addon" id="sizing-addon2">&#9993;

										</span> <input type="email" class="form-control"
											placeholder="Email..." name="email" aria-describedby="sizing-addon2">
									</div>
<br>
										<div class="input-group">
										<span class="input-group-addon" id="sizing-addon2">&#128274;

										</span> <input type="password" placeholder="Password..."
											class="form-control" Id="Password" name="password" />
									</div>
	<br>													<div class="input-group">
										<span class="input-group-addon" id="sizing-addon2">&#128274;

										</span> <input type="password" placeholder="Retype Password..."
											class="form-control" Id="ConfirmPassword" name="retype" />
									</div>

								</div>
<br>
								<div class="footer text-center">
									<input type="Submit" class="btn btn-simple btn-primary btn-lg"
										onclick="return Validate()">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>


		</div>




</body>
<!--   Core JS Files   -->
<script src="assets/js/jquery.min.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/js/material.min.js"></script>

<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="assets/js/nouislider.min.js" type="text/javascript"></script>

<!--  Plugin for the Datepicker, full documentation here: http://www.eyecon.ro/bootstrap-datepicker/ -->
<script src="assets/js/bootstrap-datepicker.js" type="text/javascript"></script>

<!-- Control Center for Material Kit: activating the ripples, parallax effects, scripts from the example pages etc -->
<script src="assets/js/material-kit.js" type="text/javascript"></script>

<!-- Misc codes for validation and demos -->
<script src="assets/js/misc.js" type="text/javascript"></script>



</html>
