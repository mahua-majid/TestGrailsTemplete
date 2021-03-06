<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Add ${className}
		</h1>
		<ul class="top-links">
			<li><g:link class="btn btn-block btn-primary btn-xs" action="index"><i
					class="fa fa-reorder"></i>List</g:link></li>
		</ul>
	</section>

	<!-- Main content -->
	<section class="content">

		<!-- Horizontal Form -->
		<div class="box box-primary">

		<!-- flash message -->
			<g:if test="\${flash.success}">
				<div class="alert alert-success alert-dismissable">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					<i class="icon fa fa-check"></i>
					\${flash.success}
				</div>
			</g:if>
			<g:elseif test="\${flash.error}">
				<div class="alert alert-danger alert-dismissable">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					<i class="icon fa fa-remove"></i>
					\${flash.error}
				</div>
			</g:elseif>
			<g:elseif test="\${flash.message}">
				<div class="alert alert-info alert-dismissable">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					<i class="icon fa fa-info"></i>
					\${flash.message}
				</div>
			</g:elseif>
		<!-- flash message end -->

			<g:hasErrors bean="${propertyName}">
                <ul class="errors" role="alert">
                    <g:eachError bean="\${${propertyName}}" var="error">
                        <li <g:if test="\${error in org.springframework.validation.FieldError}">data-field-id="\${error.field}"</g:if>><g:message error="\${error}"/></li>
                    </g:eachError>
                </ul>
			</g:hasErrors>

	<g:form url="[resource:${propertyName}, action:'save']" method="post" class="form-horizontal" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
				<div style="width: 90%;margin-left: 4%; margin-top: 2%;">
					<div class="box-body">
						<g:render template="form"/>
					</div><!-- /.box-body -->
					<div align="right" class="box-footer">
						<button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-save"></i>Save
						</button>
						<button type="reset" class="btn btn-default btn-sm" style="background-color: #d2d6de;"><i
								class="fa fa-hand-paper-o"></i>Clear
						</button>
					</div><!-- /.box-footer -->
				</div>
			</g:form>
		</div><!-- /.box -->
	</section><!-- /.content -->
</div><!-- /.content-wrapper -->

</body>
</html>
