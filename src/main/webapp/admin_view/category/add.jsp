<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@include file="../../layouts/adHeader.jsp" %> 
<%@include file="../../layouts/adSidebar.jsp" %> 

<div class="content-wrapper">

	 <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1> Product Page</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="index.php">Product</a></li>
                        <li class="breadcrumb-item active">Create</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>
		
	<section class="content">
		 <div class="card">
            <div class="card-header">

			<form action="/JSP_WebProject/Categories?action=create" method="POST">
			
			<div class="row">
			    <div class="col-md-9">
				<h3 style="color:red">${err }</h3>
			        <div class="form-group">
			            <label for="">Category Name</label>
			            <input class="form-control" name="name" value="${c.name}"   placeholder=" Please Enter Category Name">
			            <p style="color:red;">${errName}</p>
			        </div>
		
			        
			          <div class="form-group">
			            <label for="">ParentId</label>
			           <input name="parentId"   class="form-control" value="${c.parentId}" placeholder=" Please Enter ParentId" >
			           <p style="color:red;">${errParentId}</p>
			        </div>
			
			    </div>
			    
			   
			        <div class="form-group">
			        <label for="">Status</label>
			        <div class="radio"  >
			            <label>
			                <input type="radio" name="status" value="1">
			                Public
			            </label>
			            <label>
			                <input type="radio" name="status" value="0" >
			                Private
			            </label>
			        </div>
			        <p style="color:red;">${errStatus}</p>
			    </div>
			          
			    </div>
			    <a href="Categories?action=index" class="btn btn-danger mr-3" style="opacity:65%;"><i
			                                            class="fa fa-arrow-circle-left" aria-hidden="true"></i> Back</a>
			    <button type="submit" value="Insert" class="btn btn-primary"> <i class="fa fa-save" aria-hidden="true"></i> Saved</button>
			</form>
   		 </div>
		</div>
		</div>
		</div>
	</section>
</div>




 <%@include file="../../layouts/adFooter.jsp" %> 