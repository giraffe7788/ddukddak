<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <title>뚝딱정형외과</title>

    <!-- Custom fonts for this template-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link href="/resources/sbadmin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="/resources/css/ddukddakboot.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template-->
    <link href="/resources/sbadmin/css/sb-admin-2.min.css" rel="stylesheet">
	<link rel="shortcut icon" type="image/png"
          href="/resources/images/icons/dduk_Icon.png">
</head>
<style>
*{
	font-family: 'Pretendard6';
	font-size: 14px;
}
</style>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar /// aside.jsp 시작 ///// -->
        <sec:authorize access="isAuthenticated()">
        	<tiles:insertAttribute name="aside" />
        </sec:authorize>
        <!-- End of Sidebar  /// aside.jsp 끝 /////-->

        <!-- Content Wrapper -->
        <div class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar ///// header.jsp 시작 /////// -->
                <sec:authorize access="isAuthenticated()">
               		<tiles:insertAttribute name="header" />
               	</sec:authorize>
                <!-- End of Topbar /////header.jsp 끝///// -->

				<div class="dduk-body">
	                <!-- Begin Page Content -->
					<tiles:insertAttribute name="body" />
                	<!-- /.container-fluid -->
				</div>

            </div>
            <!-- End of Main Content -->

            <!-- Footer /// footer.jsp 시작 ///// -->
            <tiles:insertAttribute name="footer" />
            <!-- End of Footer /// footer.jsp 끝 /////-->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">로그아웃 버튼을 클릭하면 로그아웃 됩니다.</div>
                <div class="modal-footer">
                	<form action="/logout" method="post">
	                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>                    
	                    <button type="submit" class="btn btn-primary">로그아웃</button>
	                    <sec:csrfInput />
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

    <!-- Page level plugins -->
<!--     <script src="/resources/sbadmin/vendor/chart.js/Chart.min.js"></script> -->

    <!-- Page level custom scripts -->
<!--     <script src="/resources/sbadmin/js/demo/chart-area-demo.js"></script> -->
<!--     <script src="/resources/sbadmin/js/demo/chart-pie-demo.js"></script> -->

</body>

</html>