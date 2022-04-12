<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@include file="../../layouts/adHeader.jsp" %> 
<%@include file="../../layouts/adSidebar.jsp" %> 
<style>
	.table tr {
	border:2px;
	}
</style>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1> Category Page</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="index.php">Category</a></li>
                        <li class="breadcrumb-item active">List</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

        <!-- Default box -->
        <div class="card">
            <div class="card-header">
             <form method="GET" >
                    <div class="row">
                        <div class="col-md-4">
                            <input type="hidden" name="action" value="index">
                            <input type="text" name="key" value="${key}" placeholder="Enter the key" class="form-control ml-5" width="200px">
                            
                        </div>
                        <div class="col-md-8">
                            <button class="btn btn-sm btn-primary mt-1" type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                        </div>
                </form>
            </div>

            <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                    <i class="fas fa-minus"></i>
                </button>
                <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                    <i class="fas fa-times"></i>
                </button>
            </div>
        </div>
        <div class="card-body">
            <div class="container">
            <a class="btn btn-info mb-2"  href="/JSP_WebProject/Categories?action=viewAdd"><i class="fas fa-plus"> </i> Create</a>
                <table class="table table-hover table table-bordered text-center table-striped" >
                    <thead class="thead-dark">
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Status</th>
                            <th>ParentId</th>
                            <th colspan="3">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${pagination.data}" var="c">
                        <tr>
                            <td>${c.id}</td>
							<td>${c.name}</td>
							<td >${c.status != 0 ? "Hiển thị" :"Ẩn"}</td>
							<td>${c.parentId}</td>
							<td><a class="btn btn-primary" href="Categories?action=detail&d_id=${c.id}"><i class="fas fa-info-circle"></i></a></td>
							<td><a class="btn btn-success" href="Categories?action=findId&id=${c.id}"><i class="far fa-edit"></i></a></td>
							<td><a class="btn btn-danger" href="Categories?action=remove&r_id=${c.id}" onclick="return confirm('Are you want delete ?')"><i class="fas fa-trash-alt"></i></a></td>
                        </tr>
                       </c:forEach>
                    </tbody>
                </table>
                <nav aria-label="Page navigation example " style="margin:0 auto;" >
				  <ul class="pagination">
				    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
				    <% 
		           		int totalPage = (int)request.getAttribute("total");
		           		String url = request.getContextPath() + "/Categories?action=index"; 
		           		String key = (String)request.getAttribute("key");
		           		if(key != null &&  !key.isEmpty()){
		           			for (int i = 1; i <= totalPage; i++) {
		               			out.write("<li><a class='page-link' href='" + url + "&page=" + i + "&key="+key+"' >" + i + "</a></li>");
		           			}
		           		}else{
		           			for (int i = 1; i <= totalPage; i++) {
		               			out.write("<li><a class='page-link' href='" + url + "&page=" + i + "' >" + i + "</a></li>");
		           			}
		           		}
		           		
		           	%>
		           	
				    <li class="page-item"><a class="page-link" href="#">Next</a></li>
				  </ul>
				</nav>
            </div>
        </div>


        <div class="card-footer">
            Footer
        </div>
        <!-- /.card-footer-->
</div>
<!-- /.card -->

</section>

<!-- /.content -->
</div>
<!-- /.content-wrapper -->

 <%@include file="../../layouts/adFooter.jsp" %> 