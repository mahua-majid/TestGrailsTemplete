<%@ page import="test.Student" %>



<h1>Address</h1>

<g:if test="${studentInstance?.address?.size() > 0}">
    <g:each in="${studentInstance?.address}"
            var="${addressInstance}" status="j">
        <div class="box box-info addressEdit">
            <div class="box-body">

                <div class="form-group">
                    <g:hiddenField name="address${j + 1}id" value="${addressInstance.id}"/>
                    <g:hiddenField name="address${j + 1}deleted" value="false"/>
                    <g:hiddenField name="address${j + 1}new" value="${addressInstance.id == null ? 'true' : 'false'}"/>
                </div>


                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                    <div class="form-group">
                        <label>Postal</label>
                        <g:textField name="postal" value="${addressInstance?.postal}" class="form-control input-sm"/>

                    </div>
                </div>

                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                    <div class="form-group">
                        <label>Email</label>
                        <g:textField name="email" value="${addressInstance?.email}" class="form-control input-sm"/>

                    </div>
                </div>

                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                    <div class="form-group">
                        <label>Mobile</label>
                        <g:textField name="mobile" value="${addressInstance?.mobile}" class="form-control input-sm"/>

                    </div>
                </div>

                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                    <div class="form-group">
                        <label>Is Active</label>
                        <g:checkBox name="isActive" value="${addressInstance?.isActive}" class="pull-left"/>

                    </div>
                </div>

            </div>

            <div class="box-footer"><div class="pull-right"><a class="btn btn-block btn-danger btn-xs"
                                                               onclick="dtlRemove('addressEdit', this);"><i
                        class="fa fa-minus"></i>Remove</a></div></div>
        </div>

    </g:each>
    <div class="pull-right">
        <a class="btn btn-block btn-primary btn-xs"
           onclick="setNameAndId('addressEdit');
           dtlAdd('addressEdit');"><i
                class="fa fa-plus"></i> Add more</a>

    </div>
    <br/>
</g:if>
<g:else>
    <div class="box box-info addressCreate" style="display: none;">
        <div class="box-body">

            <div class="form-group">
                <g:hiddenField name="address0id" value=""/>
                <g:hiddenField name="address0deleted" value="false"/>
                <g:hiddenField name="address0new" value="true"/>
            </div>


            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                <div class="form-group">
                    <label>Postal</label>
                    <g:textField name="postal" value="${addressInstance?.postal}" class="form-control input-sm"/>

                </div>
            </div>

            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                <div class="form-group">
                    <label>Email</label>
                    <g:textField name="email" value="${addressInstance?.email}" class="form-control input-sm"/>

                </div>
            </div>

            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                <div class="form-group">
                    <label>Mobile</label>
                    <g:textField name="mobile" value="${addressInstance?.mobile}" class="form-control input-sm"/>

                </div>
            </div>

            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                <div class="form-group">
                    <label>Is Active</label>
                    <g:checkBox name="isActive" value="${addressInstance?.isActive}" class="pull-left"/>

                </div>
            </div>

        </div>

        <div class="box-footer"><div class="pull-right"><a class="btn btn-block btn-danger btn-xs"
                                                           onclick="dtlRemove('addressCreate', this);"><i
                    class="fa fa-minus"></i>Remove</a></div></div>
    </div>


    <div class="pull-right">
        <a class="btn btn-block btn-primary btn-xs"
           onclick="setNameAndId('addressCreate');
           dtlAdd('addressCreate');"><i
                class="fa fa-plus"></i> Add more</a>

    </div>
    <br/>
</g:else>

<h1>Qualification</h1>

<g:if test="${studentInstance?.qualification?.size() > 0}">
    <g:each in="${studentInstance?.qualification}"
            var="${qualificationInstance}" status="j">
        <div class="box box-info qualificationEdit">
            <div class="box-body">

                <div class="form-group">
                    <g:hiddenField name="qualification${j + 1}id" value="${qualificationInstance.id}"/>
                    <g:hiddenField name="qualification${j + 1}deleted" value="false"/>
                    <g:hiddenField name="qualification${j + 1}new" value="${qualificationInstance.id == null ? 'true' : 'false'}"/>
                </div>


                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                    <div class="form-group">
                        <label>Degree</label>
                        <g:textField name="degree" value="${qualificationInstance?.degree}"
                                     class="form-control input-sm"/>

                    </div>
                </div>

            </div>

            <div class="box-footer"><div class="pull-right"><a class="btn btn-block btn-danger btn-xs"
                                                               onclick="dtlRemove('qualificationEdit', this);"><i
                        class="fa fa-minus"></i>Remove</a></div></div>
        </div>

    </g:each>
    <div class="pull-right">
        <a class="btn btn-block btn-primary btn-xs"
           onclick="setNameAndId('qualificationEdit');
           dtlAdd('qualificationEdit');"><i
                class="fa fa-plus"></i> Add more</a>

    </div>
    <br/>
</g:if>
<g:else>
    <div class="box box-info qualificationCreate" style="display: none;">
        <div class="box-body">

            <div class="form-group">
                <g:hiddenField name="qualification0id" value=""/>
                <g:hiddenField name="qualification0deleted" value="false"/>
                <g:hiddenField name="qualification0new" value="true"/>
            </div>


            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                <div class="form-group">
                    <label>Degree</label>
                    <g:textField name="degree" value="${qualificationInstance?.degree}" class="form-control input-sm"/>

                </div>
            </div>

        </div>

        <div class="box-footer"><div class="pull-right"><a class="btn btn-block btn-danger btn-xs"
                                                           onclick="dtlRemove('qualificationCreate', this);"><i
                    class="fa fa-minus"></i>Remove</a></div></div>
    </div>


    <div class="pull-right">
        <a class="btn btn-block btn-primary btn-xs"
           onclick="setNameAndId('qualificationCreate');
           dtlAdd('qualificationCreate');"><i
                class="fa fa-plus"></i> Add more</a>

    </div>
    <br/>
</g:else>




