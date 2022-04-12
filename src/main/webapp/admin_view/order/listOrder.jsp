<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="/WEB-INF/customtags/Paginate.tld" prefix="t"  %>


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
                    <h1> Product Page</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="index.php">Home</a></li>
                        <li class="breadcrumb-item active">Blank Page</li>
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
                <table class="table table-hover table table-bordered text-center " >
                    <thead class="thead-dark">
                        <tr>
                            <th>Id</th>
                            <th>AccountId</th>
                            <th>TotalPrice</th>
                            <th>Status</th>
                            <th>Order_date</th>   
                            <th colspan="2">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${pagination.data}" var="p">
                        <tr>
                            <td>${p.id}</td>
							<td>${p.accountId}</td>
							<td><fmt:formatNumber value="${p.total_price}"/></td>
							<td>${p.status != 0 ? "Đang xử lí" :"Đã đặt"}</td>
							<td><fmt:formatDate value="${p.order_date}" pattern="dd/MM/yyyy"/></td>
							<td><a class="btn btn-primary" href="Orders?action=detail"><i class="fas fa-info-circle"></i></a></td>
							<td><a class="btn btn-danger" href="Orders?action=remove&r_id=${p.id}" onclick="return confirm('Are you want delete ?')"><i class="fas fa-trash-alt"></i></a></td>
                        </tr>
                       </c:forEach>
                    </tbody>
                </table>
		         <nav aria-label="Page navigation example " style="margin:0 auto;" >
				  <ul class="pagination">
				    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
				    <% 
		           		int totalPage = (int)request.getAttribute("total");
		           		String url = request.getContextPath() + "/Orders?action=index"; 
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