Locales['en'] = {

    -- TextUI

    ['buy_business'] = {
        text = '[E] Buy ${road} ${name} for ${price}' .. Config.Currency,
        color = 'darkblue',
        side = 'right'
    },

    ['access_business'] = {
        text = '[E] Open ${name}',
        color = 'darkblue',
        side = 'right'
    },

    ['get_item'] = {
        text = '[E] Pick up the box',
        color = 'darkblue',
        side = 'right'
    },

    ['put_item'] = {
        text = '[E] Put the box in the van',
        color = 'darkblue',
        side = 'right'
    },

    ['finish_mission'] = {
        text = '[E] Finish mission',
        color = 'darkblue',
        side = 'right'
    },

    -- Requests

    ['hired_requests'] = {
        text = 'Do you want to be hired by',
    },

    -- Error Notifications

    ['something_wrong'] = {
        title = 'Shop',
        text = 'Something went wrong, try again later',
        type = 'error',
        time = 5000,
    },

    ['not_enough_money'] = {
        title = 'Shop',
        text = 'You don\'t have enough money',
        type = 'error',
        time = 5000,
    },

    ['not_enough_money_business'] = {
        title = 'Shop',
        text = 'You don\'t have enough money on the business',
        type = 'error',
        time = 5000,
    },

    ['not_enough_money_order'] = {
        title = 'Shop',
        text = 'The store doesn\'t have enough money to pay the order',
        type = 'error',
        time = 5000,
    },

    ['max_stores'] = {
        title = 'Shop',
        text = 'You have reached the maximum of stores owned',
        type = 'error',
        time = 5000,
    },

    ['near_error'] = {
        title = 'Shop',
        text = 'No one nearby',
        type = 'error',
        time = 5000,
    },

    ['already_employee'] = {
        title = 'Shop',
        text = '${name} is already employed at your Shop',
        type = 'error',
        time = 5000,
    },

    ['max_employees'] = {
        title = 'Shop',
        text = 'You can\'t hire ${name} because you reached the max of ${max} employees at the Shop',
        type = 'error',
        time = 5000,
    },

    ['cant_hire_yourself'] = {
        title = 'Shop',
        text = 'You can\'t hire yourself',
        type = 'error',
        time = 5000,
    },

    ['change_own_grade'] = {
        title = 'Shop',
        text = 'You can\'t change your own grade',
        type = 'error',
        time = 5000,
    },

    ['employee_not_exist'] = {
        title = 'Shop',
        text = 'That employee doesn\'t exist',
        type = 'error',
        time = 5000,
    },

    ['got_fired'] = {
        title = 'Shop',
        text = 'You got fired from ${store_name}',
        type = 'error',
        time = 5000,
    },

    ['fired_himself'] = {
        title = 'Shop',
        text = '${playerName} fired himself',
        type = 'error',
        time = 5000,
    },

    ['more_than_max_stock'] = {
        title = 'Shop',
        text = 'You can\'t order ${amount}x ${name} because the max stock of your shop is ${maxStock}',
        type = 'error',
        time = 5000,
    },

    ['max_stock'] = {
        title = 'Shop',
        text = 'You can\'t make that update because the max stock is ${maxStock}',
        type = 'error',
        time = 5000,
    },

    ['only_one_order'] = {
        title = 'Shop',
        text = 'You can\'t accept a order while you have one active',
        type = 'error',
        time = 5000,
    },

    ['order_canceled'] = {
        title = 'Shop',
        text = 'You canceled the order',
        type = 'error',
        time = 5000,
    },

    ['order_limit_reached'] = {
        title = 'Shop',
        text = 'You can\'t order more than ${amount} items at the same time',
        type = 'error',
        time = 5000,
    },

    ['too_far'] = {
        title = 'Shop',
        text = 'You are too far from the suplier',
        type = 'error',
        time = 5000,
    },

    ['far_from_trunk'] = {
        title = 'Shop',
        text = 'You are too far from the trunk',
        type = 'error',
        time = 5000,
    },

    ['out_of_vehicle'] = {
        title = 'Shop',
        text = 'You need to get out of the vehicle',
        type = 'error',
        time = 5000,
    },
    
    ['doors_closed'] = {
        title = 'Shop',
        text = 'The vehicle trunk is closed',
        type = 'error',
        time = 5000,
    },

    ['max_price_change'] = {
        title = 'Shop',
        text = 'The max price you can set to ${itemLabel} is ${maxPrice}' .. Config.Currency,
        type = 'error',
        time = 5000,
    },

    ['min_price_change'] = {
        title = 'Shop',
        text = 'The min price you can set to ${itemLabel} is ${minPrice}' .. Config.Currency,
        type = 'error',
        time = 5000,
    },

    ['item_removed'] = {
        title = 'Shop',
        text = 'You removed ${amount}x ${label} from the cart',
        type = 'error',
        time = 5000,
    },

    ['item_removed_client'] = {
        title = 'Shop',
        text = 'Removed ${amount}x ${label} from cart because someone bought it',
        type = 'error',
        time = 5000,
    },

    ['cart_updated'] = {
        title = 'Shop',
        text = 'You can\'t conclude the purchase because the item is no longer available',
        type = 'error',
        time = 5000,
    },

    ['pockets_full'] = {
        title = 'Shop',
        text = 'You can\'t carry that many items in your inventory',
        type = 'error',
        time = 5000,
    },

    ['item_unavailable'] = {
        title = 'Shop',
        text = 'The item ${name} doesn\'t exist',
        type = 'error',
        time = 5000,
    },

    ['exploit_detected_item'] = {
        title = 'Shop',
        text = 'You tried to exploit the receiving item',
        type = 'error',
        time = 5000,
    },

    ['exploit_detected_money'] = {
        title = 'Shop',
        text = 'You tried to exploit the item price',
        type = 'error',
        time = 5000,
    },

    -- Success Notifications

    ['bought_store'] = {
        title = 'Shop',
        text = 'You bought the ${name} for ${price}' .. Config.Currency,
        type = 'success',
        time = 5000,
    },

    ['money_deposited'] = {
        title = 'Shop',
        text = 'You deposited ${money}' .. Config.Currency .. ' into the business',
        type = 'success',
        time = 5000,
    },

    ['money_withdrawn'] = {
        title = 'Shop',
        text = 'You withdrawn ${money}' .. Config.Currency .. ' from the business',
        type = 'success',
        time = 5000,
    },

    ['sold_business'] = {
        title = 'Shop',
        text = 'You sold the business for ${money}' .. Config.Currency,
        type = 'success',
        time = 5000,
    },

    ['change_rank'] = {
        title = 'Shop',
        text = 'You changed the rank of ${name} to ${job}',
        type = 'success',
        time = 5000,
    },

    ['got_hired'] = {
        title = 'Shop',
        text = 'You were hired for the ${store_name}',
        type = 'success',
        time = 5000,
    },

    ['success_hired'] = {
        title = 'Shop',
        text = 'You hired ${hired_name}',
        type = 'success',
        time = 5000,
    },

    ['success_fired'] = {
        title = 'Shop',
        text = 'You fired ${fired_name}',
        type = 'success',
        time = 5000,
    },

    ['fired_yourself'] = {
        title = 'Shop',
        text = 'You successfully fired yourself',
        type = 'success',
        time = 5000,
    },

    ['ordered_success'] = {
        title = 'Shop',
        text = 'You placed an order for ${amount}x ${item} for ${price}' .. Config.Currency,
        type = 'success',
        time = 5000,
    },

    ['order_completed'] = {
        title = 'Shop',
        text = 'You successfully finished the order and received ${reward}' .. Config.Currency,
        type = 'success',
        time = 5000,
    },

    ['vehicle_filled'] = {
        title = 'Shop',
        text = 'You got all the packages, go back to the shop',
        type = 'success',
        time = 5000,
    },

    ['changed_item_price'] = {
        title = 'Shop',
        text = 'You changed the price of ${itemLabel} to ${price}' .. Config.Currency,
        type = 'success',
        time = 5000,
    },

    ['updated_stock'] = {
        title = 'Shop',
        text = 'You updated the max stock from ${maxStock} to ${maxStockUpdated} for ${price} ' .. Config.Currency,
        type = 'success',
        time = 5000,
    },

    ['item_added'] = {
        title = 'Shop',
        text = 'You added ${amount}x ${label} to the cart',
        type = 'success',
        time = 5000,
    },
    
    ['purchased_success'] = {
        title = 'Shop',
        text = 'Your purchase was successful, you paid ${price}' .. Config.Currency,
        type = 'success',
        time = 5000,
    },

    -- Info Notifications

    ['start_mission'] = {
        title = 'Shop',
        text = 'Go to the vehicle to start the mission',
        type = 'info',
        time = 5000,
    },

    ['mission_location'] = {
        title = 'Shop',
        text = 'Go to the location marked on your map',
        type = 'info',
        time = 5000,
    },

    ['pick_another_box'] = {
        title = 'Shop',
        text = 'Box added to the vehicle, go get another box',
        type = 'info',
        time = 5000,
    },
    
    ['put_box_truck'] = {
        title = 'Shop',
        text = 'Put the box in the truck',
        type = 'info',
        time = 5000,
    },

    ['doors_open'] = {
        title = 'Shop',
        text = 'The vehicle back doors have to be opened',
        type = 'info',
        time = 5000,
    },

    ['amount_changed'] = {
        title = 'Shop',
        text = 'You changed the amount of ${label} to ${amount}x',
        type = 'info',
        time = 5000,
    },

    -- UI
    
    ['translations'] = {
        menu = 'Menu',
        overview = 'Overview',
        stock = 'Stock',
        orders = 'Orders',
        price = 'Price',
        employees = 'Employees',
        saleshistory = 'Sales History',
        logout = 'Logout',
        finances = 'Finances',
        deposit = 'Deposit',
        withdraw = 'Withdraw',
        items = 'Items',
        totalcapacity = 'Total Capacity',
        mostsolditems = 'Most Sold Items',
        balance = 'Balance',
        sellbusiness = 'Sell Business',
        buybusiness = 'Buy Business',
        stockalert = 'Stock Alert',
        search = 'Search...',
        noentriesfound = 'No entries found',
        noresults = 'No results match your search query',
        selectorder = 'Select an order',
        neworder = 'New Order',
        quitjob = 'Quit Job',
        accept = 'ACCEPT',
        cancel = 'CANCEL',
        accepted = 'ACCEPTED',
        edit = 'EDIT',
        item = 'Item',
        amount = 'Amount',
        reward = 'Reward',
        employee = 'Employee',
        actions = 'Actions',
        owner = 'Owner',
        name = 'Name',
        grade = 'Grade',
        totalorders = 'Total Orders',
        hireemployee = 'Hire Employee',
        maxstock = 'Reached Max Stock',
        selectuser = 'Select a Person',
        loggingout = 'Logging out...',
        loadingdata = 'Loading Data...',
        fireemployee = 'Do you want to fire',
        buyer = 'Buyer',
        date = 'Date',
        totalsold = 'Total Sold',
        stockgood = 'Stock is good',
        lowstock = 'needs restock',
        confirm = 'Confirm',
        areyousure = 'Are you sure?',
        doyouwanttobuy = 'Do you want to buy',
        sellbusinessfor = 'Do you want to sell the business for',
        buyfor = 'for',
        cancelbutton = 'Cancel',
        buybutton = 'Buy',
        sellbutton = 'Sell',
        firebutton = 'Fire',
        firemyself = 'Do you want to fire yourself?',
        depositmoney = 'Deposit Money',
        withdrawmoney = 'Withdraw Money',
        increasecapacity = 'Increase Capacity',
        fireemployeetitle = 'Fire Employee',
        editemployee = 'Edit Employee',
        edititem = 'Edit Item',
        save = 'Save',
        hire = 'Hire',
        currentprice = 'Current Price',
        newprice = 'New Price',
        none = 'None',
        addtocart = 'Add to Cart',
        outofstock = 'Out of Stock',
        emptycart = 'Your Cart is Empty',
        onCart = 'On Cart',
        notOwnedShopName = '24/7',
        checkout = 'Checkout',
        summary = 'Summary',
        total = 'TOTAL',
        paywith = 'Pay with',
        cash = 'Cash',
        card = 'Card',
        boughtitems = 'Bought Items',
        shop = 'Shop',
        insufficientfunds = 'Insufficient Funds',
        open = "Open",
        manage = "Manage",
    },
}