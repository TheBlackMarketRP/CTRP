var cartList = [];
var table = [];

var salesHistoryList = {};
var employeesList = {};
var capacityList = {};
var nearPlayers = {};
var ordersList = {};
var normalList = {};
var itemsList = {};
var stockList = {};
var itemList = {};
var topList = {};
var ranks = {};

var playerRankLabel = "";
var employeeCitizen = "";
var employeeCitizen = "";
var selectedWindow = "";
var modalItemPrice = "";
var modalItemLabel = "";
var modalItemName = "";
var stockStatus = "";
var firstOwner = "";
var playerName = "";
var orderLabel = "";
var orderName = "";
var inventory = "";
var moneyType = "";
var currency = "";
var shopName = "";
var storeID = "";
var owned = "";

var stockOffPercentage = 0;
var percentageStock = 0;
var maxConfigStock = 0;
var stockToUpdate = 0;
var newItemAmount = 1;
var currentStock = 0;
var oldValueCart = 0;
var finalamount = 0;
var orderAmount = 0;
var statusCheck = 0;
var totalItems = 0;
var orderPrice = 0;
var playerRank = 0;
var storeMoney = 0;
var playerCash = 0;
var playerBank = 0;
var cartPrice = 0;
var oldValue = 0;
var maxStock = 0;

var tid = undefined;

var currencyOnLeft = false;
var isMenuOpened = false;
var canAddToCart = true;
var isSubOwner = false;
var isOwner = false;
var client = false;
var canBuy = true;

var locales;

window.addEventListener('message', function(event) {
	switch (event.data.action) {
		case 'loading':
            locales = event.data.locales;
			setupUI();
			selectedWindow = "loading";
			$('.loading').fadeIn();
			break

        case 'overview':
            isOwner = false;
			itemsList = event.data.itemsList
			normalList = event.data.normalList
			currency = event.data.userCurrency
			currencyOnLeft = event.data.currencySide
			playerName = event.data.playerName
			storeMoney = event.data.storeMoney
			storeID = event.data.storeID
			currentStock = event.data.currentStock
			maxStock = event.data.maxStock
			maxConfigStock = event.data.maxConfigStock
			percentageStock = Math.floor(event.data.percentageStock);
			capacityList = event.data.capacityList
			employeesList = event.data.employeesList
			ranks = event.data.ranks
			salesHistoryList = event.data.salesHistoryList
			ordersList = event.data.ordersList
			employeeCitizen = event.data.playerID;
			firstOwner = event.data.firstOwner;
			stockOffPercentage = event.data.stockOffPercentage;
			topList = event.data.itemsList;
			inventory = event.data.inventory;
			statusCheck = event.data.statusCheck;
			var secondOwner = event.data.secondOwner;
			if (maxStock == maxConfigStock) {
				document.getElementById("increase_capacity").disabled = true;
				document.getElementById("increase_capacity").textContent = `${locales.translations.maxstock}`;
			}
			for(var i = 0; i < employeesList.length; i++) {
				if (employeesList[i].identifier == employeeCitizen) {
						playerRank = employeesList[i].rank;
					if (employeesList[i].rank == secondOwner ) {
                        isSubOwner = true;
					}	  
				}
			}
			for (var i = 0; i < ranks.length; i++) {
				if (playerRank == ranks[i].rank) {
					playerRankLabel = ranks[i].label.toUpperCase();
				}
			}
			if (firstOwner == employeeCitizen) { isOwner = true; playerRankLabel = `${locales.translations.owner}`; };
				
			orderList();
			if (event.data.playerSex == "0") {
				avatar = `<img src="./img/avatar_male.png" class="avatar">`;
			} else {
				avatar = `<img src="./img/avatar_female.png" class="avatar">`;
			}

			if (isOwner == true || isSubOwner == true) {
				if (selectedWindow == "loading") {
					openOverview();
					$(".overview").fadeIn();
				}
				setTimeout(function() {
					$('.loading').fadeOut();
				}, 300);
					selectedWindow = "overview";
					businessPrice = event.data.businessPrice
					$(`#sell_business_title`).html(locales.translations.areyousure);
					$(`#sellbusiness_message`).html(locales.translations.sellbusinessfor + ' ' + businessPrice + currency + ' ?');
					$("#cancel_buybusiness").html(locales.translations.cancelbutton);
					$("#sellbusiness_button_modal").html(locales.translations.sellbutton);
					sendCapacityList();
				break
			} else {
				if (selectedWindow == "loading") {
					openOrders();
					$(".orders").fadeIn();
				}
				setTimeout(function() {
					$('.loading').fadeOut();
				}, 300);
					selectedWindow = "orders";
				break
			}
		break

        case 'buyBusiness':
			locales = event.data.locales;
			currencyOnLeft = event.data.currencySide;
			currency = event.data.userCurrency;
			selectedWindow = "buyBusiness";
			$("#buy_business_title").html(locales.translations.areyousure);
			if (!currencyOnLeft) {
				$("#shop_name").html(locales.translations.doyouwanttobuy + ' ' + event.data.road + ' ' + event.data.name + ' ' + locales.translations.buyfor + ' ' + numberWithSpaces(event.data.price) + event.data.currency + ' ?');
			} else {
				$("#shop_name").html(locales.translations.doyouwanttobuy + ' ' + event.data.road + ' ' + event.data.name + ' ' + locales.translations.buyfor + ' ' + event.data.currency + numberWithSpaces(event.data.price) + ' ?');
			}
			$("#closeBuyBusinessButton").html(locales.translations.cancelbutton);
			$("#buybusiness_btn_modal").html(locales.translations.buybutton);
			var modalId = $('#buybusiness_modal');
	    	var buyBusinessModal = new bootstrap.Modal(modalId);
	    	buyBusinessModal.show();
			break

		case 'updateNearPlayers':		
			nearPlayers = event.data.nearPlayers;
			var num = nearPlayers.length;
			var dropdown = ``;
			dropdown += `<option value="${0}">${locales.translations.selectuser}</option>`;
			if(num > 0){

				$('#hireEmployeeModal').modal('toggle');
				
				for(var i = 0; i < num; i++) {
					dropdown += `
						<option value="${nearPlayers[i].id}">${nearPlayers[i].name} (${nearPlayers[i].id})</option>
					`;
				}
			} 
			
			$('#dropdown_to_hire').html(dropdown);
		break

        case 'updateMoney':
            storeMoney = event.data.storeMoney
            $("#company_balance").html(event.data.storeMoney + currency);
        break

		case 'updateEmployees':
			employeesList = event.data.employeesList;
			openEmployees();
			break

		case 'updateOrders':
			ordersList = event.data.ordersList;
			openOrders();
			break

		case 'updateStock':
			itemsList = event.data.itemsList;
			openStock();
			break

		case 'closeUI':
			closeMenu();
			break

		case 'updateCapacityValues':
			maxStock = event.data.totalStock;
			storeMoney = event.data.priceToUpdate;
			$("#company_balance").html(storeMoney + currency);
			var percentageStockUpdated = Math.floor(event.data.percentageStock);
			$('#stock_info').html(`${percentageStockUpdated}% - ${currentStock}/<span class="increase_capacity">${maxStock}</span>`);
			const CapacityBtn = document.getElementById("increase_capacity");
			var totalCapacity = maxStock + stockToUpdate;
			CapacityBtn.innerHTML = `${maxStock} <i class="fas fa-arrow-right"></i> ${totalCapacity} <b>(${capacityList[0].price}${currency})</b>`;
			if (maxStock == maxConfigStock) {
				document.getElementById("increase_capacity").disabled = true;
				document.getElementById("increase_capacity").textContent = `${locales.translations.maxstock}`;
			}
			break
		
		case 'openClientMenu':
			isMenuOpened = true;
			storeID = event.data.storeID;
			itemList = event.data.itemList;
			locales = event.data.locales;
			currency = event.data.userCurrency;
			currencyOnLeft = event.data.currencySide;
			inventory = event.data.inventory;
			shopName = event.data.shopName;
			owned = event.data.owned;
			if (!owned) { canBuy = true };
			playerCash = event.data.playerCash;
			playerBank = event.data.playerBank;
			if (!client) {
				$('.cart').html(``);
				$('.cart').append(`<div id="cart_empty" class="cart_window pr03125 cartempty">${locales.translations.emptycart}</div>
				<button id="checkout_button" type="button" class="btn btn-blue checkout mr0625" data-bs-toggle="modal" data-bs-target="#paymentModal" disabled>${locales.translations.checkout}</button>`);
				canAddToCart = true;
			}
			openClientMenu();
			break

		case 'openFinishPurchase':
			moneyType = event.data.moneyType;
			finishPurchase();
			break

		case 'closeMenu':
			closeMenu();
			break

		case 'clearCard':
			itemList = event.data.itemList;
			client = event.data.client;
			if (isMenuOpened) {
				if (!client) {
					if (cartList.length > 0) {
						for (var i = 0; i < itemList.length; i++) {
							if (itemList[i].amount == 0) {
								for (var j = 0; j < cartList.length; j++) {
									if (cartList[j].name == itemList[i].name) {
										var removedAmount = cartList[j].amount;
										cartPrice = cartPrice - cartList[j].price;
										var item = itemList[i].name;
										cartList.splice(j, 1);
										document.getElementById(item + "_cart_item").remove();
										document.getElementById(item + "-button-id").disabled = false;
										document.getElementById(item + "-button-id").innerHTML = locales.translations.addtocart;
										document.getElementById(item + '_amount').removeAttribute('readonly', false);
										canBuy = false;
										$.post('https://okokShop/action', JSON.stringify({
											action: "itemRemovedFromCartClient",
											amount: removedAmount,
											label: itemList[i].label,
										}));
										if (cartList.length == 0) {
											$('.cart').html(``);
											$('.cart').append(`<div id="cart_empty" class="cart_window pr03125 cartempty">${locales.translations.emptycart}</div>
											<button id="checkout_button" type="button" class="btn btn-blue checkout mr0625" data-bs-toggle="modal" data-bs-target="#paymentModal" disabled>${locales.translations.checkout}</button>`);
											canAddToCart = true;
											document.getElementById("checkout_button").disabled = true;
										}
									}
								}
							} else {
								for (var j = 0; j < cartList.length; j++) {
									if (cartList[j].name == itemList[i].name) {
										if (itemList[i].amount - cartList[j].amount < 0) {
											var oldAmount = cartList[j].amount;
											cartList[j].amount = itemList[i].amount;
											var newAmount = cartList[j].amount * itemList[i].price;
											cartList[j].price = newAmount;
											var removedAmount = oldAmount - cartList[j].amount;
											document.getElementById(itemList[i].name + '-cart-amount').value = itemList[i].amount;
											canBuy = false;
											$.post('https://okokShop/action', JSON.stringify({
												action: "itemRemovedFromCartClient",
												amount: removedAmount,
												label: itemList[i].label,
											}));
											if (currencyOnLeft) {
												document.getElementById(itemList[i].name + "-cart-price").innerHTML = currency + ' ' + newAmount;
											} else {
												document.getElementById(itemList[i].name + "-cart-price").innerHTML = newAmount + ' ' + currency;
											}
										}
									}
								}
							} 
						}
					}
				}
				clearCard();
				break
			}
	}
})


