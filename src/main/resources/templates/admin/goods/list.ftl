<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, goodsCategory-scalable=no" />
<title>${siteName!""}|物品管理-${title!""}</title>
<#include "../common/header.ftl"/>
<style>
td{
	vertical-align:middle;
}
</style>
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
              <div class="card-toolbar clearfix">
                <form class="pull-right search-bar" method="get" action="list" role="form">
                  <div class="input-group">
                    <div class="input-group-btn">
                      <button class="btn btn-default dropdown-toggle" id="search-btn" data-toggle="dropdown" type="button" aria-haspopup="true" aria-expanded="false">
                      	<#if goodsCategoryName??>分类名称<#elseif sn??>学生学号<#elseif name??>物品名称<#else>搜索条件</#if> <span class="caret"></span>
                      </button>
                      <ul class="dropdown-menu">
                        <li> <a tabindex="-1" href="javascript:void(0)" data-field="name">物品名称</a> </li>
                        <li> <a tabindex="-1" href="javascript:void(0)" data-field="student.sn">学生学号</a> </li>
                        <li> <a tabindex="-1" href="javascript:void(0)" data-field="goodsCategory.name">分类名称</a> </li>
                      </ul>
                    </div>
                    <input type="text" class="form-control" value="${name!sn!goodsCategoryName!""}" id="search-value" name="<#if goodsCategoryName??>goodsCategory.name<#elseif sn??>student.sn<#else>name</#if>" placeholder="请输入搜索值">
                  	<span class="input-group-btn">
                      <button class="btn btn-primary" type="submit">搜索</button>
                    </span>
                  </div>
                </form>
                <#include "../common/third-menu.ftl"/>
              </div>
              <div class="card-body">
                
                <div class="table-responsive">
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th>
                          <label class="lyear-checkbox checkbox-primary">
                            <input type="checkbox" id="check-all"><span></span>
                          </label>
                        </th>
                        <th>图片</th>
                        <th>名称</th>
                        <th>发布者(学号)</th>
                        <th>分类</th>
                        <th>售价</th>
                        <th>浏览量</th>
                        <th>状态</th>
                        <th>是否擦亮</th>
                        <th>是否推荐</th>
                        <th>添加时间</th>
                      </tr>
                    </thead>
                    <tbody>
                      <#if pageBean.content?size gt 0>
                      <#list pageBean.content as goods>
                      <tr>
                        <td style="vertical-align:middle;">
                          <label class="lyear-checkbox checkbox-primary">
                            <input type="checkbox" name="ids[]" value="${goods.id}"><span></span>
                          </label>
                        </td>
                        <td style="vertical-align:middle;">
                        	<a href="/home/goods/detail?id=${goods.id}" target="_blank">
                        	<img src="/photo/view?filename=${goods.photo}" width="30px" height="30px">
                       		</a>
                        </td>
                        <td style="vertical-align:middle;">
                        	<a href="/home/goods/detail?id=${goods.id}" target="_blank">${goods.name}</a>
                        </td>
                        <td style="vertical-align:middle;">
                        	${goods.student.sn}
                        </td>
                        <td style="vertical-align:middle;">
                        ${goods.goodsCategory.name}
                        </td>
                        <td style="vertical-align:middle;">
                        ${goods.sellPrice}
                        </td>
                        <td style="vertical-align:middle;">
                        ${goods.viewNumber}
                        </td>
                        <td style="vertical-align:middle;">
                        	<#if goods.status == 1>正在出售
                        	<#elseif goods.status == 2>下架
                        	<#else>已出售
                        	</#if>
                        </td>
                        <td style="vertical-align:middle;">
                        	<#if goods.flag == 1><font class="text-success">是</font>
                        	<#else>否
                        	</#if>
                        </td>
                        <td style="vertical-align:middle;">
                        	<#if goods.recommend == 1><font class="text-success">是</font>
                        	<#else>否
                        	</#if>
                        </td>
                        <td style="vertical-align:middle;" style="vertical-align:middle;"><font class="text-success">${goods.createTime}</font></td>
                      </tr>
                    </#list>
                    <#else>
                    <tr align="center"><td colspan="11">这里空空如也！</td></tr>
					</#if>
                    </tbody>
                  </table>
                </div>
                <#if pageBean.total gt 0>
                <ul class="pagination ">
                  <#if pageBean.currentPage == 1>
                  <li class="disabled"><span>«</span></li>
                  <#else>
                  <li><a href="list?<#if goodsCategoryName??>goodsCategory.name<#elseif sn??>student.sn<#else>name</#if>=${name!sn!goodsCategoryName!""}&currentPage=1">«</a></li>
                  </#if>
                  <#list pageBean.currentShowPage as showPage>
                  <#if pageBean.currentPage == showPage>
                  <li class="active"><span>${showPage}</span></li>
                  <#else>
                  <li><a href="list?<#if goodsCategoryName??>goodsCategory.name<#elseif sn??>student.sn<#else>name</#if>=${name!sn!goodsCategoryName!""}&currentPage=${showPage}">${showPage}</a></li>
                  </#if>
                  </#list>
                  <#if pageBean.currentPage == pageBean.totalPage>
                  <li class="disabled"><span>»</span></li>
                  <#else>
                  <li><a href="list?<#if goodsCategoryName??>goodsCategory.name<#elseif sn??>student.sn<#else>name</#if>=${name!sn!goodsCategoryName!""}&currentPage=${pageBean.totalPage}">»</a></li>
                  </#if>
                  <li><span>共${pageBean.totalPage}页,${pageBean.total}条数据</span></li>
                </ul>
                </#if>
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
	$(".dropdown-menu li a").click(function(){
		$("#search-btn").html($(this).text() + '<span class="caret"></span>');
		$("#search-value").attr('name',$(this).attr('data-field'));
	});
});
function del(url){
	if($("input[type='checkbox']:checked").length != 1){
		showWarningMsg('请选择一条数据进行删除！');
		return;
	}
	var id = $("input[type='checkbox']:checked").val();
	$.confirm({
        title: '确定删除？',
        content: '删除后数据不可恢复，请慎重！',
        buttons: {
            confirm: {
                text: '确认',
                action: function(){
                    deleteReq(id,url);
                }
            },
            cancel: {
                text: '关闭',
                action: function(){
                    
                }
            }
        }
    });
}
//上架
function up(url){
	if($("input[type='checkbox']:checked").length != 1){
		showWarningMsg('请选择一条数据进行上架！');
		return;
	}
	var id = $("input[type='checkbox']:checked").val();
	ajaxRequest('up_down','post',{id:id,status:1},function(){
		alert('上架成功');
		window.location.reload();
	});
}
//下架
function down(url){
	if($("input[type='checkbox']:checked").length != 1){
		showWarningMsg('请选择一条数据进行下架！');
		return;
	}
	var id = $("input[type='checkbox']:checked").val();
	ajaxRequest('up_down','post',{id:id,status:2},function(){
		alert('下架成功');
		window.location.reload();
	});
}
//推荐
function recommend(url){
	if($("input[type='checkbox']:checked").length != 1){
		showWarningMsg('请选择一条数据进行推荐！');
		return;
	}
	var id = $("input[type='checkbox']:checked").val();
	ajaxRequest('recommend','post',{id:id,recommend:1},function(){
		alert('推荐成功');
		window.location.reload();
	});
}
//推荐
function unrecommend(url){
	if($("input[type='checkbox']:checked").length != 1){
		showWarningMsg('请选择一条数据进行取消推荐！');
		return;
	}
	var id = $("input[type='checkbox']:checked").val();
	ajaxRequest('recommend','post',{id:id,recommend:0},function(){
		alert('取消推荐成功');
		window.location.reload();
	});
}
//调用删除方法
function deleteReq(id,url){
	$.ajax({
		url:url,
		type:'POST',
		data:{id:id},
		dataType:'json',
		success:function(data){
			if(data.code == 0){
				showSuccessMsg('物品删除成功!',function(){
					$("input[type='checkbox']:checked").parents("tr").remove();
				})
			}else{
				showErrorMsg(data.msg);
			}
		},
		error:function(data){
			alert('网络错误!');
		}
	});
}
</script>
</body>
</html>