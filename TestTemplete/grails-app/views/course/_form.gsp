<%@ page import="test.Course" %>



<div class="form-group">
    <label class="col-sm-2 control-label input-sm">Unit</label>
    <div class="col-sm-3">
        <g:textField name="unit" maxlength="5" required="" value="${courseInstance?.unit}" class="form-control input-sm"/>

    </div>
</div>

<div class="form-group">
    <label class="col-sm-2 control-label input-sm">Course Name</label>
    <div class="col-sm-3">
        <g:textField name="courseName" maxlength="50" required="" value="${courseInstance?.courseName}" class="form-control input-sm"/>

    </div>
</div>


<br/>





