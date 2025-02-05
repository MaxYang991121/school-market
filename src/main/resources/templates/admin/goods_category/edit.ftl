<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>${siteName!""}|分类管理-修改物品分类</title>
<#include "../common/header.ftl"/>

</head>
  
<body>
<div class="lyear-layout-web">
  <div class="lyear-layout-container">
    <!--左侧导航-->
    <aside class="lyear-layout-sidebar">
      
      <!-- logo -->
      <div id="logo" class="sidebar-header">
        <a href="index"><img src="/admin/images/logo-sidebar.png" title="${siteName!""}" alt="${siteName!""}" /></a>
      </div>
      <div class="lyear-layout-sidebar-scroll"> 
        <#include "../common/left-menu.ftl"/>
      </div>
      
    </aside>
    <!--End 左侧导航-->
    
    <#include "../common/header-menu.ftl"/>
    
     <!--页面主要内容-->
    <main class="lyear-layout-content">
      
      <div class="container-fluid">
        
        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header"><h4>修改物品分类</h4></div>
              <div class="card-body">
                <form action="add" id="category-add-form" method="post" class="row">
                  <input type="hidden" name="id" value="${goodsCategory.id}">
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">分类icon</span>
                    <input type="file" id="select-file" style="display:none;" onchange="upload('show-picture-img','icon')">
                    <input type="text" readonly="readonly" class="form-control required" id="icon" name="icon" value="${goodsCategory.icon}" placeholder="请上传分类icon" tips="请上传分类icon" />
                  	<span class="input-group-btn">
                      <button class="btn btn-primary" id="add-pic-btn" type="button">点击上传</button>
                    </span>
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">分类名称</span>
                    <input type="text" class="form-control required" id="name" name="name" value="${goodsCategory.name}" placeholder="请输入分类名称" tips="请填写用分类名称" />
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">所属分类</span>
                    <select name="parent.id" class="form-control" id="category">
                    	<#if goodsCategorys??>
                    		<option value="">请选择上级分类</option>
                    		<#list goodsCategorys as gc>
                    		<option value="${gc.id}" <#if goodsCategory.parent??><#if gc.id == goodsCategory.parent.id>selected</#if></#if>>${gc.name}</option>
                    		</#list>
                    	</#if>
                    </select>
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">分类排序</span>
                    <input type="number" class="form-control" id="sort" name="sort" value="${goodsCategory.sort}" />
                  </div>
                  <div class="form-group col-md-12">
                    <button type="button" class="btn btn-primary ajax-post" id="edit-form-submit-btn">确 定</button>
                    <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);return false;">返 回</button>
                  </div>
                </form>
       
              </div>
            </div>
          </div>
          
        </div>
        
      </div>
      
    </main>
    <!--End 页面主要内容-->
  </div>
</div>
<#include "../common/footer.ftl"/>
<script type="text/javascript" src="/admin/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/admin/js/main.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//提交按钮监听事件
	$("#edit-form-submit-btn").click(function(){
		if(!checkForm("category-add-form")){
			return;
		}
		var data = $("#category-add-form").serialize();
		$.ajax({
			url:'edit',
			type:'POST',
			data:data,
			dataType:'json',
			success:function(data){
				if(data.code == 0){
					showSuccessMsg('分类编辑成功!',function(){
						window.location.href = 'list';
					})
				}else{
					showErrorMsg(data.msg);
				}
			},
			error:function(data){
				alert('网络错误!');
			}
		});
	});
	//监听上传图片按钮
	$("#add-pic-btn").click(function(){
		$("#select-file").click();
	});
});

</script>
</body>
</html>