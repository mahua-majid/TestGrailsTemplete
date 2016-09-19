/*
 * Document   : custom-confirm
 * Created on : Jun 06, 2016, 12:10:17 AM
 * Author     : hoshen.mahmud
 */
//============================================================================================================================
$('.confirm-delete').confirm({
//----------------------------------------------------------------------------------------------------------------------------
//      Title & Content
//----------------------------------------------------------------------------------------------------------------------------
//        title: 'Are you sure ? You want to delete !',
//        content: 'You want to delete !',
//----------------------------------------------------------------------------------------------------------------------------
//      Button text
//----------------------------------------------------------------------------------------------------------------------------
    confirmButton: 'Yes i agree',
    cancelButton: 'No Never !',
//----------------------------------------------------------------------------------------------------------------------------
//      Button style
//----------------------------------------------------------------------------------------------------------------------------
//      Available bootstrap options are : btn-primary btn-inverse btn-warning btn-info btn-danger btn-success
    confirmButtonClass: 'btn-danger',
    cancelButtonClass: 'btn-success',
//----------------------------------------------------------------------------------------------------------------------------
//      Hide elements
//----------------------------------------------------------------------------------------------------------------------------
//        title: false, // hides the title.
//        cancelButton: false, // hides the cancel button.
//        confirmButton: false, // hides the confirm button.
//        closeIcon: false, // hides the close icon.
    content: false, // hides content block.
//----------------------------------------------------------------------------------------------------------------------------
//      Custom width
//----------------------------------------------------------------------------------------------------------------------------
//      You can also set responsive layouts.
//        columnClass: 'col-md-4',
        columnClass: 'col-md-4 col-md-offset-4', //(default)
//        columnClass: 'col-md-4 col-md-offset-8 col-xs-4 col-xs-offset-8',
//----------------------------------------------------------------------------------------------------------------------------
//      Icons
//----------------------------------------------------------------------------------------------------------------------------
//        icon: 'glyphicon glyphicon-heart',
    icon: 'fa fa-trash fa-lg c-danger',
    title: 'Sure ? You want to delete !',
//----------------------------------------------------------------------------------------------------------------------------
//      Close icon
//----------------------------------------------------------------------------------------------------------------------------
    closeIcon: true,
    closeIconClass: 'fa fa-close', // or 'glyphicon glyphicon-remove'
//----------------------------------------------------------------------------------------------------------------------------
//      Animations
//----------------------------------------------------------------------------------------------------------------------------
//      Available animations: Different animations can be set for open and close events. 
//      2D : right, left, bottom, top, rotate, none, opacity,
//      3D : scale (default), zoom, scaleY, scaleX, rotateY, rotateYR (reverse), rotateX, rotateXR (reverse)
    animation: 'rotateYR',
    closeAnimation: 'rotateXR',
//----------------------------------------------------------------------------------------------------------------------------
//      Animation bounce
//----------------------------------------------------------------------------------------------------------------------------
    animationBounce: 1.5, // default is 1.2 whereas 1 is no bounce.
//----------------------------------------------------------------------------------------------------------------------------
//      Animation speed
//----------------------------------------------------------------------------------------------------------------------------
    animationSpeed: 500, // 1 seconds
//----------------------------------------------------------------------------------------------------------------------------
//      Themes
//----------------------------------------------------------------------------------------------------------------------------
//       theme: 'white',
         theme: 'black',
//         theme: 'supervan'  //transparent
//         theme: 'material',
//         theme: 'bootstrap'
//----------------------------------------------------------------------------------------------------------------------------
//      Auto close
//----------------------------------------------------------------------------------------------------------------------------
    autoClose: 'cancel|9000',
//        autoClose: 'confirm|10000',
//----------------------------------------------------------------------------------------------------------------------------
//      Keyboard actions
//----------------------------------------------------------------------------------------------------------------------------
//      ENTER calls confirm(); & ESC calls cancel();
    keyboardEnabled: true,
//----------------------------------------------------------------------------------------------------------------------------
//      Setting custom keys
//----------------------------------------------------------------------------------------------------------------------------
//      A = 65; B = 66
//        confirmKeys: [65],
//        cancelKeys: [66],
//----------------------------------------------------------------------------------------------------------------------------
//      RTL support
//----------------------------------------------------------------------------------------------------------------------------
//      If you need to show the confirm box in rtl then you should set the rtl option to true. 
    rtl: false
//----------------------------------------------------------------------------------------------------------------------------
});

