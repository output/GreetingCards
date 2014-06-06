<!DOCTYPE html>
<html>
<head>
	<title>Greeting Cards</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="font-awesome-4.1.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/ui-lightness/jquery-ui-1.10.4.custom.min.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<script src="js/jquery.js"></script>
	<script src="js/jquery-ui.js"></script>
	<script src="js/jquery-select.js"></script>
	<script src="js/main.js"></script>
</head>

<body>
<img src="img/cover.jpg" style="display:none">
<div class="header">
	<div class="center"><h1>Greeting Cards</h1>
		<div class="header-group" id="group-login">
			<span><i class="fa fa-sign-in"></i> 登入</span>
		</div>
		<div class="header-group" id="group-logout">
			<span><i class="fa fa-sign-out"></i> 登出</span>
		</div>
	</div>
</div>



<div class="content">
	<div class="page page-login">
	<div class="center">
		<div class="page-login-title">Expressing Wish Anytime！</div>
		<div class="page-login-area">
		<div class="page-login-btn"><i class="fa fa-facebook"> </i> 使用 facebook 登入</div>
		</div>
	</div>
	</div>

	
	<div class="page page-main">
	<div class="center2">
		<div class="main-menu">

			<div class="main-pofile">
				<img class="main-pofile-img" id='myfbimg'>
				<span class="main-pofile-name">Welcome,<br><span id="myfbname">張三</span></span>
			</div>
			
			<div class="main-menu-list"><i class="fa fa-plus"></i> 新增賀卡</div>
			<div class="main-menu-list"><i class="fa fa-picture-o"></i> 我的賀卡</div>
			<div class="main-menu-list"><i class="fa fa-files-o"></i> 收到的賀卡</div>

		</div>
		<div class="main-content">

			<div class="main-pj" id="pj-add">

				<h1 class="pj-title">新增賀卡</h1>
				<br>
				
				<div id="main-pj-menu-board">
					<!-- 新增一個空白範本 -->
					<div class="pj-menu-sample pj-list-box" bg="" color="#fff">
						<div class="pj-list-box-img" style="background-color:#FFF"></div>
						<div class="pj-list-box-name">空白賀卡</div>
					</div>
					<!-- 萬聖節範本 -->
					<div class="pj-menu-sample pj-list-box" bg="img/hallowen.png" color="#000">
						<div class="pj-list-box-img" style="background-image: url('img/hallowen.png');"></div>
						<div class="pj-list-box-name">範本1</div>
					</div>
					<!-- 耶誕節範本 -->
					<div class="pj-menu-sample pj-list-box" bg="img/christmas.png" color="#FF9966">
						<div class="pj-list-box-img" style="background-image: url('img/christmas.png');"></div>
						<div class="pj-list-box-name">範本2</div>
					</div>
				</div>

				<br>


				<div id="main-pj-edit-board">
					<button id="card-add-btn" class="card-add-btn">儲存</button>
					<button id="btn-add-text" class="card-add-btn" >新增字串</button>
					<button id="btn-edit-bg" class="card-add-btn">修改背景</button>
					<button id="btn-clear-all" class="card-add-btn">全部重設</button>
					<button id="btn-edit-goback" class="card-add-btn">返回</button>
					<div class="card-font-menu">
						大小：<input type="text" value="12" id="card-font-size">
						顏色：<input type="text" value="#FFF" id="card-font-color">
						<span class="card-font-menu-hint">(修改後按 Enter)</span>
					</div>
					<div class="card-main"></div>
				</div>


			</div>


			<div class="main-pj" id="pj-my" >
				<h1 class="pj-title">我的賀卡</h1>
				<div class="card-list" id="card-list"></div>
			</div>


			<div class="main-pj" id="pj-rec">
				<h1 class="pj-title">收到的賀卡</h1>
				<div class="card-list" id="card-rec-list"></div>
			</div>



		</div>
	</div>
	</div>


</div>



<div class="footer">
<div class="center">Copyright © 2014 <a href="https://www.facebook.com/demonzap" target="_blank">Zap</a> Inc. All rights reserved</div>
</div>


<!-- 以下內容不會顯示 -->

<!-- Cover -->
<div class="light-cover" id="cover-edit-bg">
	<div class="light-box">
		<h1>修改背景</h1><br>
		<p>圖片網址</p>
		<input type="text" value="img/hellow.png" id="url-bg-img" class="url-bg-img"><br><br>
		<p>背景顏色</p>
		<input type="text" value="#DDD" id="url-bg-color" class="url-bg-img"><br><br><br>
		<button class="light-box-btn" id="btn-cancel-bg-img">取消</button> 
		<button class="light-box-btn" id="btn-edit-bg-img">確定</button> 	
	</div>
</div>

<!-- Cover -->
<div class="light-cover" id="cover-save-card">
	<div class="light-box">
		<h1>儲存</h1><br>
		<p>賀卡名稱</p>
		<input type="text" value="我的賀卡" id="card-name" class="url-bg-img"><br><br>
		<button class="light-box-btn" id="btn-cancel-card">取消</button> 
		<button class="light-box-btn" id="btn-save-card">確定</button> 	
	</div>
</div>


<!-- Cover -->
<div class="light-cover" id="cover-show-card">
	<div class="light-box">
		<h1 id="show-card-name">我是一張賀卡</h1>
		<i class="fa fa-times icon-colse"></i>
		
		<!-- Tab -->
		<div class="light-box-tab-box" id="light-box-tab-box">
			<span class="light-box-tab">檢視</span>
			<span class="light-box-tab">分享</span>
		</div>

		<!-- Tab : Display Sender -->
		<div class="light-box-tab-box" id="light-box-sender-box">
			卡片作者：
			<img class="myfb-friends-pic" src="" id="sender-pic">
			<div class="myfb-friends-name" id="sender-name"></div>
		</div>

		<!-- Page1 -->
		<div class="light-box-tab-content">
			<div class="card-main2"></div>
			<button class="light-box-btn" disabled>編輯(即將推出)</button>
			<button class="light-box-btn" id="btn-colse-show-card">關閉</button> 	
		</div>

		<!-- Page2 -->
		<div class="light-box-tab-content">
			<div id="myfb-friendsbox"></div>
			<span>(被選擇的好友，可以看到您的卡片) </span>
			<button class="light-box-btn" id="btn-share-friends"> 分享 </button>
		</div>
	</div>

</div>



</body>
</html>