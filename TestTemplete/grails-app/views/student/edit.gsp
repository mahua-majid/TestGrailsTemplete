<%@ page import="test.Student" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
%{--<a href="#edit-student" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="edit-student" class="content scaffold-edit" role="main">
    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${studentInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${studentInstance}" var="error">
        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
    </g:hasErrors>
    <g:form url="[resource:studentInstance, action:'update']" method="PUT" >
        <g:hiddenField name="version" value="${studentInstance?.version}" />
        <fieldset class="form">
            <g:render template="form"/>
        </fieldset>
        <fieldset class="buttons">
            <g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
        </fieldset>
    </g:form>
</div>--}%

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Edit Student
        </h1>
        <ul class="top-links">
            <li><g:link class="btn btn-block btn-primary btn-xs" action="create"><i
                    class="fa fa-plus"></i>Add</g:link></li>
            <li><g:link class="btn btn-block btn-primary btn-xs" action="index"><i
                    class="fa fa-reorder"></i>List</g:link></li>
        </ul>
    </section>

    <!-- Main content -->
    <section class="content">

        <!-- Horizontal Form -->
        <div class="box box-primary">

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

            <g:hasErrors bean="studentInstance">
                <ul class="errors" role="alert">
                    <g:eachError bean="${studentInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>

            <g:form url="[resource: studentInstance, action: 'update']" method="post"
                    class="form-horizontal" >
            <div style="width: 90%;margin-left: 4%; margin-top: 2%;">
                <div class="box-body">
                    <g:render template="form"/>
                </div><!-- /.box-body -->
                <div align="right" class="box-footer">
                    <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-save"></i>Save
                    </button>
                %{--<sec:access url="/Student/clone/${studentInstance.id}">
                                    <g:link action="clone" id="${studentInstance?.id}" class="btn btn-adn btn-sm"><i
                                     class="fa fa-clone"></i>Clone</g:link>
                                </sec:access>--}%
                %{--<sec:access url="/Student/delete/${studentInstance.id}">--}%
                    <g:link action="delete" id="${studentInstance.id}" class="btn btn-danger btn-sm"><i
                            class="fa fa-trash"></i>Delete
                    </g:link>
            %{--</sec:access>--}%
                </div><!-- /.box-footer -->
            </div>
            </g:form>
        </div><!-- /.box -->
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</body>
</html>