// Global Functions

function setupUI() {
	$("#fire_myself_title").html(locales.translations.areyousure);
	$("#firemyself_message").html(locales.translations.firemyself);
	$("#cancel_firemyself").html(locales.translations.cancelbutton);
	$("#firemyself_button_modal").html(locales.translations.confirm);
	$("#deposit_money_title").html(locales.translations.depositmoney);
	$("#withdraw_money_title").html(locales.translations.withdrawmoney);
	$("#deposit_money").attr("placeholder", locales.translations.amount);
	$("#withdraw_money").attr("placeholder", locales.translations.amount);
	$("#order_amount").attr("placeholder", locales.translations.amount);
	$("#deposit").html(locales.translations.deposit);
	$("#withdraw").html(locales.translations.withdraw);
	$("#buy_business_title").html(locales.translations.areyousure);
	$("#loading_data_card").html(locales.translations.loadingdata);
	$("#new_order").html(locales.translations.confirm + ' (<strong>0.00€</strong>)');
	$("#new_order_title").html(locales.translations.neworder);
	$("#increase_capacity_title").html(locales.translations.increasecapacity);
	$("#fire_employee_title").html(locales.translations.fireemployeetitle);
	$("#cancel_fire").html(locales.translations.cancelbutton);
	$("#fire_employee").html(locales.translations.firebutton);
	$("#edit_employee_title").html(locales.translations.editemployee);
	$("#edit_fire_employee").html(' ' + locales.translations.fireemployeetitle);
	$("#edit_employee").html(locales.translations.save);
	$("#edit_employee_name").html(locales.translations.name);
	$("#edit_employee_total_orders").html(locales.translations.totalorders);
	$("#edit_employee_grade").html(locales.translations.grade);
	$("#hire_employee_title").html(locales.translations.hireemployee);
	$("#confirmHireEmployee").html(locales.translations.hire);
	$("#edit_item").html(locales.translations.save);
	$("#edit_item_name").html(locales.translations.name);
	$("#edit_item_current_price").html(locales.translations.currentprice);
	$("#edit_item_new_price").html(locales.translations.newprice);
	$("#edit_item_title").html(locales.translations.edititem);
}


