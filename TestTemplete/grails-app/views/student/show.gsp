
<%@ page import="test.Student" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
%{--<a href="#show-student" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="show-student" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list student">
    
        <g:if test="${studentInstance?.registrationDate}">
        <li class="fieldcontain">
            <span id="registrationDate-label" class="property-label"><g:message code="student.registrationDate.label" default="Registration Date" /></span>
            
                <span class="property-value" aria-labelledby="registrationDate-label"><g:formatDate date="${studentInstance?.registrationDate}" /></span>
            
        </li>
        </g:if>
    
        <g:if test="${studentInstance?.address}">
        <li class="fieldcontain">
            <span id="address-label" class="property-label"><g:message code="student.address.label" default="Address" /></span>
            
                <g:each in="${studentInstance.address}" var="a">
                <span class="property-value" aria-labelledby="address-label"><g:link controller="address" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
                </g:each>
            
        </li>
        </g:if>
    
        <g:if test="${studentInstance?.name}">
        <li class="fieldcontain">
            <span id="name-label" class="property-label"><g:message code="student.name.label" default="Name" /></span>
            
                <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${studentInstance}" field="name"/></span>
            
        </li>
        </g:if>
    
        <g:if test="${studentInstance?.qualification}">
        <li class="fieldcontain">
            <span id="qualification-label" class="property-label"><g:message code="student.qualification.label" default="Qualification" /></span>
            
                <g:each in="${studentInstance.qualification}" var="q">
                <span class="property-value" aria-labelledby="qualification-label"><g:link controller="qualification" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></span>
                </g:each>
            
        </li>
        </g:if>
    
        <g:if test="${studentInstance?.registration}">
        <li class="fieldcontain">
            <span id="registration-label" class="property-label"><g:message code="student.registration.label" default="Registration" /></span>
            
                <span class="property-value" aria-labelledby="registration-label"><g:fieldValue bean="${studentInstance}" field="registration"/></span>
            
        </li>
        </g:if>
    
    </ol>
    <g:form url="[resource:studentInstance, action:'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${studentInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form>
</div>--}%

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Student

        </h1>
        <ul class="top-links">
            <li><g:link class="btn btn-block btn-primary btn-xs" action="create"><i
                    class="fa fa-plus"></i>Add</g:link></li>

            %{--<sec:access url="/Student/clone/${studentInstance.id}">
                <g:link action="clone" id="${studentInstance.id}" class="btn btn-adn btn-xs"><i title="Clone"
                                                                                                           class="fa fa-clone"></i>Clone</g:link>
            </sec:access>--}%
            %{--<sec:access url="/Student/edit/${studentInstance.id}">--}%
            <li><g:link class="btn btn-block btn-warning btn-xs" action="edit"
                        id="${studentInstance?.id}"><i
                        class="fa fa-fw fa-edit"></i>Edit</g:link></li>
            %{--</sec:access>--}%
            %{--<sec:access url="/Student/delete/${studentInstance.id}">--}%
            <li>
                <g:link class="btn btn-block btn-danger btn-xs" action="delete"
                        id="${studentInstance?.id}"
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

                            
                            <g:if test="${studentInstance?.registrationDate}">
                                <tr>
                                    <td>Registration Date</td>
                                    
                                    <td><g:formatDate date="${studentInstance?.registrationDate}" /></td>
                                    
                                </tr>
                            </g:if>

                            
                            <g:if test="${studentInstance?.name}">
                                <tr>
                                    <td>Name</td>
                                    
                                    <td><g:fieldValue bean="${studentInstance}" field="name"/></td>
                                    
                                </tr>
                            </g:if>

                            
                            <g:if test="${studentInstance?.registration}">
                                <tr>
                                    <td>Registration</td>
                                    
                                    <td><g:fieldValue bean="${studentInstance}" field="registration"/></td>
                                    
                                </tr>
                            </g:if>

                            
                        </table>


                        
                        <br/>
                        <h1>Address</h1>
                        <table class="table table-bordered table-striped table-hover table-condensed">
                            <tr>
                                
                                <th>
                                    Postal
                                </th>
                                
                                <th>
                                    Email
                                </th>
                                
                                <th>
                                    Mobile
                                </th>
                                
                                <th>
                                    Is Active
                                </th>
                                
                            </tr>
                            <tbody>
                            <g:each in="${studentInstance.address}" var="i">
                                <tr>
                                    
                                    <td>
                                        ${i.postal}

                                    </td>
                                    
                                    <td>
                                        ${i.email}

                                    </td>
                                    
                                    <td>
                                        ${i.mobile}

                                    </td>
                                    
                                    <td>
                                        ${i.isActive}

                                    </td>
                                    
                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                        
                        <br/>
                        <h1>Qualification</h1>
                        <table class="table table-bordered table-striped table-hover table-condensed">
                            <tr>
                                
                                <th>
                                    Degree
                                </th>
                                
                            </tr>
                            <tbody>
                            <g:each in="${studentInstance.qualification}" var="i">
                                <tr>
                                    
                                    <td>
                                        ${i.degree}

                                    </td>
                                    
                                </tr>
                            </g:each>
                            </tbody>
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