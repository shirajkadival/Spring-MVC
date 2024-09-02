<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/2.1.4/css/dataTables.bootstrap5.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <meta charset="ISO-8859-1">
    <title>Employee Data</title>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">Employee Data</h2>
        <table id="example" class="table table-striped" style="width: 100%">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>City</th>
                    <th>Hobbies</th>
                    <th>Gender</th>
                    <th>Departments</th>
                    <th>Position</th>
                    <th>Image</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="emp" items="${empList}">
                <tr>
                    <td>${emp.id}</td>
                    <td>${emp.name}</td>
                    <td>${emp.city}</td>
                    <td>${emp.hobbies}</td>
                    <td>${emp.gender}</td>
                    <td>${emp.departments}</td>
                    <td>${emp.position}</td>
                    <td>
                    	<c:if test="${not empty emp.empImg}">
						    <button class="btn btn-link view-image-btn" id="btnImg" data-toggle="modal" data-target="#imageModal" 
						            data-img="${pageContext.request.contextPath}/images/${emp.empImg}">
						        <i class="fas fa-eye"></i>
						    </button>
						</c:if>
                    </td>
                    <td>
                        <a href="editEmp/${emp.id}" class="btn btn-primary"><i class="fas fa-edit"></i></a>
                        <a href="delEmp/${emp.id}" class="btn btn-danger"><i class="fas fa-trash"></i></a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="container text-center">
            <a href="loadUserForm" class="btn btn-primary">Add Employee</a>
        </div>
    </div>

    <!-- Modal for Viewing Image -->
    <div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="imageModalLabel">View Image</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body text-center">
                    <img id="modalImage" src="" alt="Image" style="max-width: 100%;">
                </div>
            </div>
        </div>
    </div>

    <!-- Required Scripts -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/2.1.4/js/dataTables.bootstrap5.js"></script>
    <script src="https://cdn.datatables.net/2.1.4/js/dataTables.js"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            $('#example').DataTable();
        });
        
        $('.view-image-btn').on('click', function() {
            var imageUrl = $(this).data('img');
            $('#modalImage').attr('src', imageUrl);
            $('#imageModal').modal('show'); 
        });
    </script>
</body>
</html>
