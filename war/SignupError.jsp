
<script src="assets/sweet/sweetalert-dev.js"></script>
<link rel="stylesheet" href="assets/sweet/sweetalert.css">

<script type="text/javascript">
function load() {	
	swal({   
		title: "Sorry The Email already Exists",   
		text: "This Email already exists please check your Email for password ",   
		type: "error",   
		showCancelButton: false,   
		confirmButtonColor: "blue",   
		confirmButtonText: "Please Click here to go Back",     
		closeOnConfirm: false,   
		closeOnCancel: false }, 
		function(isConfirm){   
			if (isConfirm) {     
				window.location="Contact";
			} 
		});
}

</script>

<body onload="load()">

</body>
