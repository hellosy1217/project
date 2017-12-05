<!DOCTYPE html>
<html lang="en">
<head>
<title>My Member Settings on BlueBalloon - BlueBalloon</title>
<link rel="manifest" href="/manifest.json">
<link
	href="${pageContext.request.contextPath}/resources/user/member/css/edit1.css?ver=1"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/user/member/css/edit2.css?ver=1"
	rel="stylesheet" type="text/css" />
<link
	href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/responsive.min.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/js/responsive.min.js"></script>
<script type="text/javascript">
	var js_params = {
		"pending_count" : 0,
		"pending_date" : false,
		"balance" : "0.00",
		"sandbox" : false,
		"errors" : false,

	};

	var IntProfileSettings = setInterval(function() {
		if (typeof $ == 'function') {
			clearInterval(IntProfileSettings);
			$(document).ready(function() {
				new ProfileSettings(js_params).init();
			});
		}
	}, 10);
</script>
</head>
<body class=" ">
	<%@include file="../../header2.jsp"%>
	<div id="fb-root"></div>
	<div id="content" class="clearfix profile ">
		<div id="content_details"
			class="clearfix profile profile-settings container-fluid">
			<div class="row-fluid">
				<div class="span8 settings-left">
					<div class="profile-left span12" id="block-edit">
						<h2>Edit My Profile</h2>
						<form method="post" enctype="multipart/form-data">
							<div class="form">
								<div class="row">
									<div class="title">Profile picture</div>
									<div class="value">
										<input type="file" name="userpic" /><br /> <span class="tip">Upload
											a personal photo or if you are a company your business logo.</span>
									</div>
								</div>
								<div class="row">
									<div class="title">Full name</div>
									<div class="value">
										<input type="text" name="name" placeholder="Full name"
											value="name" />
									</div>
								</div>
								<div class="row">
									<div class="title">Email</div>
									<div class="value">
										<input type="text" disabled /><a href="#email_popup"
											id="email_link">Change email</a>
									</div>
								</div>
								<div class="row">
									<div class="title">Password</div>
									<div class="value">
										<input type="text" disabled /><a href="#password_popup"
											id="password_link">Change password</a>
									</div>
								</div>
								<div class="row">
									<div class="title">Phone number</div>
									<div class="value">
										<input type="text" name="phone" placeholder="Phone number" />
									</div>
								</div>
								<div class="row">
									<div class="title">Date of birth</div>
									<div class="value">
										<input type="text" name="birthdate" placeholder="DD/MM/YYYY"
											value="" id="date" />
									</div>
								</div>
								<div class="row">
									<div class="title">Gender</div>
									<div class="value">
										<select name="gender"><option value="">--
												Gender --</option>
											<option value="male">Male</option>
											<option value="female">Female</option></select>
									</div>
								</div>
							</div>
							<div class="footer">
								<input type="hidden" name="action" value="save_info" /><input
									type="submit" class="button button-blue" value="Save changes" />
							</div>
						</form>
					</div>
					<div class="profile-left span12" id="block-logout">
						<h2>Log out</h2>
						<p>By logging out of TourRadar I will no longer be able to use
							all of TourRadar's features.</p>
						<div class="footer">
							<a href="/travellers/logout?type=web"><input type="submit"
								class="button button-grey" value="Log out" /></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="hidden">
			<div id="email_popup" class="clearfix popup">
				<div>
					<strong>1.</strong> Enter new email address:
				</div>
				<div>
					<form id="change_email" onsubmit="return false">
						<input type="text" placeholder="Email" /><input type="submit"
							class="multi-line-button flat blue" value="Submit" />
					</form>
				</div>
			</div>
		</div>
		<div class="hidden">
			<div id="password_popup" class="clearfix popup">
				<form id="change_password" onsubmit="return false">
					<div>
						<strong>1.</strong> Enter new password:
					</div>
					<div>
						<input type="text" />
					</div>
					<div>
						<strong>2.</strong> Confirm new password:
					</div>
					<div>
						<input type="text" /><input type="submit"
							class="multi-line-button flat blue" value="Submit" />
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>