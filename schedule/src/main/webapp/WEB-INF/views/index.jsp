<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QUARTZ</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/index.js"></script>
<style type="text/css">
	.btnRun, .btnPause, .btnResume, .btnEdit {margin-right: 8px;}
	.input-group {margin-bottom: 5px;}
	.title {text-align:center; font-size:30px; margin-top:15px;}
	.btnCreate {text-align:right; margin:5px 15px;}
	.head {border:solid; border-color:#8080805c; border-width:1px;}
	.line {
	    border: 0;
	    height: 1px;
	    background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.23), rgba(0, 0, 0, 0));
	}
</style>
</head>
<body>
	<div class="container-fluid" style="padding-top: 15px;">
	    
	    <div class="head">
	    	<div class="title">QUARTZ MANAGEMENT CONSOLE</div>
	    	<hr class="line">
	        <div class="btnCreate">
				<button type="button" class="btn btn-primary" id="createBtn" data-toggle="modal">create</button>
		    </div>
		</div>
		
		<table class="table table-bordered">
			<thead>
				<tr class="active">
					<th>id</th>
					<th>name</th>
					<th>group</th>
					<th>crons</th>
					<th>state</th>
					<th>desc</th>
					<!-- <th>interface</th> -->
					<th style="text-align: center;">operation</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${jobs}">
				<tr data-id="${item.jobId}">
					<td>${item.jobId}</td>
					<td id="name_${item.jobId}">${item.jobName}</td>
					<td id="group_${item.jobId}">${item.jobGroup}</td>
					<td id="cron_${item.jobId}">${item.cronExpression}</td>
					<td id="status_${item.jobId}">${item.jobStatus}</td>
					<td id="desc_${item.jobId}">${item.desc}</td>
					<!-- <td>$!item.interfaceName</td> -->
					<td style="text-align: center;">
						<div class="btn-group text-center" role="group"
							data-id="${item.jobId}">
							<button type="button" class="btn btn-default btnRun">runOnce</button>
							<button type="button" class="btn btn-default btnPause">pause</button>
							<button type="button" class="btn btn-default btnResume">resume</button>
							<button type="button" class="btn btn-default btnEdit">edit</button>
							<button type="button" class="btn btn-warning btnDelete">delete</button>
						</div>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">??</button>
					<h4 class="modal-title" id="myModalLabel">cron create</h4>
				</div>
				<div class="modal-body">
					<form id="mainForm" action="">
						<div>
							<input type="hidden" class="form-control" id="jobId" name="jobId" />
							<div class="input-group">
								<span class="input-group-addon">job name</span> 
								<input type="text" alias="no-edit" name="jobName" class="form-control" id="edit_name" />
							</div>
							<div class="input-group">
								<span class="input-group-addon">job group</span> 
								<input type="text" alias="no-edit" name="jobGroup" class="form-control" id="edit_group" />
							</div>
							<div class="input-group">
								<span class="input-group-addon">cron expression</span> 
								<input type="text" alias="no-edit" name="cronExpression" class="form-control" id="edit_cron" />
							</div>
							<div class="input-group">
								<span class="input-group-addon">job status</span> 
								<select id="edit_status" disabled="disabled" name="jobStatus" class="form-control" data-size="10">
									<option value=""></option>
									<option value="NORMAL">NORMAL</option>
									<option value="PAUSED">PAUSED</option>
								</select>
							</div>
							<div class="input-group">
								<span class="input-group-addon">job description</span> 
								<input type="text" alias="no-edit" name="desc" class="form-control" id="edit_desc" />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">cancel</button>
					<button type="button" class="btn btn-primary" id="save">save</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>