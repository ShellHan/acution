 
       function openPwd() {
            $('#w').window({
                title: '修改密码',
                width: 300,
                modal: true,
                shadow: true,
                closed: true,
                height: 200,
                resizable:false
            });
        }
        //关闭登录窗口
        function closePwd() {
            $('#w').window('close');
        }

        //修改密码
        function serverLogin() {
            var $workerName = $('#workerName');
            var $newpass = $('#txtNewPass');
            var $rePass = $('#txtRePass');
            var $old =   $('txtOldPass');
            if ($newpass.val() == '') {
                msgShow('系统提示', '请输入密码！', 'warning');
                return false;
            }
            if ($rePass.val() == '') {
                msgShow('系统提示', '请再一次输入密码！', 'warning');
                return false;
            }

            if ($newpass.val() != $rePass.val()) {
                msgShow('系统提示', '两次密码不一至！请重新输入', 'warning');
                return false;
            }
          
            document.forms[0].submit();
            
        }

        $(function() {

            openPwd();
            
            $('#editpass').click(function() {
                $('#w').window('open');
            });

            $('#btnEp').click(function() {
                serverLogin();
            })

			$('#btnCancel').click(function(){closePwd();})

            $('#loginOut').click(function() {
                $.messager.confirm('系统提示', '您确定要退出本次登录吗?', function(r) {

                    if (r) {
                        location.href = 'login.jsp';
                    }
                });
            })
        });
var _menus = {"menus":[
						
						{"menuid":"1","icon":"icon-sys","menuname":"管理员信息管理","menus":[
						             {"menuid":"11","menuname":"管理员信息","icon":"icon-users","url":"mag-listManager"},
						             {"menuid":"12","menuname":"添加管理员信息","icon":"icon-users","url":"manager/addmanager.jsp"}                         								
						]},   
						{"menuid":"2","icon":"icon-sys","menuname":"用户信息","menus":[
						             {"menuid":"21","menuname":"用户信息","icon":"icon-users","url":"user-listUsers"}					
						]},
						{"menuid":"3","icon":"icon-sys","menuname":"拍卖信息管理","menus":[
							        {"menuid":"41","menuname":"添加拍卖信息","icon":"icon-users","url":"fileinfo/addFileinfo.jsp"},
							        {"menuid":"43","menuname":"拍卖信息列表","icon":"icon-users","url":"fileinfo-getAllFile"}					
						]},
						{"menuid":"4","icon":"icon-sys","menuname":"公告信息管理","menus":[
						            {"menuid":"51","menuname":"公告信息","icon":"icon-users","url":"ann-listAnns"},
						            {"menuid":"52","menuname":"添加公告信息","icon":"icon-users","url":"announce/addAnnounce.jsp"}					
						]}
				]};

$(function(){
	InitLeftMenu();
	tabClose();
	tabCloseEven();




	$('#tabs').tabs({
        onSelect: function (title) {
            var currTab = $('#tabs').tabs('getTab', title);
            var iframe = $(currTab.panel('options').content);

			var src = iframe.attr('src');
			if(src)
				$('#tabs').tabs('update', { tab: currTab, options: { content: createFrame(src)} });

        }
    });

})

