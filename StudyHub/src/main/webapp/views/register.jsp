
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Registration</title>
<style>
.error {
	color: red;
}
</style>
</head>
<body>
	<div class="container text-center">
		<h3 class="success" id="msg">${param.msg}</h3>
	</div>
	<div class="container py-5 ">

		<div class="col-md-5 offset-md-3">
			<div class="card">
				<div class="card-header text-center bg-primary">
					<h2>Registration Page</h2>
				</div>
				<div class="card-body">
					<form action="register" method="post" id="reg-form">

						<div class="form-group">
							<label for="email" style="margin-top: 5%">Email:<span
								style="color: red; padding-left: 5px">*</span></label> <input
								type="email" class="form-control" id="useremail"
								placeholder="Enter email" name="email"
								onkeypress="return event.charCode != 32">

							<p id="emailError" style="display: none;" class="error">Invalid
								Email Format</p>
						</div>

						<div class="form-group">
							<label for="firstname" style="margin-top: 5%">First Name:<span
								style="color: red; padding-left: 5px">*</span></label> <input
								type="text" class="form-control" id="firstName"
								placeholder="Enter your First Name" name="firstName"
								required="required">

							<p id="firstNameError" style="display: none;" class="error">Only
								Letters allowed</p>
						</div>

						<div class="form-group">
							<label for="lastName" style="margin-top: 5%">Last Name:<span
								style="color: red; padding-left: 5px">*</span></label> <input
								type="text" class="form-control" id="lastName"
								placeholder="Enter your Last Name" name="lastName"
								required="required">

							<p id="lastNameError" style="display: none;" class="error">Only
								Letters allowed</p>
						</div>

						<div class="form-group">
							<label for="mobile" style="margin-top: 5%">Mobile No:<span
								style="color: red; padding-left: 5px">*</span></label> <input
								type="text" class="form-control" id="mobile"
								placeholder="Enter mobile no" name="mobileNo"
								required="required" onkeypress="return event.charCode != 32">

							<p id="mobilenoError" style="display: none;" class="error">Phone
								number should be 10 digits number	 only</p>
						</div>

						<div class="form-group">
							<label for="address" style="margin-top: 5%">Address:<span
								style="color: red; padding-left: 5px">*</span></label> <input
								type="text" class="form-control" id="address"
								placeholder="Enter your home address " name="address"
								required="required">

							<p id="addressError" style="display: none;" class="error">Address
								length should be less than 255 letters</p>
						</div>


						<div class="form-group">
							<label for="userpassword" style="margin-top: 5%">Password:<span
								style="color: red; padding-left: 5px">*</span></label> <input
								type="password" class="form-control" id="userpassword"
								placeholder="eg.Abc@123" name="password" required="required"
								onkeyup="checkPassword()"> <input type="checkbox"
								onclick="showPassword()"> Show Password
							<div id="passwordError" style="display: none; font-size: 15px"
								class="error">
								<p>should contain minimum 8 character</p>

								<p>should contain atleast 1 uppercase letter</p>

								<p>should contain atleast 1 lowercase letter</p>


								<p>should contain atleast 1 special letter</p>

								<p>should contain atleast 1 numeric letter</p>


							</div>
						</div>
						<div class="form-group" id="div-confirm">
							<label for="userconfirmpassword" style="margin-top: 5%">Confirm
								Password:<span style="color: red; padding-left: 5px">*</span>
							</label> <input type="password" class="form-control"
								id="userconfirmpassword" placeholder="Confirm Password"
								required="required" onkeyup="confirmPassword()"
								oncut="return false" oncopy="return false"
								onpaste="return false" ondrag="return false"
								ondrop="return false">


							<p id="confirmpasswordError" style="display: none;"></p>
						</div>



						<span></span>
						<div class="container text-center py-3">
							<button type="submit" class="btn btn-default bg-primary ">Submit</button>
						</div>
						<p style="display: inline">Already a user?</p>
						<a href="login">Sign in</a>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		function showPassword() {
			var x = document.getElementById("userpassword");
			if (x.type === "password") {
				x.type = "text";
			} else {
				x.type = "password";
			}
		}

		$('#reg-form').on('submit', function(event) {
			event.preventDefault()
			if (checkValidation()) {
				$(this).unbind('submit').submit()
			}
		})

		$("#useremail").focus(function() {
			$('#emailError').hide()
		});

		$("#firstName").focus(function() {
			$('#firstNameError').hide()
		});
		$("#lastName").focus(function() {
			$('#lastNameError').hide()
		});
		$("#mobile").focus(function() {
			$('#mobilenoError').hide()
		});
		$("#userpassword").focus(function() {

			if ($('#userpassword').val() == $('#userconfirmpassword').val()) {
				$('#passwordError').hide()
			} else {
				$('#passwordError').show()
			}
		});
		$("#address").focus(function() {
			$('#addressError').hide()
		});

		function checkValidation() {
			let hasErrors = true

			var inputEmail = $('#useremail').val();
			var inputfirstName = $('#firstName').val()
			var inputlastName = $('#lastName').val()
			var inputmobile = $('#mobile').val()
			var inputpassword = $('#userpassword').val()
			var inputaddress = $('#address').val()

			if (hasErrors) {
				if (inputEmail == "" || checkEmail(inputEmail)) {
					$('#emailError').show()
					hasErrors = false
				} else {

					$('#emailError').hide()
				}
				if (inputfirstName == "" || onlyLetters(inputfirstName)) {

					$('#firstNameError').show()
					hasErrors = false
				} else {
					console.log("firstname")
					$('#firstNameError').hide()
				}
				if (inputlastName == "" || onlyLetters(inputlastName)) {
					hasErrors = false
					$('#lastNameError').show()
				} else {

					$('#lastNameError').hide()
				}
				if (inputmobile == "" || checkPhoneNumber(inputmobile)) {

					$('#mobilenoError').show()
					hasErrors = false
				} else {

					$('#mobilenoError').hide()
				}

				if (!checkPassword()) {
					$('#passwordError').show()
					hasErrors = false
				} else {
					$('#passwordError').hide()
				}

				if (!confirmPassword()) {
					hasErrors = false
				}
				if (inputaddress.length > 255) {
					$('#addressError').show()
					hasErrors = false
				} else {
					$('#addressError').hide()

				}
			} else {
				hasErrors = true
			}
			return hasErrors

		}

		function checkPassword() {

			if ($('#userconfirmpassword').val().length > 0) {
				console.log("confirm password")
				confirmPassword()
			}

			let userpass = $('#userpassword').val();
			if (checkCap(userpass)) {
				$('#passwordError').children().eq(1).css("color", "green")
			} else {
				$('#passwordError').children().eq(1).css("color", "red")

			}
			if (checksmall(userpass)) {
				$('#passwordError').children().eq(2).css("color", "green")
			} else {
				$('#passwordError').children().eq(2).css("color", "red")

			}
			if (checkspecial(userpass)) {
				$('#passwordError').children().eq(3).css("color", "green");

			} else {
				$('#passwordError').children().eq(3).css("color", "red")

			}

			if (userpass.length >= 8) {
				$('#passwordError').children().eq(0).css("color", "green")

			} else {
				$('#passwordError').children().eq(0).css("color", "red")

			}
			if (checknumber(userpass)) {
				$('#passwordError').children().eq(4).css("color", "green")

			} else {
				$('#passwordError').children().eq(4).css("color", "red")

			}
			if (checkregxPassword(userpass)) {
				$('#passwordError').hide()
				/* 	$('#div-confirm').show() */
				return true;

			} else {
				/* 	$('#div-confirm').hide() */
				$('#passwordError').show()
				return false;
			}
		}

		function confirmPassword() {
			let userpass = $('#userpassword').val();
			let confirmpass = $('#userconfirmpassword').val()
			if (userpass == confirmpass) {

				$('#confirmpasswordError').show()
				$("#confirmpasswordError").css("color", "green");
				$('#confirmpasswordError').text('Matched')
				return true;
			} else {

				$('#confirmpasswordError').show()
				$("#confirmpasswordError").css("color", "red");
				$('#confirmpasswordError').text('Password Mismatch')
				return false;
			}

		}

		//Email Regex
		function checkEmail(email) {
			var regx = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
			return !regx.test(email);
		}

		function onlyLetters(Name) {
			var regx = /^[a-zA-Z][a-zA-Z ]*$/;
			return !regx.test(Name);
		}

		function checkPhoneNumber(mobile) {
			var regx = /^[0-9]{10}$/;
			return !regx.test(mobile);
		}
		function checkregxPassword(password) {
			var re = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[^\w\s]).{8,}$/;
			return re.test(password)
		}

		function checkCap(pass) {
			var re = /[A-Z]/
			return re.test(pass)
		}

		function checksmall(pass) {
			var re = /[a-z]/
			return re.test(pass)
		}
		function checknumber(pass) {
			var re = /[0-9]/
			return re.test(pass)
		}

		function checkspecial(pass) {
			var re = /[`!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?~]/
			return re.test(pass)
		}
	</script>



</body>
</html>





