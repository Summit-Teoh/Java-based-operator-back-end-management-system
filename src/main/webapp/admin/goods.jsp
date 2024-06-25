<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 引入JSTL标签库，用来遍历展示数据 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>商品管理</title>
	<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
	<link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="plugins/adminLTE/css/AdminLTE.css">
	<link rel="stylesheet" href="plugins/adminLTE/css/skins/_all-skins.min.css">
	<link rel="stylesheet" href="css/style.css">
	<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="plugins/bootstrap/js/bootstrap.min.js"></script>

	<script>
		function toUpdate(id, name, seller, status, category, price) {
			document.getElementById("id").value = id;
			document.getElementById("name").value = name;
			document.getElementById("seller").value = seller;
			document.getElementById("status").value = status;
			document.getElementById("category").value = category;
			document.getElementById("price").value = price;
		}

		function initSelectAll() {
			var checkboxes = document.querySelectorAll('input[type="checkbox"]');
			var selectAllCheckbox = document.getElementById('selall');
			var allChecked = true;
			for (var i = 0; i < checkboxes.length; i++) {
				if (!checkboxes[i].checked) {
					allChecked = false;
					break;
				}
			}
			selectAllCheckbox.checked = allChecked;
		}

		function toggleCheckboxes() {
			var selectAllCheckbox = document.getElementById('selall');
			var checkboxes = document.querySelectorAll('input[type="checkbox"]:not(#selall)');
			for (var i = 0; i < checkboxes.length; i++) {
				checkboxes[i].checked = selectAllCheckbox.checked;
			}
		}

		window.onload = function () {
			initSelectAll();
		};

		function sortTableByPriceAsc() {
			var table = document.getElementById("dataList");
			var rows = Array.prototype.slice.call(table.tBodies[0].rows, 0);

			rows.sort(function (a, b) {
				var priceA = parseFloat(a.cells[6].innerText);
				var priceB = parseFloat(b.cells[6].innerText);
				return priceA - priceB;
			});

			for (var i = 0; i < rows.length; i++) {
				table.tBodies[0].appendChild(rows[i]);
			}
		}

		function sortTableByPriceDesc() {
			var table = document.getElementById("dataList");
			var rows = Array.prototype.slice.call(table.tBodies[0].rows, 0);

			rows.sort(function (a, b) {
				var priceA = parseFloat(a.cells[6].innerText);
				var priceB = parseFloat(b.cells[6].innerText);
				return priceB - priceA;
			});

			for (var i = 0; i < rows.length; i++) {
				table.tBodies[0].appendChild(rows[i]);
			}
		}


			function toUpdate(id, name, seller, status, category, price) {
			document.getElementById("id").value = id;
			document.getElementById("name").value = name;
			document.getElementById("seller").value = seller;
			document.getElementById("status").value = status;
			document.getElementById("category").value = category;
			document.getElementById("price").value = price;
		}

			function initSelectAll() {
			var checkboxes = document.querySelectorAll('input[type="checkbox"]');
			var selectAllCheckbox = document.getElementById('selall');
			var allChecked = true;
			for (var i = 0; i < checkboxes.length; i++) {
			if (!checkboxes[i].checked) {
			allChecked = false;
			break;
		}
		}
			selectAllCheckbox.checked = allChecked;
		}

			function toggleCheckboxes() {
			var selectAllCheckbox = document.getElementById('selall');
			var checkboxes = document.querySelectorAll('input[type="checkbox"]:not(#selall)');
			for (var i = 0; i < checkboxes.length; i++) {
			checkboxes[i].checked = selectAllCheckbox.checked;
		}
		}

			window.onload = function() {
			initSelectAll();
		};

			function sortTableByPriceAsc() {
			var table = document.getElementById("dataList");
			var rows = Array.prototype.slice.call(table.tBodies[0].rows, 0);

			rows.sort(function (a, b) {
			var priceA = parseFloat(a.cells[6].innerText);
			var priceB = parseFloat(b.cells[6].innerText);
			return priceA - priceB;
		});

			for (var i = 0; i < rows.length; i++) {
			table.tBodies[0].appendChild(rows[i]);
		}
		}

			function sortTableByPriceDesc() {
			var table = document.getElementById("dataList");
			var rows = Array.prototype.slice.call(table.tBodies[0].rows, 0);

			rows.sort(function (a, b) {
			var priceA = parseFloat(a.cells[6].innerText);
			var priceB = parseFloat(b.cells[6].innerText);
			return priceB - priceA;
		});

			for (var i = 0; i < rows.length; i++) {
			table.tBodies[0].appendChild(rows[i]);
		}
		}

			function confirmDelete(id) {
			if (confirm("确定要删除这个商品吗？")) {
			window.location.href = "delete?id=" + id;
		}
		}


	</script>
