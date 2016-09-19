<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
%{--<a href="#show-${domainClass.propertyName}" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="\${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="show-${domainClass.propertyName}" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="\${flash.message}">
    <div class="message" role="status">\${flash.message}</div>
    </g:if>
    <ol class="property-list ${domainClass.propertyName}">
    <%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
        allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
        props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && (domainClass.constrainedProperties[it.name] ? domainClass.constrainedProperties[it.name].display : true) }
        Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
        props.each { p -> %>
        <g:if test="\${${propertyName}?.${p.name}}">
        <li class="fieldcontain">
            <span id="${p.name}-label" class="property-label"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></span>
            <%  if (p.isEnum()) { %>
                <span class="property-value" aria-labelledby="${p.name}-label"><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></span>
            <%  } else if (p.oneToMany || p.manyToMany) { %>
                <g:each in="\${${propertyName}.${p.name}}" var="${p.name[0]}">
                <span class="property-value" aria-labelledby="${p.name}-label"><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${p.name[0]}.id}">\${${p.name[0]}?.encodeAsHTML()}</g:link></span>
                </g:each>
            <%  } else if (p.manyToOne || p.oneToOne) { %>
                <span class="property-value" aria-labelledby="${p.name}-label"><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.encodeAsHTML()}</g:link></span>
            <%  } else if (p.type == Boolean || p.type == boolean) { %>
                <span class="property-value" aria-labelledby="${p.name}-label"><g:formatBoolean boolean="\${${propertyName}?.${p.name}}" /></span>
            <%  } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
                <span class="property-value" aria-labelledby="${p.name}-label"><g:formatDate date="\${${propertyName}?.${p.name}}" /></span>
            <%  } else if (!p.type.isArray()) { %>
                <span class="property-value" aria-labelledby="${p.name}-label"><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></span>
            <%  } %>
        </li>
        </g:if>
    <%  } %>
    </ol>
    <g:form url="[resource:${propertyName}, action:'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="\${${propertyName}}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
            <g:actionSubmit class="delete" action="delete" value="\${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form>
</div>--}%

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            ${className}

        </h1>
        <ul class="top-links">
            <li><g:link class="btn btn-block btn-primary btn-xs" action="create"><i
                    class="fa fa-plus"></i>Add</g:link></li>

            %{--<sec:access url="/${className}/clone/\${${propertyName}.id}">
                <g:link action="clone" id="\${${propertyName}.id}" class="btn btn-adn btn-xs"><i title="Clone"
                                                                                                           class="fa fa-clone"></i>Clone</g:link>
            </sec:access>--}%
            %{--<sec:access url="/${className}/edit/\${${propertyName}.id}">--}%
            <li><g:link class="btn btn-block btn-warning btn-xs" action="edit"
                        id="\${${propertyName}?.id}"><i
                        class="fa fa-fw fa-edit"></i>Edit</g:link></li>
            %{--</sec:access>--}%
            %{--<sec:access url="/${className}/delete/\${${propertyName}.id}">--}%
            <li>
                <g:link class="btn btn-block btn-danger btn-xs" action="delete"
                        id="\${${propertyName}?.id}"
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

                    <div class="box-body no-padding">
                        <table class="table table-striped">

                            <% excludedProps = Event.allEvents.toList() << 'id' << 'version'
                            allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
                            props = domainClass.properties.findAll {
                                allowedNames.contains(it.name) && !excludedProps.contains(it.name) && (domainClass.constrainedProperties[it.name] ? domainClass.constrainedProperties[it.name].display : true)
                            }
                            Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
                            props.each { p ->
                                if(!(p.oneToMany || p.manyToMany || p.manyToOne)){
                            %>
                            <g:if test="\${${propertyName}?.${p.name}}">
                                <tr>
                                    <td>${p.naturalName}</td>
                                    <%  if (p.isEnum()) { %>
                                    <td><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></td>
                                    <%  } else if (p.oneToMany || p.manyToMany) { %>
                                    <g:each in="\${${propertyName}.${p.name}}" var="${p.name[0]}">
                                        <td><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${p.name[0]}.id}">\${${p.name[0]}?.encodeAsHTML()}</g:link></td>
                                    </g:each>
                                    <%  } else if (p.manyToOne || p.oneToOne) { %>
                                    <td><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.encodeAsHTML()}</g:link></td>
                                    <%  } else if (p.type == Boolean || p.type == boolean) { %>
                                    <td><g:formatBoolean boolean="\${${propertyName}?.${p.name}}" /></td>
                                    <%  } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
                                    <td><g:formatDate date="\${${propertyName}?.${p.name}}" /></td>
                                    <%  } else if (!p.type.isArray()) { %>
                                    <td><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></td>
                                    <%  } %>
                                </tr>
                            </g:if>

                            <% } } %>
                        </table>


                        <%
                            excludedProps = Event.allEvents.toList() << 'id' << 'version'
                            allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
                            props = domainClass.properties.findAll {
                                allowedNames.contains(it.name) && !excludedProps.contains(it.name) && (domainClass.constrainedProperties[it.name] ? domainClass.constrainedProperties[it.name].display : true)
                            }
                            Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
                            props.each { p ->
                                if (p.oneToMany || p.manyToMany) {
                                    excludedProps = Event.allEvents.toList() << 'id' << 'version' << 'dateCreated' << 'lastUpdated'
                                    domainClass1 = p.referencedDomainClass
                                    persistentPropNames = domainClass1.persistentProperties*.name
                                    persistentPropNames << domainClass1.identifier.name
                                    props = domainClass1.properties.findAll {
                                        persistentPropNames.contains(it.name) && !excludedProps.contains(it.name) && (domainClass1.constrainedProperties[it.name] ? domainClass1.constrainedProperties[it.name].display : true)
                                    }
                                    Collections.sort(props, comparator.constructors[0].newInstance([domainClass1] as Object[]))
                        %>
                        <br/>
                        <h1>${p.referencedDomainClass?.propertyName.toString().capitalize()}</h1>
                        <table class="table table-bordered table-striped table-hover table-condensed">
                            <tr>
                                <%
                                        for (q in props) {
                                            if (!(q.manyToOne || q.oneToOne)) {
                                %>
                                <th>
                                    ${q.naturalName}
                                </th>
                                <%
                                            }
                                        }
                                %>
                            </tr>
                            <tbody>
                            <g:each in="\${${propertyName}.${p.referencedDomainClass?.propertyName}}" var="i">
                                <tr>
                                    <%
                                            for (q in props) {
                                                if (!(q.manyToOne || q.oneToOne)) {
                                    %>
                                    <td>
                                        \${i.${q.name}}

                                    </td>
                                    <%
                                                }
                                            }
                                    %>
                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                        <%
                                    }
                            }
                        %>
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