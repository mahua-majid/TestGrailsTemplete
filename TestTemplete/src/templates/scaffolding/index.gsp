<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		%{--<a href="#list-${domainClass.propertyName}" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="\${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-${domainClass.propertyName}" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="\${flash.message}">
				<div class="message" role="status">\${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
						allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
						props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && it.type != null && !Collection.isAssignableFrom(it.type) && (domainClass.constrainedProperties[it.name] ? domainClass.constrainedProperties[it.name].display : true) }
						Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
						props.eachWithIndex { p, i ->
							if (i < 6) {
								if (p.isAssociation()) { %>
						<th><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></th>
					<%      } else { %>
						<g:sortableColumn property="${p.name}" title="\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}" />
					<%  }   }   } %>
					</tr>
				</thead>
				<tbody>
				<g:each in="\${${propertyName}List}" status="i" var="${propertyName}">
					<tr class="\${(i % 2) == 0 ? 'even' : 'odd'}">
					<%  props.eachWithIndex { p, i ->
							if (i == 0) { %>
						<td><g:link action="show" id="\${${propertyName}.id}">\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</g:link></td>
					<%      } else if (i < 6) {
								if (p.type == Boolean || p.type == boolean) { %>
						<td><g:formatBoolean boolean="\${${propertyName}.${p.name}}" /></td>
					<%          } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
						<td><g:formatDate date="\${${propertyName}.${p.name}}" /></td>
					<%          } else { %>
						<td>\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</td>
					<%  }   }   } %>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="\${${propertyName}Count ?: 0}" />
			</div>
		</div>--}%

	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>
				${className} List
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

			<div class="box-body table-responsive no-padding">

				<table class="dataListTable table table-bordered table-striped table-hover table-condensed">
					<thead style="background-image: linear-gradient(to bottom, #fff, rgba(138, 202, 50, 0.3));">
					<tr>
						<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
						allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
						props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && it.type != null && !Collection.isAssignableFrom(it.type) && (domainClass.constrainedProperties[it.name] ? domainClass.constrainedProperties[it.name].display : true) }
						Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
						props.eachWithIndex { p, i ->
							if (i < 6) {
								if (p.isAssociation()) { %>
						<th><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></th>
						<%      } else { %>
						<g:sortableColumn property="${p.name}" title="\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}" />
						<%  }   }   } %>
						<th width="13%">Actions</th>
					</tr>
					</thead>
					<tbody>
					<g:each in="\${${propertyName}List}" status="i" var="${propertyName}">
						<tr class="\${(i % 2) == 0 ? 'even' : 'odd'}">
							<%  props.eachWithIndex { p, i ->
								if (i == 0) { %>
							<td><g:link action="show" id="\${${propertyName}.id}">\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</g:link></td>
							<%      } else if (i < 6) {
								if (p.type == Boolean || p.type == boolean) { %>
							<td><g:formatBoolean boolean="\${${propertyName}.${p.name}}" /></td>
							<%          } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
							<td><g:formatDate date="\${${propertyName}.${p.name}}" /></td>
							<%          } else { %>
							<td>\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</td>
							<%  }   }   } %>

							<td>

								<div class="list-action">
									<sec:access url="/${className}/show/\${${propertyName}.id}">
										<g:link action="show" id="\${${propertyName}?.id}" title="View"
												alt="View"><i data-toggle="tooltip" title="View"
															  class="fa fa-file-text-o btn-md "></i></g:link>
									</sec:access>
								%{--<sec:access url="/${className}/clone/\${${propertyName}.id}">
                                    <g:link action="clone" id="\${${propertyName}?.id}"><i
                                            data-toggle="tooltip" title="Clone"
                                            class="fa fa-clone btn-md "></i></g:link>
                                </sec:access>--}%
									<sec:access url="/${className}/edit/\${${propertyName}.id}">
										<g:link action="edit" id="\${${propertyName}?.id}"><i data-toggle="tooltip"
																									title="Edit"
																									class="fa fa-fw fa-edit btn-md "></i></g:link>
									</sec:access>
									<sec:access url="/${className}/delete/\${${propertyName}.id}">
										<g:link action="delete" id="\${${propertyName}?.id}"
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
						<g:paginate total="\${${propertyName}Count ?: 0}" params="\${params}"/>
					</div>
				</div>
			</div>

		</section><!-- /.content -->
	</div><!-- /.content-wrapper -->

	</body>
</html>
