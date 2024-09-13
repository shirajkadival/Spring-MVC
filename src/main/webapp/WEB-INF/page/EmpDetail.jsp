<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>EMP Profile</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  </head>
  <body>
    <div class="container mt-5">
        <div class="main-body">
        
<!--               Breadcrumb -->
<!--               <nav aria-label="breadcrumb" class="main-breadcrumb"> -->
<!--                 <ol class="breadcrumb"> -->
<!--                   <li class="breadcrumb-item"><a href="index.html">Home</a></li> -->
<!--                   <li class="breadcrumb-item"><a href="javascript:void(0)">User</a></li> -->
<!--                   <li class="breadcrumb-item active" aria-current="page">User Profile</li> -->
<!--                 </ol> -->
<!--               </nav> -->
<!--               /Breadcrumb -->
        
              <div class="row gutters-sm">
                <div class="col-md-4 mb-3">
                  <div class="card">
                    <div class="card-body">
                      <div class="d-flex flex-column align-items-center text-center">
                        <img src="<c:url value='/images/${empData.empImg}' />" alt="Admin" class="rounded-circle" width="150">
                        <div class="mt-3">
                          <h4>${empData.name}</h4>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-8">
                  <div class="card mb-3">
                    <div class="card-body">
                      <div class="row">
                        <div class="col-sm-3">
                          <h6 class="mb-0">Full Name</h6>
                        </div>
                        <div class="col-sm-9 text-secondary">
                          <div class="form-group">
								<input type="text" class="form-control" id="name" name="name" placeholder="Enter your UserName" value="${empData.name}" autocomplete="off" disabled="disabled">
							</div>
                        </div>
                      </div>
                      <hr>
                      <div class="row">
                        <div class="col-sm-3">
                          <h6 class="mb-0">Password</h6>
                        </div>
                        <div class="col-sm-9 text-secondary">
                         <div class="form-group">
						        <div class="input-group">
						            <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" value="${empData.password}" disabled="disabled">
						            <div class="input-group-append">
						                <span class="input-group-text" style="cursor: pointer;">
						                    <i id="eyeIcon" class="fas fa-eye"></i> <!-- FontAwesome eye icon -->
						                </span>
						            </div>
						        </div>
						    </div>
                        </div>
                      </div>
                      <hr>
                      <div class="row">
                        <div class="col-sm-3">
                          <h6 class="mb-0">Hobbies</h6>
                        </div>
                        <div class="col-sm-9 text-secondary">
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
                        </div>
                      </div>
                      <hr>
                      <div class="row">
                        <div class="col-sm-3">
                          <h6 class="mb-0">Gender</h6>
                        </div>
                        <div class="col-sm-9 text-secondary">
                          <div class="form-group">
								<input class="form-check-input" type="radio" id="genderMale" name="gender" value="Male" ${empData.gender == 'Male' ? 'checked' : ''} disabled="disabled"> 
								<label class="form-check-label" for="genderMale">Male</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input class="form-check-input" type="radio" id="genderFemale" name="gender" value="Female" ${empData.gender == 'Female' ? 'checked' : ''} disabled="disabled"> 
								<label class="form-check-label" for="genderFemale">Female</label>
						  </div>
						</div>
                      </div>
                      <hr>
                      <div class="row">
                        <div class="col-sm-3">
                          <h6 class="mb-0">Departments</h6>
                        </div>
                        <div class="col-sm-9 text-secondary">
                          <div class="form-group">
							<select multiple class="form-control" id="departments" name="departments">
								<option value="HR" ${fn:contains(empData.departments, 'HR') ? 'selected' : ''}>HR</option>
								<option value="Finance" ${fn:contains(empData.departments, 'Finance') ? 'selected' : ''}>Finance</option>
								<option value="IT" ${fn:contains(empData.departments, 'IT') ? 'selected' : ''}>IT</option>
								<option value="Marketing" ${fn:contains(empData.departments, 'Marketing') ? 'selected' : ''}>Marketing</option>
							</select>
						 </div>
                        </div>
                      </div>
                      <hr>
                      <div class="row">
                        <div class="col-sm-3">
                          <h6 class="mb-0">Position</h6>
                        </div>
                        <div class="col-sm-9 text-secondary">
                          <div class="form-group">
							<select class="form-control" id="position" name="position">
								<option ${empData.position == 'Manager' ? 'selected' : '' }>Manager</option>
								<option ${empData.position == 'Developer' ? 'selected' : '' }>Developer</option>
								<option ${empData.position == 'Designer' ? 'selected' : '' }>Designer</option>
								<option ${empData.position == 'Intern' ? 'selected' : '' }>Intern</option>
							</select>
						 </div>
                        </div>
                      </div>
                    
                      <hr>
                      <div class="row text-center d-none">
                        <div class="col-sm-12">
                          <a class="btn btn-info " target="__blank" href="https://www.bootdey.com/snippets/view/profile-edit-data-and-skills" >Edit</a>
                        </div>
                      </div>
                    </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>