$('.confirm-reset').confirm({
//----------------------------------------------------------------------------------------------------------------------------
//      Title & Content
//----------------------------------------------------------------------------------------------------------------------------
//        title: 'Are you sure ? You want to Reset all value !',
//        title: 'Are you sure !',
//        content: 'You want to reset all value !',
//----------------------------------------------------------------------------------------------------------------------------
//      Button text
//----------------------------------------------------------------------------------------------------------------------------
    confirmButton: 'Yes',
    cancelButton: 'No',
//----------------------------------------------------------------------------------------------------------------------------
//      Button style
//----------------------------------------------------------------------------------------------------------------------------
//      Available bootstrap options are : btn-primary btn-inverse btn-warning btn-info btn-danger btn-success
    confirmButtonClass: 'btn-warning',
    cancelButtonClass: 'btn-success',
//----------------------------------------------------------------------------------------------------------------------------
//      Hide elements
//----------------------------------------------------------------------------------------------------------------------------
//        title: false, // hides the title.
//        cancelButton: false, // hides the cancel button.
//        confirmButton: false, // hides the confirm button.
//        closeIcon: false, // hides the close icon.
    content: false, // hides content block.
//----------------------------------------------------------------------------------------------------------------------------
//      Custom width
//----------------------------------------------------------------------------------------------------------------------------
//      You can also set responsive layouts.
//        columnClass: 'col-md-4',
        columnClass: 'col-md-4 col-md-offset-4', //(default)
//        columnClass: 'col-md-4 col-md-offset-8 col-xs-4 col-xs-offset-8',
//----------------------------------------------------------------------------------------------------------------------------
//      Icons
//----------------------------------------------------------------------------------------------------------------------------
//        icon: 'glyphicon glyphicon-heart',
    icon: 'fa fa-refresh fa-lg c-warning',
    title: 'Sure ? You want to reset !',
//----------------------------------------------------------------------------------------------------------------------------
//      Close icon
//----------------------------------------------------------------------------------------------------------------------------
    closeIcon: true,
    closeIconClass: 'fa fa-close', // or 'glyphicon glyphicon-remove'
//----------------------------------------------------------------------------------------------------------------------------
//      Animations
//----------------------------------------------------------------------------------------------------------------------------
//      Available animations: Different animations can be set for open and close events. 
//      2D : right, left, bottom, top, rotate, none, opacity,
//      3D : scale (default), zoom, scaleY, scaleX, rotateY, rotateYR (reverse), rotateX, rotateXR (reverse)
    animation: 'rotateYR',
    closeAnimation: 'rotateXR',
//----------------------------------------------------------------------------------------------------------------------------
//      Animation bounce
//----------------------------------------------------------------------------------------------------------------------------
    animationBounce: 1.5, // default is 1.2 whereas 1 is no bounce.
//----------------------------------------------------------------------------------------------------------------------------
//      Animation speed
//----------------------------------------------------------------------------------------------------------------------------
    animationSpeed: 500, // 1 seconds
//----------------------------------------------------------------------------------------------------------------------------
//      Themes
//----------------------------------------------------------------------------------------------------------------------------
    theme: 'white',
//         theme: 'black',
//         theme: 'supervan'  //transparent
//         theme: 'material',
//         theme: 'bootstrap'
//----------------------------------------------------------------------------------------------------------------------------
//      Auto close
//----------------------------------------------------------------------------------------------------------------------------
    autoClose: 'cancel|9000',
//        autoClose: 'confirm|10000',
//----------------------------------------------------------------------------------------------------------------------------
//      Keyboard actions
//----------------------------------------------------------------------------------------------------------------------------
//      ENTER calls confirm(); & ESC calls cancel();
    keyboardEnabled: true,
    confirm: function(){
        //$.confirm('Confirm..')
        //$('#form_id').trigger("reset");
        //$('#form_id').submit();
        //$(this).closest('form').find("button[type=reset]").trigger();
        //$(this).closest('form').find("button[type=reset]").trigger("reset");
        //$(this).closest('form').find("input[type=text], textarea").val("");
        //$("#myform").find('input:text, input:password, input:file, select, textarea').val('');
        //$("#myform").find('input:radio, input:checkbox').removeAttr('checked').removeAttr('selected');
    },
//----------------------------------------------------------------------------------------------------------------------------
//      Setting custom keys
//----------------------------------------------------------------------------------------------------------------------------
//      A = 65; B = 66
//        confirmKeys: [65],
//        cancelKeys: [66],
//----------------------------------------------------------------------------------------------------------------------------
//      RTL support
//----------------------------------------------------------------------------------------------------------------------------
//      If you need to show the confirm box in rtl then you should set the rtl option to true. 
    rtl: false
//----------------------------------------------------------------------------------------------------------------------------
});



