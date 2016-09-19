<%=packageName%>
<% import grails.persistence.Event %>

<% excludedProps = Event.allEvents.toList() << 'version' << 'dateCreated' << 'lastUpdated'
persistentPropNames = domainClass.persistentProperties*.name
boolean hasHibernate = pluginManager?.hasGrailsPlugin('hibernate') || pluginManager?.hasGrailsPlugin('hibernate4')
if (hasHibernate) {
    def GrailsDomainBinder = getClass().classLoader.loadClass('org.codehaus.groovy.grails.orm.hibernate.cfg.GrailsDomainBinder')
    if (GrailsDomainBinder.newInstance().getMapping(domainClass)?.identity?.generator == 'assigned') {
        persistentPropNames << domainClass.identifier.name
    }
}
props = domainClass.properties.findAll {
    persistentPropNames.contains(it.name) && !excludedProps.contains(it.name) && (domainClass.constrainedProperties[it.name] ? domainClass.constrainedProperties[it.name].display : true)
}
Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))



for (p in props) {
    if (p.embedded) {
        def embeddedPropNames = p.component.persistentProperties*.name
        def embeddedProps = p.component.properties.findAll {
            embeddedPropNames.contains(it.name) && !excludedProps.contains(it.name)
        }
        Collections.sort(embeddedProps, comparator.constructors[0].newInstance([p.component] as Object[]))
%><fieldset class="embedded"><legend><g:message code="${domainClass.propertyName}.${p.name}.label"
                                                default="${p.naturalName}"/></legend><%
        for (ep in p.component.properties) {
            renderFieldForProperty(ep, p.component, "${p.name}.")
        }
%></fieldset><%
    } else {
        if (p.oneToMany) {

%>
<h1>${p.referencedDomainClass?.propertyName.toString().capitalize()}</h1>

<g:if test="\${${domainClass.propertyName}Instance?.${p.referencedDomainClass?.propertyName}?.size()>0}">
    <g:each in="\${${domainClass.propertyName}Instance?.${p.referencedDomainClass?.propertyName}}"
            var="\${${p.referencedDomainClass?.propertyName}Instance}" status="j">
        <div class="box box-info ${p.referencedDomainClass?.propertyName}Edit">
            <div class="box-body">

                <div class="form-group">
                    <g:hiddenField name="${p.referencedDomainClass?.propertyName}\${j+1}id"
                                   value="\${${p.referencedDomainClass?.propertyName}Instance.id}"/>
                    <g:hiddenField name="${p.referencedDomainClass?.propertyName}\${j+1}deleted" value="false"/>
                    <g:hiddenField name="${p.referencedDomainClass?.propertyName}\${j+1}new" value="\${${
                            p.referencedDomainClass?.propertyName}Instance.id == null ? 'true' : 'false'}"/>
                </div>

                <%
                        excludedProps = Event.allEvents.toList() << 'id' << 'version' << 'dateCreated' << 'lastUpdated'
                        domainClass1 = p.referencedDomainClass
                        persistentPropNames = domainClass1.persistentProperties*.name
                        persistentPropNames << domainClass1.identifier.name
                        props = domainClass1.properties.findAll {
                            persistentPropNames.contains(it.name) && !excludedProps.contains(it.name) && (domainClass1.constrainedProperties[it.name] ? domainClass1.constrainedProperties[it.name].display : true)
                        }
                        Collections.sort(props, comparator.constructors[0].newInstance([domainClass1] as Object[]))
                        for (q in props) {
                            if (!(q.manyToOne || q.oneToOne)) {
                                renderFieldForProperty(q, domainClass1,"${p.referencedDomainClass?.propertyName}\${j + 1}")

                            }
                        }
                %>
            </div>

            <div class="box-footer"><div class="pull-right"><a class="btn btn-block btn-danger btn-xs"
                                                               onclick="dtlRemove('${p.referencedDomainClass?.propertyName}Edit', this);"><i
                        class="fa fa-minus"></i>Remove</a></div></div>
        </div>

    </g:each>
    <div class="pull-right">
        <a class="btn btn-block btn-primary btn-xs"
           onclick="setNameAndId('${p.referencedDomainClass?.propertyName}Edit');
           dtlAdd('${p.referencedDomainClass?.propertyName}Edit');"><i
                class="fa fa-plus"></i> Add more</a>

    </div>
    <br/>
</g:if>
<g:else>
    <div class="box box-info ${p.referencedDomainClass?.propertyName}Create" style="display: none;">
        <div class="box-body">

            <div class="form-group">
                <g:hiddenField name="${p.referencedDomainClass?.propertyName}0id" value=""/>
                <g:hiddenField name="${p.referencedDomainClass?.propertyName}0deleted" value="false"/>
                <g:hiddenField name="${p.referencedDomainClass?.propertyName}0new" value="true"/>
            </div>

            <%
                    excludedProps = Event.allEvents.toList() << 'id' << 'version' << 'dateCreated' << 'lastUpdated'
                    domainClass1 = p.referencedDomainClass
                    persistentPropNames = domainClass1.persistentProperties*.name
                    persistentPropNames << domainClass1.identifier.name
                    props = domainClass1.properties.findAll {
                        persistentPropNames.contains(it.name) && !excludedProps.contains(it.name) && (domainClass1.constrainedProperties[it.name] ? domainClass1.constrainedProperties[it.name].display : true)
                    }
                    Collections.sort(props, comparator.constructors[0].newInstance([domainClass1] as Object[]))
                    for (q in props) {
                        if (!(q.manyToOne || q.oneToOne)) {
                            renderFieldForProperty(q, domainClass1, "${p.referencedDomainClass?.propertyName}0")

                        }
                    }
            %>
        </div>

        <div class="box-footer"><div class="pull-right"><a class="btn btn-block btn-danger btn-xs"
                                                           onclick="dtlRemove('${p.referencedDomainClass?.propertyName}Create', this);"><i
                    class="fa fa-minus"></i>Remove</a></div></div>
    </div>


    <div class="pull-right">
        <a class="btn btn-block btn-primary btn-xs"
           onclick="setNameAndId('${p.referencedDomainClass?.propertyName}Create');
           dtlAdd('${p.referencedDomainClass?.propertyName}Create');"><i
                class="fa fa-plus"></i> Add more</a>

    </div>
    <br/>
</g:else>
<%
            }
        }
    }

    private renderFieldForProperty(p, owningClass, prefix) {

        boolean hasHibernate = pluginManager?.hasGrailsPlugin('hibernate') || pluginManager?.hasGrailsPlugin('hibernate4')
        boolean required = false
        if (hasHibernate) {
            cp = owningClass.constrainedProperties[p.name]
            required = (cp ? !(cp.propertyType in [boolean, Boolean]) && !cp.nullable : false)

        }
//        p.name = prefix + p.name

%>
<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
    <div class="form-group">
        <label>${p.naturalName}</label>
        ${renderEditor(p)}
    </div>
</div>
<%

    } %>