</head>
<body class="hold-transition skin-red sidebar-mini">
<!-- .box-body -->
<div class="box-header with-border">
	<h3 class="box-title">商品管理</h3>
</div>

<div class="box-body">

	<!-- 数据表格 -->
	<div class="table-box">

		<!--工具栏-->
		<div class="pull-left">
			<div class="form-group form-inline">
				<div class="btn-group">
					<button type="button" class="btn btn-default" title="新建" data-toggle="modal"
							data-target="#editModal">
						<i class="fa fa-file-o"></i> 新建
					</button>
					<!-- 添加升序排序按钮 -->
					<button type="button" class="btn btn-default" onclick="sortTableByPriceAsc()">
						<i class="fa fa-sort-amount-asc"></i> 价格升序
					</button>
					<!-- 添加降序排序按钮 -->
					<button type="button" class="btn btn-default" onclick="sortTableByPriceDesc()">
						<i class="fa fa-sort-amount-desc"></i> 价格降序
					</button>
				</div>
			</div>
		</div>
		<div class="box-tools pull-right">
			<form action="findAll">
				<div class="has-feedback">
					商品名称：<input type="text" name="name" value="${name}">
					<input type="submit" class="btn btn-default" value="查询">
				</div>
			</form>
		</div>
		<div class="box-tools pull-right">
			<div class="has-feedback">

			</div>
		</div>
		<!--工具栏/-->

		<!--数据列表-->
		<table id="dataList" class="table table-bordered table-striped table-hover dataTable">
			<thead>
			<tr>
				<th class="" style="padding-right:0px">
					<input id="selall" type="checkbox" class="icheckbox_square-blue" onclick="toggleCheckboxes()">
				</th>
				<th class="sorting_asc">商品ID</th>
				<th class="sorting">名称</th>
				<th class="sorting">商家</th>
				<th class="sorting">状态</th>
				<th class="sorting">分类</th>
				<th class="sorting">价格</th>
				<th class="sorting">创建时间</th>
				<th class="text-center">操作</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="g">
				<tr>
					<td><input type="checkbox"></td>
					<td>${g.id}</td>
					<td>${g.name}</td>
					<td>${g.seller}</td>
					<td>${g.status}</td>
					<td>${g.category}</td>
					<td>${g.price}</td>
					<td>${g.createdate}</td>
					<td class="text-center">
						<a href="#" class="btn bg-olive btn-xs" onclick="confirmDelete(${g.id})">删除</a>
						<button type="button"
								onclick="toUpdate(${g.id}, '${g.name}', '${g.seller}', '${g.status}', '${g.category}', ${g.price})"
								class="btn bg-olive btn-xs" data-toggle="modal" data-target="#updateModal">修改</button>
					</td>

				</tr>
			</c:forEach>
			</tbody>
		</table>
		<!--数据列表/-->

	</div>
	<!-- 数据表格 /-->

</div>
<!-- /.box-body -->

<!-- 编辑窗口 -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h3 id="myModalLabel">商品编辑</h3>
			</div>
			<div class="modal-body">
				<form action="add">
					<table class="table table-bordered table-striped" width="800px">
						<tr>
							<td>名称</td>
							<td><input class="form-control" name="name" placeholder="名称"></td>
						</tr>
						<tr>
							<td>商家</td>
							<td><input class="form-control" name="seller" placeholder="商家"></td>
						</tr>
						<tr>
							<td>状态</td>
							<td><input class="form-control" name="status" placeholder="状态"></td>
						</tr>
						<tr>
							<td>分类</td>
							<td><input class="form-control" name="category" placeholder="分类"></td>
						</tr>
						<tr>
							<td>价格</td>
							<td><input class="form-control" name="price" placeholder="价格"></td>
						</tr>
					</table>
					<div class="modal-footer">
						<input type="submit" class="btn btn-success" aria-hidden="true" value="保存">
						<button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h3>商品修改</h3>
			</div>
			<div class="modal-body">
				<form action="update">
					<input type="hidden" id="id" name="id">
					<table class="table table-bordered table-striped" width="800px">
						<tr>
							<td>名称</td>
							<td><input id="name" class="form-control" name="name" placeholder="名称"></td>
						</tr>
						<tr>
							<td>商家</td>
							<td><input id="seller" class="form-control" name="seller" placeholder="商家"></td>
						</tr>
						<tr>
							<td>状态</td>
							<td><input id="status" class="form-control" name="status" placeholder="状态"></td>
						</tr>
						<tr>
							<td>分类</td>
							<td><input id="category" class="form-control" name="category" placeholder="分类"></td>
						</tr>
						<tr>
							<td>价格</td>
							<td><input id="price" class="form-control" name="price" placeholder="价格"></td>
						</tr>
					</table>
					<div class="modal-footer">
						<input type="submit" class="btn btn-success" aria-hidden="true" value="保存">
						<button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

</body>
</html>