$.confirmDialog = function (options, option2) {
    if (typeof options === "undefined") {
        options = {};
    }
    if (typeof options === "string") {
        options = {content: options, title: (option2) ? option2 : false};
    }
    options.cancelButton = false;
    // options.confirmButton = false;
    options.confirmButton = 'OK';
//      Available bootstrap options are : btn-primary btn-inverse btn-warning btn-info btn-danger btn-success
    options.confirmButtonClass = 'btn-danger';
    // options.closeIcon = true; // hides the close icon.
    // options.title = options.content;


    options.confirmKeys = [13];
    return jconfirm(options);
};

$('.confirm-dialog').confirm({
//----------------------------------------------------------------------------------------------------------------------------
//      Title & Content
//----------------------------------------------------------------------------------------------------------------------------
//        title: 'Are you sure ? You want to delete !',
//        content: 'You want to delete !',
//----------------------------------------------------------------------------------------------------------------------------
//      Button text
//----------------------------------------------------------------------------------------------------------------------------
    confirmButton: 'Yes i agree',
    cancelButton: 'No Never !',
//----------------------------------------------------------------------------------------------------------------------------
//      Button style
//----------------------------------------------------------------------------------------------------------------------------
//      Available bootstrap options are : btn-primary btn-inverse btn-warning btn-info btn-danger btn-success
    confirmButtonClass: 'btn-danger',
    cancelButtonClass: 'btn-success',
//----------------------------------------------------------------------------------------------------------------------------
//      Hide elements
//----------------------------------------------------------------------------------------------------------------------------
//        title: false, // hides the title.
//        cancelButton: false, // hides the cancel button.
//        confirmButton: false, // hides the confirm button.
//        closeIcon: false, // hides the close icon.
    content: false, // hides content block.
//----------------------------------------------------------------------------------------------------------------------------
//      Custom width
//----------------------------------------------------------------------------------------------------------------------------
//      You can also set responsive layouts.
//        columnClass: 'col-md-4',
    columnClass: 'col-md-4 col-md-offset-4', //(default)
//        columnClass: 'col-md-4 col-md-offset-8 col-xs-4 col-xs-offset-8',
//----------------------------------------------------------------------------------------------------------------------------
//      Icons
//----------------------------------------------------------------------------------------------------------------------------
//        icon: 'glyphicon glyphicon-heart',
    icon: 'fa fa-trash fa-lg c-danger',
    title: 'Sure ? You want to delete !',
//----------------------------------------------------------------------------------------------------------------------------
//      Close icon
//----------------------------------------------------------------------------------------------------------------------------
    closeIcon: true,
    closeIconClass: 'fa fa-close', // or 'glyphicon glyphicon-remove'
//----------------------------------------------------------------------------------------------------------------------------
//      Animations
//----------------------------------------------------------------------------------------------------------------------------
//      Available animations: Different animations can be set for open and close events.
//      2D : right, left, bottom, top, rotate, none, opacity,
//      3D : scale (default), zoom, scaleY, scaleX, rotateY, rotateYR (reverse), rotateX, rotateXR (reverse)
    animation: 'rotateYR',
    closeAnimation: 'rotateXR',
//----------------------------------------------------------------------------------------------------------------------------
//      Animation bounce
//----------------------------------------------------------------------------------------------------------------------------
    animationBounce: 1.5, // default is 1.2 whereas 1 is no bounce.
//----------------------------------------------------------------------------------------------------------------------------
//      Animation speed
//----------------------------------------------------------------------------------------------------------------------------
    animationSpeed: 500, // 1 seconds
//----------------------------------------------------------------------------------------------------------------------------
//      Themes
//----------------------------------------------------------------------------------------------------------------------------
//       theme: 'white',
    theme: 'black',
//         theme: 'supervan'  //transparent
//         theme: 'material',
//         theme: 'bootstrap'
//----------------------------------------------------------------------------------------------------------------------------
//      Auto close
//----------------------------------------------------------------------------------------------------------------------------
    autoClose: 'cancel|9000',
//        autoClose: 'confirm|10000',
//----------------------------------------------------------------------------------------------------------------------------
//      Keyboard actions
//----------------------------------------------------------------------------------------------------------------------------
//      ENTER calls confirm(); & ESC calls cancel();
    keyboardEnabled: true,
//----------------------------------------------------------------------------------------------------------------------------
//      Setting custom keys
//----------------------------------------------------------------------------------------------------------------------------
//      A = 65; B = 66
//        confirmKeys: [65],
//        cancelKeys: [66],
//----------------------------------------------------------------------------------------------------------------------------
//      RTL support
//----------------------------------------------------------------------------------------------------------------------------
//      If you need to show the confirm box in rtl then you should set the rtl option to true.
    rtl: false
//----------------------------------------------------------------------------------------------------------------------------
});
//============================================================================================================================