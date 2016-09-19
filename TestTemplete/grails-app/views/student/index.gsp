
<%@ page import="test.Student" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		%{--<a href="#list-student" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-student" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="registrationDate" title="${message(code: 'student.registrationDate.label', default: 'Registration Date')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'student.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="registration" title="${message(code: 'student.registration.label', default: 'Registration')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${studentInstanceList}" status="i" var="studentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${studentInstance.id}">${fieldValue(bean: studentInstance, field: "registrationDate")}</g:link></td>
					
						<td>${fieldValue(bean: studentInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: studentInstance, field: "registration")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${studentInstanceCount ?: 0}" />
			</div>
		</div>--}%

	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>
				Student List
				%{--<small>application bill type list</small>--}%
			</h1>
			<ul class="top-links">

				<li><g:link class="btn btn-block btn-primary btn-xs" action="create"><i
						class="fa fa-plus"></i>Add</g:link></li>
			</ul>
		</section>


		<!-- Main content -->
		<section class="content">

			<!-- Serch box -->
			<div class="box box-info">
				<g:form action="index" method="get">
					<div class="box-header with-border">
						<h3 class="box-title">Search</h3>

						<div class="box-tools pull-right">
							<button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
									title="Collapse"><i class="fa fa-minus"></i></button>
							%{--<button class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>--}%
						</div>
					</div>

					<div class="box-body">
						<div class="row">

							<div class="col-sm-12 ">

								<div class="form-group">

									<div class="col-sm-3">

									</div>

									<div class="col-sm-2">
										<button type="submit" class="btn btn-primary"><i class="fa fa-search"></i>Search
										</button>
									</div>
								</div><!-- /.form-group -->

							</div><!-- /.col -->
						</div><!-- /.row -->



					</div><!-- /.box-body -->

				</g:form>
			</div><!-- /.box -->

		<!-- flash message -->
		<g:if test="${flash.success}">
			<div class="alert alert-success alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				<i class="icon fa fa-check"></i>
				${flash.success}
			</div>
		</g:if>
		<g:elseif test="${flash.error}">
			<div class="alert alert-danger alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				<i class="icon fa fa-remove"></i>
				${flash.error}
			</div>
		</g:elseif>
		<g:elseif test="${flash.message}">
			<div class="alert alert-info alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				<i class="icon fa fa-info"></i>
				${flash.message}
			</div>
		</g:elseif>
		<!-- flash message end -->

			<div class="box-body table-responsive no-padding">

				<table class="dataListTable table table-bordered table-striped table-hover table-condensed">
					<thead style="background-image: linear-gradient(to bottom, #fff, rgba(138, 202, 50, 0.3));">
					<tr>
						
						<g:sortableColumn property="registrationDate" title="${message(code: 'student.registrationDate.label', default: 'Registration Date')}" />
						
						<g:sortableColumn property="name" title="${message(code: 'student.name.label', default: 'Name')}" />
						
						<g:sortableColumn property="registration" title="${message(code: 'student.registration.label', default: 'Registration')}" />
						
						<th width="13%">Actions</th>
					</tr>
					</thead>
					<tbody>
					<g:each in="${studentInstanceList}" status="i" var="studentInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							
							<td><g:link action="show" id="${studentInstance.id}">${fieldValue(bean: studentInstance, field: "registrationDate")}</g:link></td>
							
							<td>${fieldValue(bean: studentInstance, field: "name")}</td>
							
							<td>${fieldValue(bean: studentInstance, field: "registration")}</td>
							

							<td>

								<div class="list-action">
									<sec:access url="/Student/show/${studentInstance.id}">
										<g:link action="show" id="${studentInstance?.id}" title="View"
												alt="View"><i data-toggle="tooltip" title="View"
															  class="fa fa-file-text-o btn-md "></i></g:link>
									</sec:access>
								%{--<sec:access url="/Student/clone/${studentInstance.id}">
                                    <g:link action="clone" id="${studentInstance?.id}"><i
                                            data-toggle="tooltip" title="Clone"
                                            class="fa fa-clone btn-md "></i></g:link>
                                </sec:access>--}%
									<sec:access url="/Student/edit/${studentInstance.id}">
										<g:link action="edit" id="${studentInstance?.id}"><i data-toggle="tooltip"
																									title="Edit"
																									class="fa fa-fw fa-edit btn-md "></i></g:link>
									</sec:access>
									<sec:access url="/Student/delete/${studentInstance.id}">
										<g:link action="delete" id="${studentInstance?.id}"
												onclick="return confirm('Are you sure you want to delete this record?');"><i
												data-toggle="tooltip" title="Delete"
												class="fa fa-trash btn-md "></i></g:link> %{--class="btn btn-block btn-danger btn-xs"--}%
									</sec:access>
								</div>
							</td>
						</tr>
					</g:each>

					</tbody>

				</table>
			</div><!-- /.box-body -->
		%{--</div><!-- /.box -->--}%
		%{--</div>--}%
		%{--</div>--}%

			<div align="center" class="row">
				<div class="col-xs-12">
					<div class="pagination dataTables_paginate paging_simple_numbers" id="example2_paginate">
						<g:paginate total="${studentInstanceCount ?: 0}" params="${params}"/>
					</div>
				</div>
			</div>

		</section><!-- /.content -->
	</div><!-- /.content-wrapper -->

	</body>
</html>
