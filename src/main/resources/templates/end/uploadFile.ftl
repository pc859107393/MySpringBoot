<!DOCTYPE html>

<html lang="en">
<head>
    <title>文件上传</title>
<#include "../_inc/_header.ftl"/>
    <link rel="stylesheet" href="../static/css/dropzone.css"/>
</head>
<body>

<div class="page-content">

    <div class="row">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->

            <div id="dropzone">
                <form action="../endSys/uploadFile" class="dropzone" method="post">
                    <div class="fallback">
                        <input name="upfile" type="file" multiple=""/>
                    </div>
                </form>
            </div><!-- PAGE CONTENT ENDS -->
        </div><!-- /.col -->
    </div><!-- /.row -->
</div><!-- /.page-content -->

</body>

<#include "../_inc/_footer.ftl"/>

<script src="../static/js/dropzone.min.js"></script>
<script type="text/javascript">
    jQuery(function ($) {
        try {
            Dropzone.autoDiscover = false;//防止报"Dropzone already attached."的错误
            $(".dropzone").dropzone({
                paramName: "upfile", // The name that will be used to transfer the file
                maxFilesize: 1024, // MB
                addRemoveLinks: true,
                method: 'post',
                dictRemoveLinks: "x",
                dictCancelUpload: "x",
                init: function () {
                    this.on("success", function (data) {
                        console.log("success：\n " + jQuery.parseJSON(data));
                    });
                    this.on("removedfile", function (data) {
                        console.log("File " + data);
                    });
                },
                dictDefaultMessage: '<span class="bigger-150 bolder"><i class="icon-caret-right red"></i> 拖拽文件上传</span><span class="smaller-80 grey">(或者点击上传)</span> <br/><i class="upload-icon icon-cloud-upload blue icon-3x"></i>'
                ,
                dictResponseError: '上传文件失败!',
                dictFileTooBig: '文件过大！请上传在1G内的文件！',

                //change the previewTemplate to use Bootstrap progress bars
                previewTemplate: "<div class=\"dz-preview dz-file-preview\"><div class=\"dz-details\"><div class=\"dz-filename\"><span data-dz-name></span></div><div class=\"dz-size\" data-dz-size></div><img data-dz-thumbnail /></div><div class=\"progress progress-small progress-striped active\"><div class=\"progress-bar progress-bar-success\" data-dz-uploadprogress></div></div><div class=\"dz-success-mark\"><span></span></div><div class=\"dz-error-mark\"><span></span></div><div class=\"dz-error-message\"><span data-dz-errormessage></span></div></div>"
            });
        } catch (e) {
            alert('Dropzone.js 不支持在较老的浏览器使用!');
        }

    });
</script>
</html>