function numberWithSpaces(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function checkIfEmpty() {

	if (document.getElementById("deposit_money").value != "" && document.getElementById("deposit_money").value > 0) {
		document.getElementById('deposit').disabled = false;
	} else {
		document.getElementById('deposit').disabled = true;
	}
	if (document.getElementById("withdraw_money").value != "" && document.getElementById("withdraw_money").value > 0) {
		document.getElementById('withdraw').disabled = false;
	} else {
		document.getElementById('withdraw').disabled = true;
	}
	if (document.getElementById("item_price").value != "" && document.getElementById("item_price").value > 0) {
		document.getElementById('edit_item').disabled = false;
	} else {
		document.getElementById('edit_item').disabled = true;
	}
	if (document.getElementById("dropdownOrders").value != "" && document.getElementById("dropdownOrders").value > 0 || document.getElementById("order_amount").value != "" && document.getElementById("order_amount").value > 0) {
		document.getElementById('new_order').disabled = false;
	} else {
		document.getElementById('new_order').disabled = true;
	}
}	

// Overview, Cars and Capacity

function openOverview() {
	selectedWindow = "overview";
	$('#overview_menu').html(``);
	var amountCheck = itemsList;
	amountCheck.sort(function(a, b) {
		return a.amount - b.amount;
	});

	if (amountCheck[0].amount < statusCheck) {
		stockStatus = `${amountCheck[0].label} ${locales.translations.lowstock}`;

	} else {
		stockStatus = `${locales.translations.stockgood}`;

	}

	$('#overview_menu').append(`
	<div class="row h-100" id="menu">
		<div class="col-md-2 d-flex flex-column sidebar-s">
			<img src="./img/logo.png" class="logo">
			<hr>
			<span class="sidebar-title">${locales.translations.menu}</span>
			<div id="sidebarOverview">
				<p class="sidebar-item mt-2 selected" id="overview_page"><i class="bi bi-grid-1x2-fill"></i> <span class="ms-1">${locales.translations.overview}</span></p>
                <p class="sidebar-item" id="stock_page"><i class="fas fa-warehouse"></i> <span class="ms-1">${locales.translations.stock}</span></p>
				<p class="sidebar-item" id="orders_page"><i class="fas fa-map-location-dot"></i> <span class="ms-1">${locales.translations.orders}</span></p>
				<p class="sidebar-item" id="employees_page"><i class="fas fa-user-friends"></i> <span class="ms-1">${locales.translations.employees}</span></p>
				<p class="sidebar-item" id="saleshistory_page"><i class="fas fa-chart-column"></i> <span class="ms-1">${locales.translations.saleshistory}</span></p>
			</div>
			<p id="close_overview" class="sidebar-item mt-auto logout"><i class="fas fa-sign-out-alt"></i></i> <span class="ms-1">${locales.translations.logout}</span></p>
		</div>
		<div class="col-md-10 tab-s">
			<div class="d-flex justify-content-between align-items-center">
				<span class="selected-page"><span id="page-title">${locales.translations.overview}</span></span>
				<div>
					<span class="username align-middle">
						<span id="playerName">${playerName}</span> <span id="avatar">${avatar}</span>
						<div class="grade">${playerRankLabel}</div>
					</span>
				</div> 
			</div>
			<hr>
			<div class="d-flex flex-column" id="page_info">
				<div class="row">
					<div class="col col-md-6 d-flex justify-content-center pr05">
						<div class="card card-o w-100">
							<div class="card-header card-o-header text-center">
								<span class="card-o-title">${locales.translations.finances}</span>
							</div>
							<div class="card-body card-o-body finances_card-body text-center pt-025">
								<div class="d-flex justify-content-center flex-column">
									<div id="balance_currency_side" class="mt-12 mb-09">                          
									</div>
								</div>
								<hr class="mg050">
								<button type="button" class="btn btn-blue w-100 mt-2 dep_with-buttons" data-bs-toggle="modal" data-bs-target="#depositModal">${locales.translations.deposit}</button>
								<button type="button" class="btn btn-blue w-100 mt-2 dep_with-buttons" data-bs-toggle="modal" data-bs-target="#withdrawModal">${locales.translations.withdraw}</button>
							</div>
						</div>
					</div>
					<div class="col col-md-6 d-flex justify-content-center pl05">
                        <div class="card card-o w-100">
                            <div class="card-header card-o-header text-center">
                                <span class="card-o-title">${locales.translations.items}</span>
                            </div>
                            <div class="card-body card-o-body total_capacity_card-body text-center pt-025">
                                <div class="d-flex justify-content-center flex-column">
                                    <div class="mt-12 mb-09">
                                        <div class="fff fs175">${locales.translations.totalcapacity}</div>
                                        <div class="fs175" id="stock_info" style="cursor: pointer;" data-bs-toggle="modal" data-bs-target="#increaseCapacityModal">${percentageStock}% - ${currentStock}/<span class="increase_capacity">${maxStock}</span></div>
                                    </div>
                                    <hr class="mg050">
                                    <div class="mt-09">
                                        <div class="fff fs175">${locales.translations.stockalert}</div>
                                        <div id="stockMessage" class="fs175">${stockStatus}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
				</div>
				<div class="card card-o d-flex flex-column">
					<div class="card-header card-o-header text-center">
						<span class="card-o-title">${locales.translations.mostsolditems}</span>
					</div>
					<div class="card-body card-o-body">
					<div id="top3_overview" class="row h-100">
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
`);

    if ( currencyOnLeft == true ) {
        $('#balance_currency_side').append(`
            <div class="fff fs175">${locales.translations.balance}</div>
            <div class="fs175" id="company_balance">${currency}${storeMoney}</div>
        `);
    } else {
        $('#balance_currency_side').append(`
            <div class="fff fs175">${locales.translations.balance}</div>
            <div class="fs175" id="company_balance">${storeMoney}${currency}</div>
        `);
    }
	
	if ( isOwner == true ) {
		$('#sidebarOverview').append(`
		<p class="sidebar-item-red" id="sell_business" data-bs-toggle="modal" data-bs-target="#sellbusiness_modal"><i class="fas fa-building"></i> <span class="ms-1">${locales.translations.sellbusiness}</span></p>
		`);
	}

	topItems = '';

	topList.sort(function(a, b) {
		return b.sold - a.sold;
	});

		let classes = 'pr05';
		let topListNumber = 3;
		if (topList.length < 3) { topListNumber = topList.length; }
		
		for(var i = 0; i < topListNumber; i++) {

			if(i == 0){
				classes = 'pr05';
			} else if(i == 1){
				classes = 'pl05 pr05';
			} else if(i == 2){
				classes = 'pl05';
			}

			topItems += `
			<div class="col col-md-4 d-flex justify-content-center ${classes}">
				<div class="card mostsold_card">
					<div class="card-header card-header_ov text-center mostsold_borderbot">
						<span class="fff">${topList[i].label}</span>
					</div>
					<div class="card-body text-center mostsold_height">
						<div class="used_slot">
							<img src="nui://${inventory}/${topList[i].name}.png" class="mostsoldimage">
						</div>
						<div class="totalsold">${locales.translations.totalsold}: ${topList[i].sold}</div>
					</div>
				</div>
			</div>`;
		}

		$('#top3_overview').html(topItems);
}


// Send the capacity list from the config to the select

function sendCapacityList() {

	$('#dropdown_capacity').html(``);
	optionToAdd = ``;

	for(var i = 0; i < capacityList.length; i++) {

		let capacity = capacityList[i].capacity;

		optionToAdd += `
				<option value="${capacity}">${capacity}</option>
		`;

	}

	$('#dropdown_capacity').append(optionToAdd);

	const CapacityBtn = document.getElementById("increase_capacity");
	var toUpdate = parseInt(capacityList[0].capacity) + parseInt(maxStock);
	if (maxStock == maxConfigStock) {
		CapacityBtn.innerHTML = `${locales.translations.maxstock}`;
	} else {
		CapacityBtn.innerHTML = `${maxStock} <i class="fas fa-arrow-right"></i> ${toUpdate} <b>(${capacityList[0].price}${currency})</b>`;
	}

	stockToUpdate = parseInt(capacityList[0].capacity);
	stockToUpdatePrice = capacityList[0].price;
} 


// Change Capacity Modal

const selectElement = document.getElementById("dropdown_capacity");
selectElement.addEventListener("change", () => {
	if (maxStock == maxConfigStock) {
		document.getElementById("increase_capacity").disabled = true;
		document.getElementById("increase_capacity").textContent = `${locales.translations.maxstock}`;
	} else {

		const selectedValue = selectElement.value;
		const newValue = parseInt(selectedValue) + parseInt(maxStock);
		const Btn = document.getElementById("increase_capacity");
		Btn.disabled = false;
		const capacitySelected = capacityList.find(capacity => capacity.capacity === parseInt(selectedValue));
		Btn.innerHTML = `${maxStock} <i class="fas fa-arrow-right"></i> ${newValue} <b>(${capacitySelected.price}${currency})</b>`
		stockToUpdate = parseInt(selectedValue);
		stockToUpdatePrice = capacitySelected.price;
	}
});

// Orders Table

function openOrders() {
	selectedWindow = "orders";
	$('#orders_menu').html(``);
	$('#orders_menu').append(`
	<div class="row h-100" id="menu">
		<div class="col-md-2 d-flex flex-column sidebar-s">
			<img src="./img/logo.png" class="logo">
			<hr>
			<span class="sidebar-title">${locales.translations.menu}</span>
			<div id="sidebarOrderMenu">
			</div>
			<p id="close_overview" class="sidebar-item mt-auto logout"><i class="fas fa-sign-out-alt"></i></i> <span class="ms-1">${locales.translations.logout}</span></p>
		</div>
		<div class="col-md-10 tab-s">
			<div class="d-flex justify-content-between align-items-center">
				<span class="selected-page"><span id="page-title">${locales.translations.orders}</span></span>
				<div>
					<span class="username align-middle">
					<span id="playerName">${playerName}</span> <span id="avatar">${avatar}</span>
						<div id="playerGrade" class="grade">${playerRankLabel}</div>
					</span>
				</div>
			</div>
			<hr>
			<div class="d-flex flex-column gap0" id="page_info">
			<div id="createOrders" class="d-flex">
			</div>
			<table id="ordersTable" class="mt-025">
				<thead>
					<tr>
						<th class="text-center">${locales.translations.item}</th>
						<th class="text-center">${locales.translations.amount}</th>
						<th class="text-center">${locales.translations.reward}</th>
						<th class="text-center">${locales.translations.employee}</th>
						<th class="text-center">${locales.translations.actions}</th>
					</tr>
				</thead>
				<tbody id="ordersTableData">
				</tbody>
			</table></div>
		</div>
	</div>
	`)

	if (isOwner == true ) {
		$('#sidebarOrderMenu').html(`
		<p class="sidebar-item mt-2" id="overview_page"><i class="bi bi-grid-1x2-fill"></i> <span class="ms-1">${locales.translations.overview}</span></p>
		<p class="sidebar-item" id="stock_page"><i class="fas fa-warehouse"></i> <span class="ms-1">${locales.translations.stock}</span></p>
		<p class="sidebar-item selected" id="orders_page"><i class="fas fa-map-location-dot"></i> <span class="ms-1">${locales.translations.orders}</span></p>
		<p class="sidebar-item" id="employees_page"><i class="fas fa-user-friends"></i> <span class="ms-1">${locales.translations.employees}</span></p>
		<p class="sidebar-item" id="saleshistory_page"><i class="fas fa-chart-column"></i> <span class="ms-1">${locales.translations.saleshistory}</span></p>
		<p class="sidebar-item-red" id="sell_business" data-bs-toggle="modal" data-bs-target="#sellbusiness_modal"><i class="fas fa-building"></i> <span class="ms-1">${locales.translations.sellbusiness}</span></p>
		`)
		$('#createOrders').html(`
		<button type="button" class="btn btn-blue hire-emp" data-bs-toggle="modal" data-bs-target="#newOrderModal">${locales.translations.neworder}</button>
		`)
	} else if (isSubOwner == true ) {
		$('#sidebarOrderMenu').html(`
		<p class="sidebar-item mt-2" id="overview_page"><i class="bi bi-grid-1x2-fill"></i> <span class="ms-1">${locales.translations.overview}</span></p>
		<p class="sidebar-item" id="stock_page"><i class="fas fa-warehouse"></i> <span class="ms-1">${locales.translations.stock}</span></p>
		<p class="sidebar-item selected" id="orders_page"><i class="fas fa-map-location-dot"></i> <span class="ms-1">${locales.translations.orders}</span></p>
		<p class="sidebar-item" id="employees_page"><i class="fas fa-user-friends"></i> <span class="ms-1">${locales.translations.employees}</span></p>
		<p class="sidebar-item" id="saleshistory_page"><i class="fas fa-chart-column"></i> <span class="ms-1">${locales.translations.saleshistory}</span></p>
		`)
		$('#createOrders').html(`
		<button type="button" class="btn btn-blue hire-emp" data-bs-toggle="modal" data-bs-target="#newOrderModal">${locales.translations.neworder}</button>
		`)
	} else {
		$('#sidebarOrderMenu').html(`
		<p class="sidebar-item selected"><i class="fas fa-warehouse"></i> <span class="ms-1">${locales.translations.orders}</span></p>
		<p class="sidebar-item-red" id="fire_myself" data-bs-toggle="modal" data-bs-target="#firemyself_modal"><i class="fas fa-user-tie"></i> <span class="ms-1">${locales.translations.quitjob}</span></p>
		`)
		document.getElementById('createOrders').style.marginTop = '2.685rem';
	}

	$('#ordersTableData').html(``)

	
		var row = ``
		for (var i = 0; i < ordersList.length; i++) {
			if (ordersList[i].in_progress == 0) {
				row += `
				<tr>
					<td class="text-center align-middle">${ordersList[i].label}</td>
					<td class="text-center align-middle">${ordersList[i].amount}</td>
					<td class="text-center align-middle">${ordersList[i].reward}${currency}</td>
					<td class="text-center align-middle">${ordersList[i].employee_name}</td>
					<td class="text-center align-middle"><button type="button" class="btn btn-blue btn-acceptorder" onClick="acceptOrder('${ordersList[i].id}')"><i class="fas fa-check"></i> ${locales.translations.accept}</button></td>
				</tr>
					</tr>
				`;
			} else {
				if (ordersList[i].employee_id == employeeCitizen) {
					row += `
					<tr>
						<td class="text-center align-middle">${ordersList[i].label}</td>
						<td class="text-center align-middle">${ordersList[i].amount}</td>
						<td class="text-center align-middle">${ordersList[i].reward}${currency}</td>
						<td class="text-center align-middle">${ordersList[i].employee_name}</td>
						<td class="text-center align-middle"><button type="button" class="btn btn-red btn-acceptorder" onClick="stopOrder('${ordersList[i].id}')"><i class="fas fa-xmark"></i> ${locales.translations.cancel}</button></td>
					</tr>
						</tr>
					`;
				} else {
					row += `
					<tr>
						<td class="text-center align-middle">${ordersList[i].label}</td>
						<td class="text-center align-middle">${ordersList[i].amount}</td>
						<td class="text-center align-middle">${ordersList[i].reward}${currency}</td>
						<td class="text-center align-middle">${ordersList[i].employee_name}</td>
						<td class="text-center align-middle"><button type="button" class="btn btn-blue btn-acceptorder" onClick="acceptOrder('${ordersList[i].id}')" disabled><i class="fas fa-check"></i> ${locales.translations.accepted}</button></td>
					</tr>
						</tr>
					`;
				} 
			}
		} 
	$('#ordersTableData').append(row);

	var table_id = document.getElementById('ordersTable');
	table.push(new simpleDatatables.DataTable(table_id, {
		perPageSelect: false,
		perPage: 6,
		labels: {
			placeholder: locales.translations.search,
			noRows: locales.translations.noentriesfound,
			noResults: locales.translations.noresults,
		}
	}));
}

function orderList() {
	$('#dropdownOrders').html(``);
	var dropdown = ``;
	var price = 0;
	dropdown += `<option value="${0}">${locales.translations.selectorder}</option>`;
	if(itemsList.length > 0){
	
		for(var i = 0; i < itemsList.length; i++) {
			for (var j = 0; j < normalList.length; j++) {
				if (itemsList[i].name == normalList[j].name) {
					price = normalList[j].price * stockOffPercentage;
					dropdown += `
						<option value="${itemsList[i].name}">${itemsList[i].label} (${price.toFixed(2)}${currency})</option>
					`;
				}
			}
			price = 0;
		}
	} 
	
	$('#dropdownOrders').html(dropdown);
} 


// Accept order 

function acceptOrder(order) {
    for (let i = 0; i < ordersList.length; i++) {
        if (ordersList[i].id == order) {

            var orderID = ordersList[i].id;
			var orderName = ordersList[i].item;
			var orderAmount = ordersList[i].amount;
			var orderReward = ordersList[i].reward;

			$.post('https://okokShop/action', JSON.stringify({
				action: "acceptOrder",
				orderName: orderName,
				orderID: orderID,
				StoreID: storeID,
				orderAmount: orderAmount,
				orderReward: orderReward
			}));
        }
    };
}


// Stop order

function stopOrder(order) {
    for (let i = 0; i < ordersList.length; i++) {
        if (ordersList[i].id == order) {

			var orderID = ordersList[i].id;

			$.post('https://okokShop/action', JSON.stringify({
				action: "stopOrder",
				storeID: storeID,
				orderID: orderID
			}));

        }
    };
}


// Employees Table

function openEmployees() {
	selectedWindow = "employees";
	$('#employees_menu').html(``);
	$('#employees_menu').append(`
	<div class="row h-100" id="menu">
		<div class="col-md-2 d-flex flex-column sidebar-s">
			<img src="./img/logo.png" class="logo">
			<hr>
			<span class="sidebar-title">${locales.translations.menu}</span>
			<div id="sidebarEmployees">
			<p class="sidebar-item mt-2" id="overview_page"><i class="bi bi-grid-1x2-fill"></i> <span class="ms-1">${locales.translations.overview}</span></p>
			<p class="sidebar-item" id="stock_page"><i class="fas fa-warehouse"></i> <span class="ms-1">${locales.translations.stock}</span></p>
			<p class="sidebar-item" id="orders_page"><i class="fas fa-map-location-dot"></i> <span class="ms-1">${locales.translations.orders}</span></p>
			<p class="sidebar-item selected" id="employees_page"><i class="fas fa-user-friends"></i> <span class="ms-1">${locales.translations.employees}</span></p>
			<p class="sidebar-item" id="saleshistory_page"><i class="fas fa-chart-column"></i> <span class="ms-1">${locales.translations.saleshistory}</span></p>
			</div>
			<p id="close_overview" class="sidebar-item mt-auto logout"><i class="fas fa-sign-out-alt"></i></i> <span class="ms-1">${locales.translations.logout}</span></p>
		</div>
		<div class="col-md-10 tab-s">
			<div class="d-flex justify-content-between align-items-center">
				<span class="selected-page"><span id="page-title">${locales.translations.employees}</span></span>
				<div>
					<span class="username align-middle">
					<span id="playerName">${playerName}</span> <span id="avatar">${avatar}</span>
						<div class="grade">${playerRankLabel}</div>
					</span>
				</div>
			</div>
			<hr>
			<div class="d-flex flex-column gap0" id="page_info">
			<div class="d-flex">
				<button type="button" id="hireEmployeeButton" class="btn btn-blue hire-emp" data-bs-target="#hireEmployeeModal">${locales.translations.hireemployee}</button>
			</div>
			<table id="employeesTable"class="mt-025">
					<thead>
						<tr>
							<th class="text-center">${locales.translations.name}</th>
							<th class="text-center">${locales.translations.grade}</th>
							<th class="text-center">${locales.translations.totalorders}</th>
							<th class="text-center">${locales.translations.actions}</th>
						</tr>
					</thead>
					<tbody id="employeesTableData">
					</tbody>
				</table>
			</div>
		</div>
	</div>
	`);

	if ( isOwner == true ) {
		$('#sidebarEmployees').append(`
		<p class="sidebar-item-red" id="sell_business" data-bs-toggle="modal" data-bs-target="#sellbusiness_modal"><i class="fas fa-building"></i> <span class="ms-1">${locales.translations.sellbusiness}</span></p>
		`);
	}

	$('#employeesTableData').html(``)
	var row = ``
	for (var i = 0; i < employeesList.length; i++) {
			row += `
			<tr>
			<td class="text-center align-middle">${employeesList[i].name}</td>
				<td class="text-center align-middle">${employeesList[i].rankTag}</td>
				<td class="text-center align-middle">${employeesList[i].orders}</td>
				<td class="text-center align-middle"><button type="button" class="btn btn-blue btn-editemployees" data-employee_name="${employeesList[i].name}" data-employee_rank="${employeesList[i].rankTag}" data-employee_earned="${employeesList[i].orders}" data-bs-toggle="modal" data-bs-target="#editEmployeeModal" onClick="editEmployee('${employeesList[i].name}')"><i class="fa-solid fa-pen-to-square"></i> ${locales.translations.edit}</button></td>
			</tr>
				</tr>
			`;
	}
	
	$('#employeesTableData').append(row);

	var table_id = document.getElementById('employeesTable');
	table.push(new simpleDatatables.DataTable(table_id, {
		perPageSelect: false,
		perPage: 6,
		labels: {
			placeholder: locales.translations.search,
			noRows: locales.translations.noentriesfound,
			noResults: locales.translations.noresults,
		}
	}));
}

// Edit Employees info

function editEmployee(name) {
    for (let i = 0; i < employeesList.length; i++) {
        if (employeesList[i].name == name) {

            modalEmployeeName = employeesList[i].name;
            modalEmployeeTotalOrders = employeesList[i].orders;
            modalEmployeeGrade = employeesList[i].rankTag;
			employeeID = employeesList[i].identifier;
            changeEmployeesModalInfo();
        }
    };
}


// Change the info to fire player

function changeEmployeesModalInfo() {
	document.getElementById("fireEmployeeNameChange").innerHTML = `${locales.translations.fireemployee}` + ' ' + modalEmployeeName + "?";
	document.getElementById("employee_name").value = modalEmployeeName;
	document.getElementById("employee_total-orders").value = modalEmployeeTotalOrders;
	var num = ranks.length;
	var dropdown = ``;
	dropdown += `<option value="${0}">${modalEmployeeGrade}</option>`;
	if(num > 0){
		
		for(var i = 0; i < num; i++) {
			if (ranks[i].label != modalEmployeeGrade) { 
				dropdown += `
					<option value="${ranks[i].rank}">${ranks[i].label}</option>
				`;
			}
		}
	} 
	
	$('#dropdownRanks').html(dropdown);
} 


// Stock Table

function openStock() {
	selectedWindow = "stock";
	$('#stock_menu').html(``);
	$('#stock_menu').append(`
	<div class="row h-100" id="menu">
	<div class="col-md-2 d-flex flex-column sidebar-s">
		<img src="./img/logo.png" class="logo">
		<hr>
		<span class="sidebar-title">${locales.translations.menu}</span>
		<div id="sidebarStock">
		<p class="sidebar-item mt-2" id="overview_page"><i class="bi bi-grid-1x2-fill"></i> <span class="ms-1">${locales.translations.overview}</span></p>
		<p class="sidebar-item selected" id="stock_page"><i class="fas fa-warehouse"></i> <span class="ms-1">${locales.translations.stock}</span></p>
		<p class="sidebar-item" id="orders_page"><i class="fas fa-map-location-dot"></i> <span class="ms-1">${locales.translations.orders}</span></p>
		<p class="sidebar-item" id="employees_page"><i class="fas fa-user-friends"></i> <span class="ms-1">${locales.translations.employees}</span></p>
		<p class="sidebar-item" id="saleshistory_page"><i class="fas fa-chart-column"></i> <span class="ms-1">${locales.translations.saleshistory}</span></p>
		</div>
		<p id="close_overview" class="sidebar-item mt-auto logout"><i class="fas fa-sign-out-alt"></i></i> <span class="ms-1">${locales.translations.logout}</span></p>
	</div>
	<div class="col-md-10 tab-s">
		<div class="d-flex justify-content-between align-items-center">
			<span class="selected-page"><span id="page-title">${locales.translations.stock}</span></span>
			<div>
				<span class="username align-middle">
				<span id="playerName">${playerName}</span> <span id="avatar">${avatar}</span>
					<div class="grade">${playerRankLabel}</div>
				</span>
			</div>
		</div>
		<hr>
		<div class="d-flex flex-column gap0" id="page_info">
		<table id="stockTable" class="mt-295">
			<thead>
				<tr>
					<th class="text-center">${locales.translations.item}</th>
					<th class="text-center">${locales.translations.amount}</th>
					<th class="text-center">${locales.translations.price}</th>
					<th class="text-center">${locales.translations.actions}</th>
				</tr>
			</thead>
			<tbody id="stockTableData">
			</tbody>
		</table>
		</div>
	</div>
	`);

	if ( isOwner == true ) {
		$('#sidebarStock').append(`
		<p class="sidebar-item-red" id="sell_business" data-bs-toggle="modal" data-bs-target="#sellbusiness_modal"><i class="fas fa-building"></i> <span class="ms-1">${locales.translations.sellbusiness}</span></p>
		`);
	}

	$('#stockTableData').html(``)
	var row = ``

	for (var i = 0; i < itemsList.length; i++) {
			row += `
			<tr>
				<td class="text-center align-middle">${itemsList[i].label}</td>
				<td class="text-center align-middle">${itemsList[i].amount}</td>
				<td class="text-center align-middle">${itemsList[i].price.toFixed(2)}${currency}</td>
				<td class="text-center align-middle"><button type="button" class="btn btn-blue btn-edititem" data-item_name="${itemsList[i].label}" data-item_price="${itemsList[i].price}" data-bs-toggle="modal" data-bs-target="#editItemModal" onClick="editItem('${itemsList[i].name}')"><i class="fa-solid fa-pen-to-square"></i> ${locales.translations.edit}</button></td>
			</tr>
				</tr>
			`;
	}
	
	$('#stockTableData').append(row);

	var table_id = document.getElementById('stockTable');
	table.push(new simpleDatatables.DataTable(table_id, {
		perPageSelect: false,
		perPage: 6,
		labels: {
			placeholder: locales.translations.search,
			noRows: locales.translations.noentriesfound,
			noResults: locales.translations.noresults,
		}
	}));
}



// Sale History Table

function openSalesHistory() {
	selectedWindow = "saleshistory";
	$('#sales_menu').html(``);
	$('#sales_menu').append(`
	<div class="row h-100" id="menu">
	<div class="col-md-2 d-flex flex-column sidebar-s">
		<img src="./img/logo.png" class="logo">
		<hr>
		<span class="sidebar-title">${locales.translations.menu}</span>
		<div id="sidebarSalesHistory">
		<p class="sidebar-item mt-2" id="overview_page"><i class="bi bi-grid-1x2-fill"></i> <span class="ms-1">${locales.translations.overview}</span></p>
		<p class="sidebar-item" id="stock_page"><i class="fas fa-warehouse"></i> <span class="ms-1">${locales.translations.stock}</span></p>
		<p class="sidebar-item" id="orders_page"><i class="fas fa-map-location-dot"></i> <span class="ms-1">${locales.translations.orders}</span></p>
		<p class="sidebar-item" id="employees_page"><i class="fas fa-user-friends"></i> <span class="ms-1">${locales.translations.employees}</span></p>
		<p class="sidebar-item selected" id="saleshistory_page"><i class="fas fa-chart-column"></i> <span class="ms-1">${locales.translations.saleshistory}</span></p>
		</div>
		<p id="close_overview" class="sidebar-item mt-auto logout"><i class="fas fa-sign-out-alt"></i></i> <span class="ms-1">${locales.translations.logout}</span></p>
	</div>
	<div class="col-md-10 tab-s">
		<div class="d-flex justify-content-between align-items-center">
			<span class="selected-page"><span id="page-title">${locales.translations.saleshistory}</span></span>
			<div>
				<span class="username align-middle">
				<span id="playerName">${playerName}</span> <span id="avatar">${avatar}</span>
					<div class="grade">${playerRankLabel}</div>
				</span>
			</div>
		</div>
		<hr>
		<div class="d-flex flex-column gap0" id="page_info">
		<table id="salesHistoryTable" class="mt-295">
			<thead>
				<tr>
					<th class="text-center">${locales.translations.date}</th>
					<th class="text-center">${locales.translations.item}</th>
					<th class="text-center">${locales.translations.amount}</th>
					<th class="text-center">${locales.translations.price}</th>
					<th class="text-center">${locales.translations.buyer}</th>
				</tr>
			</thead>
			<tbody id="salesHistoryTableData">
			</tbody>
		</table>
		</div>
	</div>
	`);

	if ( isOwner == true ) {
		$('#sidebarSalesHistory').append(`
		<p class="sidebar-item-red" id="sell_business" data-bs-toggle="modal" data-bs-target="#sellbusiness_modal"><i class="fas fa-building"></i> <span class="ms-1">${locales.translations.sellbusiness}</span></p>
		`);
	}

	$('#salesHistoryTableData').html(``)
	var row = ``

	for (var i = 0; i < salesHistoryList.length; i++) {
			row += `
			<tr>
				<td class="text-center align-middle">${salesHistoryList[i].date}</td>
				<td class="text-center align-middle">${salesHistoryList[i].item}</td>
				<td class="text-center align-middle">${salesHistoryList[i].amount}</td>
				<td class="text-center align-middle">${salesHistoryList[i].price}${currency}</td>
				<td class="text-center align-middle">${salesHistoryList[i].buyer_name}</td>
			</tr>
				</tr>
			`;
	}
	
	$('#salesHistoryTableData').append(row);

	var table_id = document.getElementById('salesHistoryTable');
	table.push(new simpleDatatables.DataTable(table_id, {
		perPageSelect: false,
		perPage: 6,
		labels: {
			placeholder: locales.translations.search,
			noRows: locales.translations.noentriesfound,
			noResults: locales.translations.noresults,
		}
	}));
}


// Edit Item info

function editItem(name) {
    for (let i = 0; i < itemsList.length; i++) {
        if (itemsList[i].name == name) {

            modalItemName = itemsList[i].name;
			modalItemLabel = itemsList[i].label;
			modalItemPrice = itemsList[i].price.toFixed(2) + currency;
        }
    };
	changeItemModalInfo();
}

function changeItemModalInfo() {
	document.getElementById("item_name").value = modalItemLabel;
	document.getElementById("item_old_price").value = modalItemPrice;
	document.getElementById("item_price").placeholder = modalItemPrice;
}


function openClientMenu() {
	selectedWindow = "buy_menu";
	$("#shop_client_name").html(shopName);
	$('#item_list').html(``);
	if (client ) {
		$('#cart_empty').html(``);
	}
	var row = ``
	var itemClass = '';
	row += `<div class="item_div">`;
	for (var i = 0; i < itemList.length; i++) {
		if (itemList.length >= 13 ) {
			document.getElementById('item_list').classList.add('pr05');
		}
		itemClass = 'class="item ms-1 me-1"';
		if (i == 0) { 
			itemClass = 'class="item me-1"';
		} else if (i > 0 && (i + 1) % 4 === 0) {
			itemClass = 'class="item ms-1"';
		} else if (i > 0 && i % 4 === 0) {
			itemClass = 'class="item me-1"';
		}
		if (currencyOnLeft) {
			if (itemList[i].amount > 0) {
				row += `
				<div ${itemClass}>
					<div class="item-name">${itemList[i].label}</div>
					<div class="item-img_div">
						<img src="nui://${inventory}/${itemList[i].name}.png" class="item-img">
					</div>
					<div class="item-price">${currency} ${itemList[i].price}</div>
					<div class="item-btns">
						<div class="item-input_div">
							<input type="number" id="${itemList[i].name}_amount" class="item-amount" value="1" min="1" max="999" onkeyup="checkIfEmpty()" oninput="handleInput(this)">
							<div class="item-input_amount-div">
								<span type="button" class="amountbtn" onClick="addAmount('${itemList[i].name}')"><i class="fa-solid fa-chevron-up"></i></span>
								<span type="button" class="amountbtn" onClick="removeAmount('${itemList[i].name}')"><i class="fa-solid fa-chevron-down"></i></span>
							</div>
						</div>
						<button id="${itemList[i].name}-button-id" type="button" class="btn btn-blue addtocart" onClick="addToCart('${itemList[i].name}')">${locales.translations.addtocart}</button>
					</div>
				</div>
				`;
			} else {
				row += `
				<div ${itemClass}>
					<div class="item-name">${itemList[i].label}</div>
					<div class="item-img_div">
						<img src="nui://${inventory}/${itemList[i].name}.png" class="item-img">
					</div>
					<div class="item-price">${itemList[i].price} ${currency}</div>
					<div class="item-btns">
						<div class="item-input_div">
							<input type="number" id="${itemList[i].name}-item-amount" class="item-amount" value="0" min="1" max="999" onkeyup="checkIfEmpty()" readonly>
							<div class="item-input_amount-div">
								<span type="button" class="amountbtn"><i class="fa-solid fa-chevron-up"></i></span>
								<span type="button" class="amountbtn"><i class="fa-solid fa-chevron-down"></i></span>
							</div>
						</div>
						<button type="button" class="btn btn-red addtocart" disabled>${locales.translations.outofstock}</button>
					</div>
				</div>
				`;
			}
		} else {
			if (itemList[i].amount > 0) {
				row += `
				<div ${itemClass}>
					<div class="item-name">${itemList[i].label}</div>
					<div class="item-img_div">
						<img src="nui://${inventory}/${itemList[i].name}.png" class="item-img">
					</div>
					<div class="item-price">${itemList[i].price} ${currency}</div>
					<div class="item-btns">
						<div class="item-input_div">
							<input type="number" id="${itemList[i].name}_amount" class="item-amount" value="1" min="1" max="999" onkeyup="checkIfEmpty()" oninput="handleInput(this)">
							<div class="item-input_amount-div">
								<span type="button" class="amountbtn" onClick="addAmount('${itemList[i].name}')"><i class="fa-solid fa-chevron-up"></i></span>
								<span type="button" class="amountbtn" onClick="removeAmount('${itemList[i].name}')"><i class="fa-solid fa-chevron-down"></i></span>
							</div>
						</div>
						<button id="${itemList[i].name}-button-id" type="button" class="btn btn-blue addtocart" onClick="addToCart('${itemList[i].name}')">${locales.translations.addtocart}</button>
					</div>
				</div>
				`;
			} else {
				row += `
				<div ${itemClass}>
					<div class="item-name">${itemList[i].label}</div>
					<div class="item-img_div">
						<img src="nui://${inventory}/${itemList[i].name}.png" class="item-img">
					</div>
					<div class="item-price">${itemList[i].price} ${currency}</div>
					<div class="item-btns">
						<div class="item-input_div">
							<input type="number" id="${itemList[i].name}-item-amount" class="item-amount" value="0" min="1" max="999" onkeyup="checkIfEmpty()" readonly>
							<div class="item-input_amount-div">
								<span type="button" class="amountbtn"><i class="fa-solid fa-chevron-up"></i></span>
								<span type="button" class="amountbtn"><i class="fa-solid fa-chevron-down"></i></span>
							</div>
						</div>
						<button type="button" class="btn btn-red addtocart" disabled>${locales.translations.outofstock}</button>
					</div>
				</div>
				`;
			}
		}

		if (i > 0 && (i + 1) % 4 === 0 && i != itemList.length - 1) {
			row += `</div><div class="item_div mt-2">`;
		}
	}

	if (cartList.length == 0 && client) {
		$('.cart').append(`<div id="cart_empty" class="cart_window pr03125 cartempty">${locales.translations.emptycart}</div>
		<button id="checkout_button" type="button" class="btn btn-blue checkout mr0625" data-bs-toggle="modal" data-bs-target="#paymentModal" disabled>${locales.translations.checkout}</button>`);
	}
	$('#item_list').append(row);
	$('.buy_menu').fadeIn();
}

function handleInput(inputElement) {
    var value = parseInt(inputElement.value);
	if ( oldValue != value ) {
		for (var i = 0; i < itemList.length; i++) {
			if (itemList[i].name == inputElement.id.replace('_amount', '')) {
				var max = itemList[i].amount;
				if ( itemList[i].amount > 999 ) {
					max = 999;
				}		
			}
		}
		if (isNaN(value) || value < 1) {
			inputElement.value = oldValue;
		} else if (value > max) {
			inputElement.value = max;
		} else {
			oldValue = value;
			inputElement.value = value;
		}
	} else {
		inputElement.value = oldValue;
	} 
}

function addAmount(item) {
	var inputAmount = parseInt(document.getElementById(item + "_amount").value);
	var itemAmount = 0;
	for (var i = 0; i < itemList.length; i++) {
		if (itemList[i].name == item) {
			itemAmount = itemList[i].amount;
		}
	}
	if (inputAmount  < itemAmount) {
		if (document.getElementById(item + "_amount").readOnly == false) {
			var amount = document.getElementById(item + "_amount").value;
			amount++;
			document.getElementById(item + "_amount").value = amount;
		}	
	}
}

function removeAmount(item) {
	var inputAmount = parseInt(document.getElementById(item + "_amount").value);

	if (inputAmount  > 1) {
		if (document.getElementById(item + "_amount").readOnly == false) {
			var amount = document.getElementById(item + "_amount").value;
			amount--;
			document.getElementById(item + "_amount").value = amount;
		}
	}	
}

function addToCart(item) {
	if ( canAddToCart ) {
		$('.cart').html(``);
		$('.cart').append(`<div id="cart_items" class="cart_window pr03125"></div>
		<button id="checkout_button" type="button" class="btn btn-blue checkout mr0625" data-bs-toggle="modal" data-bs-target="#paymentModal" disabled>${locales.translations.checkout}</button>`);
		canAddToCart = false;
	}
	var amount = document.getElementById(item + "_amount").value;
	if (amount == 0) {
		amount = 1;
	}
	var row = ``;
	var itemClass = '';
	var canAdd = true;

	for (let i = 0; i < cartList.length; i++) {

		if (cartList[i].name == item) {
			for (let j = 0; j < itemList.length; j++) {
				if (itemList[j].name == item) {
					cartList[i].amount = parseInt(cartList[i].amount) + parseInt(amount);
					if (itemList[j].amount >= cartList[i].amount) {
						canAdd = false
					} else {
						cartList[i].amount = parseInt(cartList[i].amount) - parseInt(amount);
						$.post('https://okokShop/action', JSON.stringify({
							action: "notEnoughAmount",
							amount: itemList[j].amount,
							label: itemList[j].label,
						}));
						canAdd = false
					}
				}
			}
		} else {
			canAdd = true
		}

	}	

	for (let i = 0; i < itemList.length; i++) {
		if ( cartList.length == 0 ) { itemClass = 'class="cart-item"' } else { itemClass = 'class="cart-item mt-2"' }

        if (itemList[i].name == item && canAdd) {
			if (itemList[i].amount < amount) {
				$.post('https://okokShop/action', JSON.stringify({
					action: "notEnoughAmount",
					amount: itemList[i].amount,
					label: itemList[i].label,
				}));
			}  else {
				document.getElementById(itemList[i].name + '_amount').setAttribute('readonly', true);
				document.getElementById(itemList[i].name + '-button-id').disabled = true;
				document.getElementById(itemList[i].name + '-button-id').innerHTML = locales.translations.onCart;
				document.getElementById(itemList[i].name + '_amount').value = '1';

				if (document.getElementById('cart_empty')) { document.getElementById('cart_empty').remove();}
				var price = itemList[i].price * amount;
				var itemName = itemList[i].label;
				if (itemName.length > 8) {
					itemName = itemName.substring(0, 8) + '...';
				}
				if (currencyOnLeft) {
					row += `
					<div id="${itemList[i].name}_cart_item"  ${itemClass}>
						<div class="cart-item_img-div">
							<img src="nui://${inventory}/${itemList[i].name}.png" class="item-img">
						</div>
						<div class="cart-item_info">
							<div class="cart-item_name">
								${itemName}
							</div>
							<div id="${itemList[i].name}-cart-price" class="cart-item_price">
								${currency} ${price}
							</div>
						</div>
						<input type="number" id="${itemList[i].name}-cart-amount" step="1" onchange="quantity_change(this)" class="cart-amount" value="${amount}" min="1" max="999" onkeyup="checkIfEmpty()" oninput="handleInputCart(this)">
						<div class="cart-remove" onClick="removeFromCart('${itemList[i].name}')"><i class="fa-solid fa-trash"></i></div>
					</div>
					`;
				} else {
					row += `
					<div id="${itemList[i].name}_cart_item"  ${itemClass}>
						<div class="cart-item_img-div">
							<img src="nui://${inventory}/${itemList[i].name}.png" class="item-img">
						</div>
						<div class="cart-item_info">
							<div class="cart-item_name">
								${itemName}
							</div>
							<div id="${itemList[i].name}-cart-price" class="cart-item_price">
								${price} ${currency}
							</div>
						</div>
						<input type="number" id="${itemList[i].name}-cart-amount" step="1" onchange="quantity_change(this)" class="cart-amount" value="${amount}" min="1" max="999" onkeyup="checkIfEmpty()" oninput="handleInputCart(this)">
						<div class="cart-remove" onClick="removeFromCart('${itemList[i].name}')"><i class="fa-solid fa-trash"></i></div>
					</div>
					`;
				}	
				new_item = {
					label: itemList[i].label,
					name: itemList[i].name,
					amount: amount,
					price: itemList[i].price * amount,
				}
				cartList.push(new_item);
				new_item = {};
				$.post('https://okokShop/action', JSON.stringify({
					action: "itemAddedToCart",
					amount: amount,
					label: itemList[i].label,
				}));
				cartPrice = cartPrice + itemList[i].price * amount
				if (playerCash >= cartPrice || playerBank >= cartPrice) {
					document.getElementById('checkout_button').disabled = false;
				} else {
					document.getElementById('checkout_button').disabled = true;
					document.getElementById('checkout_button').textContent = locales.translations.insufficientfunds;
				}
			}
        }
    };
	$('#cart_items').append(row);
}


function handleInputCart(inputElement) {
    var value = parseInt(inputElement.value);
	if ( oldValueCart != value ) {
		for (var i = 0; i < itemList.length; i++) {
			if (itemList[i].name == inputElement.id.replace('-cart-amount', '')) {
				var max = itemList[i].amount;
				if ( itemList[i].amount > 999 ) {
					max = 999;
				}		
			}
		}
		if (isNaN(value) || value < 1) {
			inputElement.value = oldValueCart;
		} else if (value > max) {
			inputElement.value = max;
		} else {
			oldValueCart = value;
			inputElement.value = value;
		}
	} else {
		inputElement.value = oldValueCart;
	} 
}

// Remove From Cart
function removeFromCart(item) {
	for (let i = 0; i < cartList.length; i++) {
		if (cartList[i].name == item) {
			var itemLabel = cartList[i].label;
			cartPrice = cartPrice - cartList[i].price;
			newItemAmount = document.getElementById(item + "-cart-amount").value;
			cartList.splice(i, 1);
			document.getElementById(item + "_cart_item").remove();
			document.getElementById(item + "-button-id").disabled = false;
			document.getElementById(item + "-button-id").innerHTML = locales.translations.addtocart;
			document.getElementById(item + '_amount').removeAttribute('readonly', false);
			$.post('https://okokShop/action', JSON.stringify({
				action: "itemRemovedFromCart",
				amount: newItemAmount,
				label: itemLabel,
			}));
		}
	}
	if (cartList.length >= 1 && document.getElementById(cartList[0].name + "_cart_item")) {
		document.getElementById(cartList[0].name + "_cart_item").classList.remove('mt-2');
	} 
	if (cartList.length == 0) {
		document.getElementById('checkout_button').disabled = true;
		$('.cart').html(``);
		$('.cart').append(`<div id="cart_empty" class="cart_window pr03125 cartempty">${locales.translations.emptycart}</div>
		<button id="checkout_button" type="button" class="btn btn-blue checkout mr0625" data-bs-toggle="modal" data-bs-target="#paymentModal" disabled>${locales.translations.checkout}</button>`);
		canAddToCart = true;
	}
	if (playerCash >= cartPrice || playerBank >= cartPrice) {
		document.getElementById('checkout_button').disabled = false;
		document.getElementById('checkout_button').textContent = locales.translations.checkout;
	} else {
		document.getElementById('checkout_button').disabled = true;
		document.getElementById('checkout_button').textContent = locales.translations.insufficientfunds;
	}
	newItemAmount = 0;
}	

// Change Quantity
function quantity_change(t) {
	var itemName = t.id.split('-')[0];
	var newValue = t.value;
	for (let i = 0; i < cartList.length; i++) {
		if (cartList[i].name == itemName) {
			for (let j = 0; j < itemList.length; j++) {
				if (itemList[j].name == itemName) {
					if (newValue == 0) {
						newValue = 1;
						document.getElementById(itemName + "-cart-amount").value = newValue;
					}
					newItemAmount = newValue;
					changeAmount = newItemAmount - cartList[i].amount;
					cartList[i].amount = newItemAmount;
					cartList[i].price = itemList[j].price * newItemAmount;
					document.getElementById(itemName + "-cart-amount").value = newItemAmount;
					if (document.getElementById(itemName + "-cart-price")) {
						document.getElementById(itemName + "-cart-price").innerHTML = cartList[i].price + ' ' + currency;
					} 
					$.post('https://okokShop/action', JSON.stringify({
						action: "amountChanged",
						newItemAmount: newItemAmount,
						label: itemList[j].label,
					}));

					if (changeAmount > 0) {
                        cartPrice += changeAmount * itemList[j].price;
                    } else {
                        cartPrice -= Math.abs(changeAmount) * itemList[j].price;
                    }
					if (playerCash >= cartPrice || playerBank >= cartPrice) {
						document.getElementById('checkout_button').disabled = false;
						document.getElementById('checkout_button').textContent = locales.translations.checkout;
					} else {
						document.getElementById('checkout_button').disabled = true;
						document.getElementById('checkout_button').textContent = locales.translations.insufficientfunds;
					}
				}
			}
		}
	}
}	

function clearCard() {
	if (client) {
		$('.cart').html(`<div id="cart_items" class="cart_window pr03125"></div>`);
		cartList = [];
		newItemAmount = 0;
	}
	openClientMenu();
}

$(document).on('click', "#checkout_button", function() {
	$('#payment_summary').html(``);
	$('#payment_summary_total').html(``);
	totalItems = 0;
	finalamount = 0;
	var row = ``;
	$('#summary_title').html(`${locales.translations.summary}`);
	for (let i = 0; i < cartList.length; i++) {
		finalamount += cartList[i].price;
		totalItems += cartList[i].amount;
		if (currencyOnLeft) {
			row += (`
			<div class="payment-item_list">
				<span class="item-payment">${cartList[i].label}</span>
				<span class="price-payment">${currency} ${cartList[i].price}</span>
			</div>
			`);
		} else {
			row += (`
			<div class="payment-item_list">
				<span class="item-payment">${cartList[i].label}</span>
				<span class="price-payment">${cartList[i].price} ${currency}</span>
			</div>
			`);
		}
	}
	$.post('https://okokShop/action', JSON.stringify({
		action: "checkMoneyAmount",
		finalAmount: finalamount,
	}));
	$('#payment_summary').append(row);
	if (currencyOnLeft) {
		$('#payment_summary_total').append(`
			<span class="total-text">${locales.translations.total}</span>
			<span class="total-price">${currency} ${finalamount}</span>
		`);
	} else {
		$('#payment_summary_total').append(`
			<span class="total-text">${locales.translations.total}</span>
			<span class="total-price">${finalamount} ${currency}</span>
		`);
	}
});

function finishPurchase() {
	$('.payment-btns_div').html(``);
	$('.payment-btns_div').append(`
	<button id="finish_purchase_cash" type="button" class="btn btn-blue pay" data-bs-dismiss="modal"><i class="fa-solid fa-wallet"></i> ${locales.translations.cash}</button>
	<button id="finish_purchase_bank" type="button" class="btn btn-blue pay" data-bs-dismiss="modal"><i class="bi bi-credit-card-fill"></i> ${locales.translations.card}</button>
	`);

	$('#paywith_title').html(`${locales.translations.paywith}`);

	if (moneyType == 'cash') {
		document.getElementById('finish_purchase_bank').disabled = true;
		
	} else if (moneyType == 'bank') {
		document.getElementById('finish_purchase_cash').disabled = true;

	} else if (moneyType == 'booth') {

	} else if (moneyType == 'none') {
		document.getElementById('finish_purchase_cash').disabled = true;
		document.getElementById('finish_purchase_bank').disabled = true;
	}

}

$('#paymentModal').on('hidden.bs.modal', function () {
	canBuy = true;
});



$(document).on('click', "#finish_purchase_cash", function() {
	if (!canBuy && owned) {
		$.post('https://okokShop/action', JSON.stringify({
			action: "cartUpdated"
		}));
	} else {
		$.post('https://okokShop/action', JSON.stringify({
			action: "purchaseItems",
			storeID: storeID,
			finalamount: finalamount,
			totalItems: totalItems,
			cartList: cartList,
			paymentMethod: "cash",
			owned: owned
		}));
	}
});

$(document).on('click', "#finish_purchase_bank", function() {
	if (!canBuy && owned) {
		$.post('https://okokShop/action', JSON.stringify({
			action: "cartUpdated"
		}));
	} else {
		$.post('https://okokShop/action', JSON.stringify({
			action: "purchaseItems",
			storeID: storeID,
			finalamount: finalamount,
			totalItems: totalItems,
			cartList: cartList,
			paymentMethod: "bank",
			owned: owned
		}));
	}
});

// Close Menu Functions


function abortTimer() {
	clearTimeout(tid);
}

function closeMenu() {
	isMenuOpened = false;
	cartPrice = 0;
	var time = 300
	abortTimer();
	if (selectedWindow == "buyBusiness") {
		$("#buyBusinessModal").modal('hide');
		selectedWindow = "";
		time = 0;
		$.post('https://okokShop/action', JSON.stringify({
			action: "close",
		}));
	}

	if (selectedWindow != "" && selectedWindow != "buy_menu") {
		$('.loading').fadeIn();
		$('.loadingtxt').html(`${locales.translations.loggingout}`);
		time = 300
	} 

	if (selectedWindow == "buy_menu") {
		$('.buy_menu').fadeOut();
		selectedWindow = "";
		time = 0
		setTimeout(function() {
			$('.cart').html(`<div id="cart_items" class="cart_window pr03125"></div>`);
			cartList = [];
			newItemAmount = 0;
		}, 300);
	}
	
	setTimeout(function() {
		if (selectedWindow == "loading") {
			$(".loading").fadeOut();
		} else if (selectedWindow == "overview") {
			$(".overview").fadeOut();
		} else if (selectedWindow == "stock") {
			$(".stock").fadeOut();
		}  else if (selectedWindow == "orders") {
			$(".orders").fadeOut();
		} else if (selectedWindow == "employees") {
			$(".employees").fadeOut();
		} else if (selectedWindow == "saleshistory") {
			$(".sales").fadeOut();
		}

		selectedWindow = "";

		setTimeout(function() {
			$('.loading').fadeOut();
			$.post('https://okokShop/action', JSON.stringify({
				action: "close",
			}));
			setTimeout(function() {
				$('.loadingtxt').html(`${locales.translations.loadingdata}`);
			}, 700);
		}, time);
	}, time);

	setTimeout(function(){
		$('.modal').modal('hide');
	}, time);
}

// Close Menu

$(document).on('click', "#close_overview", function() {
	closeMenu();
});

// On Esc Key

$(document).ready(function() {
	document.onkeyup = function(data) {
		if (data.which == 27) {
			closeMenu();
		}
	};
});	


// Edit Item Modal

$(document).on('click', "#edit_item", function() {
	$.post('https://okokShop/action', JSON.stringify({
		action: "changeItemPrice",
		storeID: storeID,
		itemName: modalItemName,
		itemLabel: modalItemLabel,
		itemNewPrice: document.getElementById("item_price").value
	}));
	setTimeout(function() {
		document.getElementById("item_price").value = '';
	}, 200);
});

// Buy Business Modals

$(document).on('click', "#buybusiness_btn_modal", function() {
	$.post('https://okokShop/action', JSON.stringify({
		action: "buyBusiness"
	}));
});

$(document).on('click', "#closeBuyBusinessButton", function() {
	$.post('https://okokShop/action', JSON.stringify({
		action: "close",
	}));
});

$(document).on('click', "#closeBuyBusinessModal", function() {
	$.post('https://okokShop/action', JSON.stringify({
		action: "close",
	}));
});


// Sell Business Modals

$(document).on('click', "#sellbusiness_button_modal", function() {
	closeMenu();
	$.post('https://okokShop/action', JSON.stringify({
		action: "sellBusiness",
		storeID: storeID,
		businessPrice: businessPrice
	}));
});


// Hire Players Modal

$(document).on('click', "#hireEmployeeButton", function() {
	$.post('https://okokShop/action', JSON.stringify({
		action: "getClosePeople",
	}));
});

document.getElementById("dropdown_to_hire").addEventListener("change", function() {
	var hireValue = document.getElementById("dropdown_to_hire").value;
	if (hireValue != 0) {
		document.getElementById("confirmHireEmployee").removeAttribute("disabled");
	} else if (hireValue == 0) {
		document.getElementById("confirmHireEmployee").setAttribute("disabled", "disabled");
	}
  });

$(document).on('click', "#confirmHireEmployee", function() {
	var hiredPerson = document.getElementById('dropdown_to_hire').value
	$.post('https://okokShop/action', JSON.stringify({
		action: "hireEmployee",
		hiredPerson: hiredPerson,
		storeID: storeID,
	}));
});


// Fire Player Modal

$(document).on('click', "#fire_employee", function() {
	$.post('https://okokShop/action', JSON.stringify({
		action: "fireEmployee",
		storeID: storeID,
		employeeID: employeeID,
	}));
});


// Fire Myself Modal

$(document).on('click', "#firemyself_button_modal", function() {
	$.post('https://okokShop/action', JSON.stringify({
		action: "fireMyself",
		storeID: storeID,
		employeeCitizen: employeeCitizen,
		firstOwner: firstOwner
	}));
	closeMenu();
});

// Edit Employees Modal

document.getElementById("dropdownRanks").addEventListener("change", function() {
	rank = document.getElementById("dropdownRanks").value;
	if (rank != 0) {
		document.getElementById("edit_employee").removeAttribute("disabled");
	} else if (rank == 0) {
		document.getElementById("edit_employee").setAttribute("disabled", "disabled");
	}
  });

$(document).on('click', "#edit_employee", function() {
	$.post('https://okokShop/action', JSON.stringify({
		action: "editEmployee",
		storeID: storeID,
		employeeID: employeeID,
		employeeRank: rank,
	}));
	document.getElementById("edit_employee").setAttribute("disabled", "disabled");
});

// Deposit Modals

$(document).on('click', "#depositModal", function() {
	$('#depositModal').fadeIn();
});

$('#depositModal').on('hidden.bs.modal', function() {
	$("#deposit_money").val("");
})

$(document).on('click', "#deposit", function() {

	if (document.getElementById("deposit_money").value > 0) {
		$.post('https://okokShop/action', JSON.stringify({
			action: "depositMoney",
			companyID: storeID,
			amount: document.getElementById("deposit_money").value,
			storeMoney: storeMoney
		}));
	}
});


// Withdraw Modals

$(document).on('click', "#withdrawModal", function() {
	$('#withdrawModal').fadeIn();
});

$('#withdrawModal').on('hidden.bs.modal', function() {
	$("#withdraw_money").val("");
})

$(document).on('click', "#withdraw", function() {

	if (document.getElementById("withdraw_money").value > 0) {
		$.post('https://okokShop/action', JSON.stringify({
			action: "withdrawMoney",
			companyID: storeID,
			amount: document.getElementById("withdraw_money").value,
			storeMoney: storeMoney
		}));
	}
});


// Orders Modal

document.getElementById("dropdownOrders").addEventListener("change", function() {
	var orderNamex = document.getElementById("dropdownOrders").value;
	var orderAmount = document.getElementById("order_amount").value;
	for (var i = 0; i < itemsList.length; i++) {
		if (itemsList[i].name == orderNamex) {
			orderName = itemsList[i].name
			orderAmount = orderAmount
			orderPrice = itemsList[i].stockPrice * stockOffPercentage
			orderLabel = itemsList[i].label
		}
	}
});

document.getElementById("order_amount").addEventListener("input", function() {
	var orderAmount = document.getElementById("order_amount").value;
	var confirmButton = document.getElementById("new_order");
	if (orderAmount > 0) {
		confirmButton.innerHTML = locales.translations.confirm + ' (<strong>' + (orderPrice * orderAmount).toFixed(2) + '' + currency + '</strong>)';
	} else {
		confirmButton.innerHTML = locales.translations.confirm + ' (<strong>0.00' + currency + '</strong>)';
	}
});

$('#newOrderModal').on('hidden.bs.modal', function() {
	$("#dropdownOrders").val(0);
	$("#order_amount").val("");
	document.getElementById("new_order").innerHTML = locales.translations.confirm + ' (<strong>0.00€</strong>)';
	document.getElementById('new_order').disabled = true;
})

$(document).on('click', "#new_order", function() {
	var orderAmount = document.getElementById("order_amount").value;
	orderAmount = orderAmount
	orderPrice = ( orderPrice * orderAmount )
	$.post('https://okokShop/action', JSON.stringify({
		action: "newOrder",
		orderName: orderName,
		orderLabel: orderLabel,
		orderAmount: orderAmount,
		orderPrice: orderPrice,
		storeID: storeID,
		StoreMoney: storeMoney,
	}));
	setTimeout(function() {
		orderList();
		document.getElementById("order_amount").value = '';
	}, 200);
});

$(document).on('click', "#increase_capacity", function() {
	$.post('https://okokShop/action', JSON.stringify({
		action: "increaseCapacity",
		storeID: storeID,
		currentStock: currentStock,
		maxStock: maxStock,
		stockToUpdate: stockToUpdate,
		stockToUpdatePrice: stockToUpdatePrice,
		storeMoney: storeMoney

	}));
});


// Page Changes

$(document).on('click', "#overview_page", function() {
	$('.orders, .employees, .sales, .stock').hide();
	openOverview();
	$('.overview').show();

});

$(document).on('click', "#orders_page", function() {
	$('.overview, .employees, .sales, .stock').hide();
	openOrders();
	$('.orders').show();

});

$(document).on('click', "#employees_page", function() {
	$('.orders, .overview, .sales, .stock').hide();
	openEmployees();
	$('.employees').show();
});

$(document).on('click', "#saleshistory_page", function() {
	$('.orders, .overview, .employees, .stock').hide();
	openSalesHistory();
	$('.sales').show();
});

$(document).on('click', "#stock_page", function() {
	$('.orders, .overview, .employees, .sales').hide();
	openStock();
	$('.stock').show();
});