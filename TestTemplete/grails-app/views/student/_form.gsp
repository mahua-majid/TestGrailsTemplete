<%@ page import="test.Student" %>



<div class="form-group">
    <label class="col-sm-2 control-label input-sm">Registration Date</label>
    <div class="col-sm-3">
        <g:textField name="registrationDate"  value="${formatDate(format: 'dd/MM/yyyy', date: studentInstance?.registrationDate ?: new Date())}"  class="form-control addon-date-picker"/>

    </div>
</div>

<div class="form-group">
    <label class="col-sm-2 control-label input-sm">Name</label>
    <div class="col-sm-3">
        <g:textField name="name" required="" value="${studentInstance?.name}" class="form-control input-sm"/>

    </div>
</div>

<div class="form-group">
    <label class="col-sm-2 control-label input-sm">Registration</label>
    <div class="col-sm-3">
        <g:textField name="registration" required="" value="${studentInstance?.registration}" class="form-control input-sm"/>

    </div>
</div>


<br/>



<div>
    <g:render template="detail"/>
</div>