//初始化左侧
function InitLeftMenu() {
	$("#nav").accordion({animate:false});

    $.each(_menus.menus, function(i, n) {
								//  alert(i);
		var menulist ='';
		var menuid='';
		menuid = n.menuid;
	
		//alert(menuid);
		menulist +='<ul id="'+menuid+'">';
		if(i==0  || i ==1 || i ==2 || i ==3 || i ==4){
		
        $.each(n.menus, function(j, o) {
			menulist += '<li><div><a ref="'+o.menuid+'" href="#" rel="' + o.url + '" ><span class="icon '+o.icon+'" >&nbsp;</span><span class="nav">' + o.menuname + '</span></a></div></li> ';
        })
		
		}
		menulist += '</ul>';
		$('#nav').accordion('add', {
            title: n.menuname,
            content: menulist,
            iconCls: 'icon ' + n.icon,
			
			onSelect:function(){alert(menuid);}
        });
		if(i>10){
		 $("#"+menuid).tree({
				checkbox: false,
				url: 'tree_data.json',
				onClick:function(node){
				//	$(this).tree('toggle', node.target);
				var tabTitle = node.text;
				
       if(node.attributes != null){
		var url = node.attributes["url"];
	   
		var menuid = node.id;
		var icon = node.iconCls;

		addTab(tabTitle,url,icon);
				//	alert('you dbclick '+node.attributes["url"]);
	  
				}
				}
			});
		}

    });

	$('.easyui-accordion li a').click(function(){
		var tabTitle = $(this).children('.nav').text();

		var url = $(this).attr("rel");
		var menuid = $(this).attr("ref");
		
		var icon = getIcon(menuid,icon);

		addTab(tabTitle,url,icon);
		$('.easyui-accordion li div').removeClass("selected");
		$(this).parent().addClass("selected");
	}).hover(function(){
		$(this).parent().addClass("hover");
	},function(){
		$(this).parent().removeClass("hover");
	});

	//选中第一个
	var panels = $('#nav').accordion('panels');
	var t = panels[0].panel('options').title;
    $('#nav').accordion('select', t);
}
//获取左侧导航的图标
function getIcon(menuid){
	var icon = 'icon ';
	$.each(_menus.menus, function(i, n) {
	    if(i==0){							  
		 $.each(n.menus, function(j, o) {
		 	if(o.menuid==menuid){
				icon += o.icon;
			}
		 })
		}
	})

	return icon;
}

function addTab(subtitle,url,icon){
	if(!$('#tabs').tabs('exists',subtitle)){
		$('#tabs').tabs('add',{
			title:subtitle,
			content:createFrame(url),
			closable:true,
			icon:icon
		});
	}else{
		$('#tabs').tabs('select',subtitle);
		$('#mm-tabupdate').click();
	}
	tabClose();
}

function createFrame(url)
{
	var s = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
	return s;
}

function tabClose()
{
	/*双击关闭TAB选项卡*/
	$(".tabs-inner").dblclick(function(){
		var subtitle = $(this).children(".tabs-closable").text();
		$('#tabs').tabs('close',subtitle);
	})
	/*为选项卡绑定右键*/
	$(".tabs-inner").bind('contextmenu',function(e){
		$('#mm').menu('show', {
			left: e.pageX,
			top: e.pageY
		});

		var subtitle =$(this).children(".tabs-closable").text();

		$('#mm').data("currtab",subtitle);
		$('#tabs').tabs('select',subtitle);
		return false;
	});
}
//绑定右键菜单事件
function tabCloseEven()
{
	//刷新
	$('#mm-tabupdate').click(function(){
		var currTab = $('#tabs').tabs('getSelected');
		var url = $(currTab.panel('options').content).attr('src');
		$('#tabs').tabs('update',{
			tab:currTab,
			options:{
				content:createFrame(url)
			}
		})
	})
	//关闭当前
	$('#mm-tabclose').click(function(){
		var currtab_title = $('#mm').data("currtab");
		$('#tabs').tabs('close',currtab_title);
	})
	//全部关闭
	$('#mm-tabcloseall').click(function(){
		$('.tabs-inner span').each(function(i,n){
			var t = $(n).text();
			$('#tabs').tabs('close',t);
		});
	});
	//关闭除当前之外的TAB
	$('#mm-tabcloseother').click(function(){
		$('#mm-tabcloseright').click();
		$('#mm-tabcloseleft').click();
	});
	//关闭当前右侧的TAB
	$('#mm-tabcloseright').click(function(){
		var nextall = $('.tabs-selected').nextAll();
		if(nextall.length==0){
			//msgShow('系统提示','后边没有啦~~','error');
			alert('后边没有啦~~');
			return false;
		}
		nextall.each(function(i,n){
			var t=$('a:eq(0) span',$(n)).text();
			$('#tabs').tabs('close',t);
		});
		return false;
	});
	//关闭当前左侧的TAB
	$('#mm-tabcloseleft').click(function(){
		var prevall = $('.tabs-selected').prevAll();
		if(prevall.length==0){
			alert('到头了，前边没有啦~~');
			return false;
		}
		prevall.each(function(i,n){
			var t=$('a:eq(0) span',$(n)).text();
			$('#tabs').tabs('close',t);
		});
		return false;
	});

	//退出
	$("#mm-exit").click(function(){
		$('#mm').menu('hide');
	})
}

//弹出信息窗口 title:标题 msgString:提示信息 msgType:信息类型 [error,info,question,warning]
function msgShow(title, msgString, msgType) {
	$.messager.alert(title, msgString, msgType);
}
