
<script src="assets/sweet/sweetalert-dev.js"></script>
<link rel="stylesheet" href="assets/sweet/sweetalert.css">

<script type="text/javascript">
function load() {	
	swal({   
		title: "Sorry Invalid Credential",   
		text: "Please check your Credential",   
		type: "error",   
		showCancelButton: false,   
		confirmButtonColor: "Blue",   
		confirmButtonText: "Back to login page",     
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
