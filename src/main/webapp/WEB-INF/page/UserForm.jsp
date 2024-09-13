<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bootstrap Form</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
<style>
.form-card {
	max-width: 600px;
	margin: 50px auto;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.card-body {
	padding: 2rem;
}

.form-control, .form-check-label {
	margin-bottom: 1rem;
}

.btn-save {
	display: block;
	width: 100%;
}
</style>
</head>
<body>

	<div class="card form-card">
		<div class="card-body">
			<h4 class="text-center mb-4"
				style="background-color: #5bc0de;padding: 10px; border-radius: 5px; box-shadow: 0 4px 6px rgba(200, 200, 200, 0.5);">${empData.id > 0 ? 'Update Employees':'Employees Form' }</h4>
			<form action="${empData.id > 0 ? '../saveData':'saveData' }" method="post" enctype="multipart/form-data">
			
				<input type="hidden" id="id" name="id" value="${empData.id > 0 ? empData.id:0}">

					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="name">UserName</label> 
								<input type="text" class="form-control" id="name" name="name" placeholder="Enter your UserName" value="${empData.name}" autocomplete="off" required>
							</div>
						</div>
						
						<div class="col-md-6">
						    <div class="form-group">
						        <label for="name">Password</label> 
						        <div class="input-group">
						            <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" value="${empData.password}" required>
						            <div class="input-group-append">
						                <span class="input-group-text" style="cursor: pointer;">
						                    <i id="eyeIcon" class="fas fa-eye"></i> <!-- FontAwesome eye icon -->
						                </span>
						            </div>
						        </div>
						    </div>
						</div>

					</div>

					
					<div class="form-group">
						<label for="role">Your Role</label> 
						<select class="form-control" id="role" name="role">
							<option>Admin</option>
							<option>User</option>
						</select>
					</div>
				


				<div class="form-group">
					<label>Hobbies</label>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" id="hobby1" name="hobbies" value="Reading"
						${fn:contains(empData.hobbies,'Reading') ? 'checked' : ''}> 
						<label class="form-check-label" for="hobby1">Reading</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" id="hobby2" name="hobbies" value="Traveling"
						${fn:contains(empData.hobbies,'Traveling') ? 'checked' : ''}>
					    <label class="form-check-label" for="hobby2">Traveling</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" id="hobby3" name="hobbies" value="Sports"
						${fn:contains(empData.hobbies,'Sports') ? 'checked' : ''}> 
						<label class="form-check-label" for="hobby3">Sports</label>
					</div>
				</div>

				<div class="form-group">
					<label>Gender</label>
					<div class="form-check">
						<input class="form-check-input" type="radio" id="genderMale" name="gender" value="Male"
							${empData.gender == 'Male' ? 'checked' : ''}> 
						<label class="form-check-label" for="genderMale">Male</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" id="genderFemale" name="gender" value="Female"
							${empData.gender == 'Female' ? 'checked' : ''}> 
							<label class="form-check-label" for="genderFemale">Female</label>
					</div>
				</div>

				<div class="form-group">
					<label for="departments">Departments</label> 
					<select multiple class="form-control" id="departments" name="departments">
						<option value="HR"
							${fn:contains(empData.departments, 'HR') ? 'selected' : ''}>HR</option>
						<option value="Finance"
							${fn:contains(empData.departments, 'Finance') ? 'selected' : ''}>Finance</option>
						<option value="IT"
							${fn:contains(empData.departments, 'IT') ? 'selected' : ''}>IT</option>
						<option value="Marketing"
							${fn:contains(empData.departments, 'Marketing') ? 'selected' : ''}>Marketing</option>
					</select>
				</div>

				<div class="form-group">
					<label for="position">Your Position</label> 
					<select class="form-control" id="position" name="position">
						<option ${empData.position == 'Manager' ? 'selected' : '' }>Manager</option>
						<option ${empData.position == 'Developer' ? 'selected' : '' }>Developer</option>
						<option ${empData.position == 'Designer' ? 'selected' : '' }>Designer</option>
						<option ${empData.position == 'Intern' ? 'selected' : '' }>Intern</option>
					</select>
				</div>

				<div class="form-group">
					<label for="imageUpload">Upload Image</label> 
					<input type="file" class="form-control-file" id="imageUpload" name="tempEmpImg">
					<input type="hidden" name="empImg" value="${empData.empImg}">
				</div>
				<!-- Save Button -->
				<div class="row">
					<div class="col-6">
						<button type="submit" class="btn btn-primary w-100">${empData.id > 0 ? 'Update':'Save' }</button>
					</div>
					<div class="col-6">
						<a href="${empData.id > 0 ? '../loadViewEmp':'loadViewEmp' }" class="btn btn-success w-100">View Employees</a>
					</div>
				</div>
				<div class="container text-center mt-4">
					<a class="text-center" href="LoginForm">Already User</a>
				</div>
			</form>
		</div>
	</div>

	<!-- Bootstrap JS, Popper.js, and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<!-- Include jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#eyeIcon").on("click",function(){
		if($("#password").attr('type')==='password'){
			$("#password").attr('type','text');
			$(this).removeClass("fa-eye").addClass("fa-eye-slash");
		}
		else{
			$("#password").attr('type','password');
			$(this).removeClass("fa-eye-slash").addClass("fa-eye");
		}
	})
})
</script>

	
</body>
</html>
