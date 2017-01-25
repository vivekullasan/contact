<html lang="en">
<head>
<meta charset="utf-8" />

<link rel="icon" type="image/png"
	href="">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Sign in | Contact Book</title>

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
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
	<nav class="navbar navbar-inverse navbar-absolute">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#navigation-example">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Contact book</a>
			</div>

			<div class="collapse navbar-collapse" id="navigation-example">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"> Home </a></li>
					<li><a href="SignupPage"> Sign up </a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="wrapper">
		<div class="container">
				<div class="row">
					<div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
						<div class="card card-signup">
							<form class="form" method="" action="">
								<div class="header header-primary text-center">
									<h4>Sign In</h4>
									<div class="social-line">
									  <a href="Contact/Login"  class="btn btn-block btn-social btn-twitter">
    <span class="fa fa-google-plus"></span> Sign in with Google
 
											
										</a>

									</div>
								</div>
							</form>

							<center><span>or</span></center><br>	
							<form class="form" method="POST" action="Contact/Signin">
								<div class="content">

									<div class="input-group input-group">
  <span class="input-group-addon" id="sizing-addon1">&#128231;</span> <input type="email" class="form-control"
											placeholder="Email..." name="email">
									</div>
<br>
									<div class="input-group input-group">
  <span class="input-group-addon" id="sizing-addon1">&#128274;</span>
										<input type="password" placeholder="Password..."
											class="form-control" name="password" />
									</div>

								</div><br>

								<div class="footer text-center">
									<input type="Submit" class="btn btn-simple btn-danger btn-lg">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>


		</div>

	</div>


</body>



</html>
