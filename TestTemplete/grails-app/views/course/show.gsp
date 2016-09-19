
<%@ page import="test.Course" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
%{--<a href="#show-course" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="show-course" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list course">
    
        <g:if test="${courseInstance?.unit}">
        <li class="fieldcontain">
            <span id="unit-label" class="property-label"><g:message code="course.unit.label" default="Unit" /></span>
            
                <span class="property-value" aria-labelledby="unit-label"><g:fieldValue bean="${courseInstance}" field="unit"/></span>
            
        </li>
        </g:if>
    
        <g:if test="${courseInstance?.courseName}">
        <li class="fieldcontain">
            <span id="courseName-label" class="property-label"><g:message code="course.courseName.label" default="Course Name" /></span>
            
                <span class="property-value" aria-labelledby="courseName-label"><g:fieldValue bean="${courseInstance}" field="courseName"/></span>
            
        </li>
        </g:if>
    
    </ol>
    <g:form url="[resource:courseInstance, action:'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${courseInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form>
</div>--}%

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Course

        </h1>
        <ul class="top-links">
            <li><g:link class="btn btn-block btn-primary btn-xs" action="create"><i
                    class="fa fa-plus"></i>Add</g:link></li>

            %{--<sec:access url="/Course/clone/${courseInstance.id}">
                <g:link action="clone" id="${courseInstance.id}" class="btn btn-adn btn-xs"><i title="Clone"
                                                                                                           class="fa fa-clone"></i>Clone</g:link>
            </sec:access>--}%
            %{--<sec:access url="/Course/edit/${courseInstance.id}">--}%
            <li><g:link class="btn btn-block btn-warning btn-xs" action="edit"
                        id="${courseInstance?.id}"><i
                        class="fa fa-fw fa-edit"></i>Edit</g:link></li>
            %{--</sec:access>--}%
            %{--<sec:access url="/Course/delete/${courseInstance.id}">--}%
            <li>
                <g:link class="btn btn-block btn-danger btn-xs" action="delete"
                        id="${courseInstance?.id}"
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

                            
                            <g:if test="${courseInstance?.unit}">
                                <tr>
                                    <td>Unit</td>
                                    
                                    <td><g:fieldValue bean="${courseInstance}" field="unit"/></td>
                                    
                                </tr>
                            </g:if>

                            
                            <g:if test="${courseInstance?.courseName}">
                                <tr>
                                    <td>Course Name</td>
                                    
                                    <td><g:fieldValue bean="${courseInstance}" field="courseName"/></td>
                                    
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