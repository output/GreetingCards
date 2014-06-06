var user_data;
var user_img;

$(function(){


	// 以下為主畫面功能..........................................................
	$('.page-main, .light-cover, #group-logout, #main-pj-edit-board').hide();


	// 點選登入系統..............................................................
	$('#group-login, .page-login-btn').click(function(event) {
		// ok
		login(function(){
			// 載入必要資訊 (使用者照片,名稱)
			$('#myfbname').text(user_data.name);
			get_user_pic(function(){
				$('#myfbimg').attr('src', user_img);
			});

			friends();

			// 顯示主畫面
			$('.page-login').fadeOut(100, function() {
			$('.page-main').fadeIn(100);
			$('#group-logout').show();
			$('#group-login').hide();
			});
		// NO
		},function(){
			alert('登入失敗！');
		});
	});


	/*
	 * FB 登出 ......................................................
	 */
	 $('#group-logout').click(function(event) {

	 	logout(function(){
	 		$('.page-main').fadeOut(100, function() {
	 			$('.page-login').fadeIn(100);
				$('#group-login').show();
				$('#group-logout').hide();
	 		});
	 	});
	 });


	/*
	 * 切換畫面 Event............................................................. 
	 */
	$('.main-menu-list').click(function(event) {
		var index = $('.main-menu-list').index($(this));
		$('.main-menu-list').removeClass('menu-list-achive');
		$(this).addClass('menu-list-achive');
		$('.main-pj').hide().eq(index).show();

		// 請求新的資料
		switch(index) {
			case 0:
				//$('#main-pj-edit-board').hide();
				//$('#main-pj-menu-board').show();
				break;
			case 1:
				// 我的卡片
				get_my_card();
				break;
			case 2:
				// 我收到的卡片
				get_rec_card();
				break;
		}


	}).eq(0).click();



/* 
 * 2014/06/02 edit------------------------------------------------------------------
 * 以下為賀卡編輯功能---------------------------------------------------------------
 * 
 */
		var main = $('.card-main');
		var undo_text ='';
		var trg ;
		var bg_url = '';
		var bg_color = '';

		// 新增字串..............................................................
		$('#btn-add-text').click(function(event) {
			
			var textcontent = $('<div>').addClass('text-content').text('雙擊我編輯文字！').css({
				color: '#000',
				fontSize: '25px'
			}),
			btn_delete = $('<span>').addClass('btn-delete').text('刪除'),
			btn_cancel = $('<span>').addClass('btn-cancel').text('取消').hide(),
			control_panel = $('<div>').addClass('text-control-panel').append(btn_delete).append(btn_cancel),
			textlabel = $('<div>').addClass('text-label').append(control_panel).append(textcontent).css({
				left: (main.width()/2)-105,
				top : (main.height()/2)-15,
				position:'absolute'
			});

			btn_delete.click(function(event) {
				$(this).parent().parent().remove();
			});

			btn_cancel.click(function(event) {
				$(this).parent().parent().find('.text-content').text(undo_text);
				label_blur();
				done_mode();
			});

			textlabel.draggable()
			.mousedown(function(event){
		     	label_blur();
		     	$(this).find('.text-control-panel').css('visibility', 'visible');
		     	var textcontent = $(this).find('.text-content');
		    	label_focus(textcontent);

		    	trg = textcontent;

		    	// change edit menu data
				$('#card-font-size').val(textcontent.css('font-size'));
				$('#card-font-color').val(textcontent.css('color'));
				$('.card-font-menu').css('visibility', 'visible');
			})
			.resizable()
			.dblclick(function(event) {
				edit_mode($(this));
			});
			main.append(textlabel);
			textlabel.mousedown();
		});

		
		// 點選畫布,失去選擇焦點..............................................
		$('.card-main').click(function(event) {
			if(event.target == this){
				label_blur();
				done_mode();
			}
		});

		// 改變字型大小,顏色..................................................
		$('#card-font-size, #card-font-color').change(function(event) {
			trg.css({
				fontSize: $('#card-font-size').val(),
				color: $('#card-font-color').val()
			});
		});


		// 呼叫改變背景對話框..................................................
		$('#btn-edit-bg').click(function(event) {
			bg_url = $('.card-main').css('background-image');
			bg_color = $('.card-main').css('background-color');
			var display_url = bg_url.substring(4, bg_url.length);
			var url = display_url.substring(0, display_url.length-1);
			$('#url-bg-img').val(url);
			$('#url-bg-color').val(bg_color);

			$('#cover-edit-bg').fadeIn(100);
		});

		// 確定改變背景設定.....................................................
		$('#btn-edit-bg-img').click(function(event) {
			$('.card-main').css({
				backgroundImage: 'url('+$('#url-bg-img').val()+')',
				backgroundColor: $('#url-bg-color').val()
			});
			$('#cover-edit-bg').fadeOut(100);
		});

		// 取消改變背景設定.....................................................
		$('#btn-cancel-bg-img').click(function(event) {
			$('#cover-edit-bg').fadeOut(100);
		});

		// 重設全部 ..............................................................
		$('#btn-clear-all').click(function(event) {
			label_blur();
			done_mode();

			$('.card-main').css({
				backgroundImage: '',
				backgroundColor: '#fff'
			});

			$('.text-label').remove();
		});

		// 呼叫儲存對話框.........................................................
		$('#card-add-btn').click(function(event) {
			$('#card-name').val('我是一張賀卡');
			$('#cover-save-card').fadeIn(100);
		});

		// 取消並關閉儲存對話框...................................................
		$('#btn-cancel-card').click(function(event) {
			$('#cover-save-card').fadeOut(100);
		});


		 /* 確定儲存，並關閉對話框..................................................
		 *
		 * @ POST 一陣列到後端儲存，格式為下
		 * @ [  擁有者 ,
		 		賀卡名稱 , 
		 *		背景圖片網址 , 

		 *		{ left:? , top:? , text:? , color:? , size:? } ,  (賀卡中的字串編成JSON)  
		 *		{ left:? , top:? , text:? , color:? , size:? } ,
		 *	...]
		 *...........................................................................
		 */
		$('#btn-save-card').click(function(event) {

			var card_data = build_card_data();

			$.ajax({
				url: 'save_card.php',
				type: 'POST',
				data: {data: card_data},
			})
			.done(function (response) {
				console.log(response);
			});
			$('#cover-save-card').fadeOut(100);
		});


		// 關閉瀏覽卡片的燈箱.....................................................
		$('#btn-colse-show-card, .icon-colse').click(function(event) {
			$('#cover-show-card').fadeOut(100);
		});


		// 點選範本，關閉範本清單，開啟編輯樣板....................................
		$('.pj-menu-sample').click(function(event) {

			var sample = $(this);

			$('#main-pj-menu-board').fadeOut(100,function(){

				$('#btn-clear-all').click();

				var bgimg = sample.attr('bg');
				var bgcolor = sample.attr('color');

				$('.card-main').css(
				 { backgroundImage:'url('+bgimg+')',
  				   backgroundColor:bgcolor
				 });

				$('#url-bg-img').val(bgimg);
				$('#url-bg-color').val(bgcolor);

				$('#main-pj-edit-board').fadeIn(100);

			});
		});

		// 返回，放棄目前編輯，回到選擇範本清單...................................
		$('#btn-edit-goback').click(function(event) {
			$('#main-pj-edit-board').fadeOut(100, function() {
				$('#main-pj-menu-board').fadeIn(100);
			});
		});

		// 燈箱中的 分頁功能.......................................................
		$('.light-box-tab').click(function(event) {

			var index = $('.light-box-tab').index($(this));

			$('.light-box-tab').removeClass('light-box-tab-achive');
			$(this).addClass('light-box-tab-achive');
			$('.light-box-tab-content').hide();
			$('.light-box-tab-content').eq(index).show();
			
		});


		// 按下分享給好友卡片.......................................................
		$('#btn-share-friends').click(function(event) {

			var btn = $(this);
			var data_arr = [];
			var cardid = btn.attr('cardid');
			var list = $('.myfb-friends-achive');

			btn.attr('disabled', '');

			// 組成陣列後傳送 > 格式:[卡片id,好友1,好友2,好友3,...]
			data_arr.push(cardid);
			for(var i=0;i<list.length;i++)
				data_arr.push(list.eq(i).attr('fbid'));

			$.ajax({
				url: 'save_card_share.php',
				type: 'post',
				data: {data : data_arr},
			})
			.done(function (response) {
				if(response.split('-')[0]=='error') alert('分享失敗');
				else alert('分享成功');
				btn.removeAttr('disabled');
			});
		});


		// 各種編輯行為函式.......................................................
		function label_focus(ele){
			ele.css('border', 'solid 2px #666');
		}

		function label_blur(){
			$(".text-control-panel").css('visibility', 'hidden');
			$(".text-content").css('border', 'solid 2px rgba(0,0,0,0)');
		}
		
		function edit_mode(ele){
			
			ele.draggable({ disabled: true });
			txtcontent = ele.find('.text-content');
			undo_text = txtcontent.text();
			txtcontent.attr('contenteditable', 'true').focus();
			txtcontent.selectText();
			show_done_or_cancel(ele);
		}

		function done_mode(){
			$('.text-label').draggable({ disabled: false });
			$('.text-content').attr('contenteditable', 'false');
			$('.btn-delete').show();
			$('.btn-cancel').hide();

			$('.card-font-menu').css('visibility', 'hidden');
		}

		function show_done_or_cancel(ele){
			father = ele.find('.text-control-panel');
			father.find('.btn-cancel').show();
			father.find('.btn-delete').hide();
		}

		// 組合陣列準備傳送.................................................
		function build_card_data(){
			var data = [];

			var num = $('.text-label').length;
			var card_name  = $('#card-name').val();
			var card_url  = $('#url-bg-img').val();
			var card_bgcolor = $('#url-bg-color').val();
			data.push(user_data.id);
			data.push(card_name);
			data.push(card_url);
			data.push(card_bgcolor);

			//{ left:? , top:? , text:? , color:? , size:? } 
			for(var i=0;i<num;i++){

				var textlabel = $('.text-label').eq(i),
					textcontent = textlabel.find('.text-content'),
					left = textlabel.css('left'),
					top = textlabel.css('top'),
					text = textcontent.text(),
					color = textcontent.css('color'),
					size = textcontent.css('font-size'),
					width = textlabel.width(),
					height = textlabel.height() ,
					obj ={left:left , top:top , text:text , color:color , size:size ,width:width,height:height};

				data.push(obj);
			}
			return data;
		}

		// 取的我的卡片資料並顯示.........................................
		function get_my_card(){

			$.ajax({
				url: 'getmycard.php',
				type: 'get',
				data: {id: user_data.id},
				dataType:'json'
			})
			.done(function (data) {

				var cardlist = $('#card-list');
				cardlist.html('');
				/* 組成結構
				<div class="pj-list-box">
					<div class="pj-list-box-img"></div>
					<div class="pj-list-box-name">我是一張賀卡</div>
				</div>
				*/
				for(var i=0;i<data.length;i++){
				
				var boxname = $('<div>').addClass('pj-list-box-name').text(data[i]['name']),
					
					boximg = $('<div>').addClass('pj-list-box-img').css(
					{backgroundImage: 'url('+data[i]['bgurl']+')',
					 backgroundColor: data[i]['bgcolor']
					}),

					listbox = $('<div>').addClass('pj-list-box').attr(
					{cardid : data[i]['id'],
					 name : data[i]['name'],
					 bgurl : data[i]['bgurl'],
					 bgcolor : data[i]['bgcolor'],
				    }).append(boximg).append(boxname);	

				listbox.click(function(event) {
					get_card_obj( $(this) , true);
				});

 				cardlist.append(listbox);

				}
			});
		}

		// 取得某張特定卡片所有內容物件並顯示.............................
		// boo為true 是自己的卡片，可以分享
		// boo為false為收到的卡片，不可分享

		function get_card_obj(ele,boo){

			var cardid = ele.attr('cardid'),
				name = ele.attr('name'),
				bgurl = ele.attr('bgurl'),
				bgcolor = ele.attr('bgcolor'),
				owner = ele.attr('owner');

			$.ajax({
				url: 'getcardobj.php',
				type: 'get',
				dataType: 'json',
				data: {id: cardid},
			})
			.done(function(data) {

				$('.text-label2').remove();

				var main2 = $('.card-main2');
				main2.css({
					backgroundColor: bgcolor,
					backgroundImage: 'url('+bgurl+')'
				});
				for(var i=0;i<data.length;i++){

					 var textcontent = $('<div>').addClass('text-content').text(data[i]['text']).css({
						color: data[i]['color'],
						fontSize: data[i]['size'],
						width:data[i]['width'],
						height:data[i]['height']
					}),
					textlabel = $('<div>').addClass('text-label2').append(textcontent).css({
						left: data[i]['left'],
						top : data[i]['top'],
						position:'absolute'
					});

					main2.append(textlabel);
				}

				// --------------------------------------------------------------------
				/* 抓取該張卡片要分享給那些好友，顯示到前端
					<div class="myfb-friends" fbid="210000000">
						<img class="myfb-friends-pic" src="">
						<div class="myfb-friends-name">AAAAA</div>
					</div>
				--------------------------------------------------------------------*/
				$('#btn-share-friends').attr('cardid', cardid);
				$('#show-card-name').text(name);
				$('.myfb-friends').removeClass('myfb-friends-achive');

				// 取得已經分享的好友列表，反映到前端
				if(boo){

				$.ajax({
					url: 'get_card_share.php',
					type: 'get',
					dataType: 'json',
					data: {id: cardid},
				})
				.done(function(r) {
					for(var i = 0 ; i < r.length ; i++)
						$('.myfb-friends[fbid="'+r[i].fbid+'"]').addClass('myfb-friends-achive');
					
				});

					$('#light-box-tab-box').show();
					$('#light-box-sender-box').hide();
				}
				else {
					append_sender_info(owner);
					$('#light-box-sender-box').show();
					$('#light-box-tab-box').hide();
				}
				card_show_lightbox();
			});	
		}

		// 顯示並設定 展示卡片的燈箱..................................................
		function card_show_lightbox(){
			$('.light-box-tab:eq(0)').click();
			$('#cover-show-card').fadeIn(100);
		}

		// 取得我收到的卡片資料，並顯示.................................................
		function get_rec_card(){
			$.ajax({
				url: 'get_rec_card.php',
				type: 'get',
				data: {id: user_data.id},
				dataType:'json'
			})
			.done(function (data) {

				console.log(data);

				var cardlist = $('#card-rec-list');
				cardlist.html('');


				/* 組成結構
				<div class="pj-list-box">
					<div class="pj-list-box-img"></div>
					<div class="pj-list-box-name">我是一張賀卡</div>
				</div>
				*/
				for(var i=0;i<data.length;i++){
				
				var boxname = $('<div>').addClass('pj-list-box-name').text(data[i]['name']),
					
					boximg = $('<div>').addClass('pj-list-box-img').css(
					{backgroundImage: 'url('+data[i]['bgurl']+')',
					 backgroundColor: data[i]['bgcolor']
					}),

					listbox = $('<div>').addClass('pj-list-box').attr(
					{cardid : data[i]['id'],
					 name : data[i]['name'],
					 bgurl : data[i]['bgurl'],
					 bgcolor : data[i]['bgcolor'],
					 owner : data[i]['owner']
				    }).append(boximg).append(boxname);	

				listbox.click(function(event) {
					get_card_obj( $(this) , false);
				});

 				cardlist.append(listbox);

				} 
			});
		}

	// 取得並顯示贈與卡片者的照片與姓名........................................................
	function append_sender_info(id){
		FB.api("/"+id,
		function (response) {
			if (response && !response.error) {
				$('#sender-pic').attr('src', 'https://graph.facebook.com/'+id+'/picture');
				$('#sender-name').text(response.name);
			}
		});		
	}






	/*----------------------------------------------------------------------------------------
	* @下面為 FB Method
	* @2014/06/04
	------------------------------------------------------------------------------------------*/
	  window.fbAsyncInit = function() {
        FB.init({
          appId      : '1382733725313090',
          status     : true,
          xfbml      : true
        });
      };

      (function(d, s, id){
         var js, fjs = d.getElementsByTagName(s)[0];
         if (d.getElementById(id)) {return;}
         js = d.createElement(s); js.id = id;
         js.src = "//connect.facebook.net/en_US/all.js";
         fjs.parentNode.insertBefore(js, fjs);
       }(document, 'script', 'facebook-jssdk'));


     function friends(){
     	// get user pic : https://graph.facebook.com/ fb_id /picture
     	/* box > #myfb-friendsbox
		<div class="myfb-friends" fbid="210000000">
			<img class="myfb-friends-pic" src="">
			<div class="myfb-friends-name">AAAAA</div>
		</div>
     	*/
     	FB.api("/me/friends",
		    function (response) {

		      if (response && !response.error) {

		       	var flist = response.data;
		       	var friendsbox = $('#myfb-friendsbox'); 

		       	for(var i=0;i<flist.length;i++){

		       		var pic_url = 'https://graph.facebook.com/'+flist[i].id+'/picture',
		       			fimg = $('<img>').addClass('myfb-friends-pic').attr('src', pic_url),
		       			fname= $('<div>').addClass('myfb-friends-name').text(flist[i].name),
		       			ftab = $('<div>').addClass('myfb-friends').attr({fbid:flist[i].id})
		       			.append(fimg).append(fname);    
		       		ftab.click(function(event) {
		       			$(this).toggleClass('myfb-friends-achive');
		       		});
		       		friendsbox.append(ftab);

		       	}//for end

		      }// if end

		    });

     }
     
      function login(ok,no){

      	 FB.login(function(response) {
		   if (response.authResponse) {
		     console.log('Logined!!!');
		     FB.api('/me', function(response) {
		       // console.log('ME:', response);
		       user_data = response;
		       ok();
		     });
		   } else {
		     console.log('User cancelled login or did not fully authorize.');
		     no();
		   }
		 },{scope: 'user_friends'});
      }

      function logout(ok){
      	FB.logout(function(response) {
		  ok();
		});
      }

      function get_user_pic(ok){
	       	FB.api(
			    "/me/picture",
			    function (response) {
			      if (response && !response.error) {
			      	user_img = response.data.url;
			      	ok();
			      }
			    }
			);
       }





    


});