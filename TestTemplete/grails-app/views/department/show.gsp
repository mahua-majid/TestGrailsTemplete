
<%@ page import="test.Department" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'department.label', default: 'Department')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
%{--<a href="#show-department" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="show-department" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list department">
    
        <g:if test="${departmentInstance?.deptName}">
        <li class="fieldcontain">
            <span id="deptName-label" class="property-label"><g:message code="department.deptName.label" default="Dept Name" /></span>
            
                <span class="property-value" aria-labelledby="deptName-label"><g:fieldValue bean="${departmentInstance}" field="deptName"/></span>
            
        </li>
        </g:if>
    
    </ol>
    <g:form url="[resource:departmentInstance, action:'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${departmentInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form>
</div>--}%

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Department

        </h1>
        <ul class="top-links">
            <li><g:link class="btn btn-block btn-primary btn-xs" action="create"><i
                    class="fa fa-plus"></i>Add</g:link></li>

            %{--<sec:access url="/Department/clone/${departmentInstance.id}">
                <g:link action="clone" id="${departmentInstance.id}" class="btn btn-adn btn-xs"><i title="Clone"
                                                                                                           class="fa fa-clone"></i>Clone</g:link>
            </sec:access>--}%
            %{--<sec:access url="/Department/edit/${departmentInstance.id}">--}%
            <li><g:link class="btn btn-block btn-warning btn-xs" action="edit"
                        id="${departmentInstance?.id}"><i
                        class="fa fa-fw fa-edit"></i>Edit</g:link></li>
            %{--</sec:access>--}%
            %{--<sec:access url="/Department/delete/${departmentInstance.id}">--}%
            <li>
                <g:link class="btn btn-block btn-danger btn-xs" action="delete"
                        id="${departmentInstance?.id}"
                        onclick="return confirm('Are you sure you want to delete this record?');"><i
                        class="fa fa-trash"></i>Delete</g:link>

            </li>
            %{--</sec:access>--}%
            <li><g:link class="btn btn-block btn-primary btn-xs" action="index"><i
                    class="fa fa-reorder"></i>List</g:link></li>
        </ul>
    </section>

    <!-- Main content -->
    <section class="content">

        %{--<div class="row">--}%
        %{--<div class="col-xs-12">--}%

        <div align="center">

            <div class="box box-primary">
                %{--<div class="box-header">
                    <h3 class="box-title">Bill Type Detail View</h3>
                </div>--}%<!-- /.box-header -->
                <div style="width: 80%; margin-top: 2%;">

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

                    <div class="box-body no-padding">
                        <table class="table table-striped">

                            
                            <g:if test="${departmentInstance?.deptName}">
                                <tr>
                                    <td>Dept Name</td>
                                    
                                    <td><g:fieldValue bean="${departmentInstance}" field="deptName"/></td>
                                    
                                </tr>
                            </g:if>

                            
                        </table>


                        
                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div>
        </div>
        %{--</div>--}%
        %{--</div>--}%
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->

</body>
</html>