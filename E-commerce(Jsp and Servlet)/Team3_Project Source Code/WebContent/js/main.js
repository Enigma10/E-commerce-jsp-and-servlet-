/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function login() {
    var xhr = new XMLHttpRequest();
    //Apply http POST method to upload content to the sever
    var username = document.getElementById("username").value;
    var pwd = document.getElementById("password").value;
    if (username === "" || pwd === "") {
        alert("Enter username and password");
    } else {
        if (document.getElementById("employee").checked) {
            xhr.open("POST", "EmployeeCheck?employee_id=" + username + "&password=" + pwd, true);
            xhr.send();
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4) {
                    var res = xhr.response;
                    if (res == 0) {
                        alert("Wrong userName or password!");
                    } else {
                        // Save it
                        window.location.href = "EmployeeLogin?" + res;
                    }
                }
            };
        } else if (document.getElementById("customer").checked) {
            xhr.open("POST", "CustomerCheck?customer_id=" + username + "&password=" + pwd, true);
            xhr.send();
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4) {
                    var res = xhr.response;
                    if (res == 0) {
                        alert("Wrong userName or password!");
                    } else {
                        // Save it
                        window.location.href = "CustomerLogin?" + res;
                    }
                }
            };
        } else if (document.getElementById("admin").checked) {
            xhr.open("POST", "AdminCheck?manager_id=" + username + "&password=" + pwd, true);
            xhr.send();
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4) {
                    var res = xhr.response;
                    if (res == 0) {
                        alert("Wrong userName or password!");
                    } else {
                        // Save it
                        window.location.href = "AdminLogin?" + res;
                    }
                }
            };
        } else {
            alert("select your type!");
        }
    }
}

function updateCustomer() {
    var xhr = new XMLHttpRequest();
    //Apply http POST method to upload content to the sever
    var employee_name = document.getElementById("employee_name").value;
    var employee_id = document.getElementById("employee_id").value;
    var city = document.getElementById("city").value;
    var street = document.getElementById("street").value;
    var state = document.getElementById("state").value;
    var zipCode = document.getElementById("zipCode").value;
    var address_id = document.getElementById("address_id").value;
    if (employee_name === "") {
        alert("Employee name can't be empty");
    }
    else if (employee_id === "") {
        alert("employee_id name can't be empty");
    }
    else if (city === "") {
        alert("city name can't be empty");
    }
    else if (street === "") {
        alert("street name can't be empty");
    }
    else if (state === "") {
        alert("state name can't be empty");
    }
    else if (zipCode === "") {
        alert("zipCode name can't be empty");
    }
    else if (address_id === "") {
        alert("address_id name can't be empty");
    } else {
        xhr.open("POST", "../UpdateEmployee?employee_id=" + employee_id + "&employee_name=" + employee_name
                + "&city=" + city + "&street=" + street + "&state=" + state + "&zipCode=" + zipCode + "&address_id=" + address_id, true);
        xhr.send();
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                var res = xhr.response;
                if (res == -1) {
                    window.location.href = "../index.jsp";
                }
                if (res == 1) {
                    alert("Update Success");
                }
                else if (res == 0) {
                    alert("Update Fail");
                }
            }
        };
    }
}

function addProduct() {
    var xhr = new XMLHttpRequest();
    var product_name = document.getElementById("addProductName").value;
    var inventory_amount = document.getElementById("addInventoryAmount").value;
    var product_price = document.getElementById("addProductPrice").value;
    var c = document.getElementById("AddProductCategory");
    var category_id = c.options[c.selectedIndex].value;
    var buying_price = document.getElementById("addBuyingPrice").value;
    if (product_name === "") {
        alert("Product name can't be empty");
    }
    else if (inventory_amount === "") {
        alert("inventory amount can't be empty");
    }
    else if (product_price === "") {
        alert("product price can't be empty");
    }
    else if (category_id === "") {
        alert("category can't be empty");
    }
    else if (buying_price === "") {
        alert("buying price can't be empty");
    } else {
        xhr.open("POST", "../AddProduct?product_name=" + product_name + "&inventory_amount=" + inventory_amount
                + "&price=" + product_price + "&category_id=" + category_id + "&buying_price=" + buying_price, true);
        xhr.send();
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                var res = xhr.response;
                alert(res);
                if (res == -1) {
                    window.location.href = "../index.jsp";
                }
                if (res == 1) {
                    displayProduct(res, 2);
                }
                else if (res == 0) {
                    alert("Add Fail");
                }
            }
        };
    }
}

function deleteProduct(id) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "../DeleteProduct?product_id=" + id, true);
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            var res = xhr.response;
            if (res == -1) {
                window.location.href = "../index.jsp";
            }
            if (res == 1) {
                //delete
                alert("Delete Success");
            }
            else if (res == 0) {
                alert("Delete Fail");
            }
        }
    };
}

function showProduct(id) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "../SearchProductById?product_id=" + id, true);
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            var res = xhr.response;
            if (res == 0) {
                alert("Fail");
            } else {
                var product = JSON.parse(res);
                document.getElementById("update_product_id").value = product.product_id;
                document.getElementById("update_product_name").value = product.product_name;
                document.getElementById("update_inventory_amount").value = product.inventory_amount;
                document.getElementById("update_price").value = product.price;
                document.getElementById("update_buying_price").value = product.buying_price;
            }
        }
    };
}

function updateProduct() {
    var xhr = new XMLHttpRequest();
    var product_id = document.getElementById("update_product_id").value;
    var product_name = document.getElementById("update_product_name").value;
    var inventory_amount = document.getElementById("update_inventory_amount").value;
    var price = document.getElementById("update_price").value;
    var c = document.getElementById("update_category");
    var category_id = c.options[c.selectedIndex].value;
    var buying_price = document.getElementById("update_buying_price").value;
    if (product_name === "") {
        alert("Product name can't be empty");
    }
    else if (inventory_amount === "") {
        alert("inventory amount can't be empty");
    }
    else if (price === "") {
        alert("product price can't be empty");
    }
    else if (category_id === "") {
        alert("category can't be empty");
    }
    else if (buying_price === "") {
        alert("buying price can't be empty");
    } else {
        xhr.open("POST", "../UpdateProduct?product_name=" + product_name + "&inventory_amount=" + inventory_amount
                + "&price=" + price + "&category_id=" + category_id + "&buying_price=" + buying_price +
                "&product_id=" + product_id, true);
        xhr.send();
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                var res = xhr.response;
                //alert(res);
                if (res == -1) {
                    window.location.href = "../index.jsp";
                }
                if (res == 1) {
                    alert("Update success");
                }
                else if (res == 0) {
                    alert("Update Fail");
                }
            }
        };
    }
}


function addCategory() {
    var xhr = new XMLHttpRequest();
    var category_name = document.getElementById("add_category_name").value;
    if (category_name === "") {
        alert("category name can't be empty");
    } else {
        xhr.open("POST", "../AddCategory?category_name=" + category_name, true);
        xhr.send();
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                var res = xhr.response;
                //alert(res);
                if (res == -1) {
                    window.location.href = "../index.jsp";
                }
                if (res == 1) {
                    //alert(res);
                    alert("Add Sucess. Please Reload the page")
                }
                else if (res == 0) {
                    alert("Add Fail");
                }
            }
        };
    }
}

function deleteCategory(id) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "../DeleteCategory?category_id=" + id, true);
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            var res = xhr.response;
            if (res == -1) {
                window.location.href = "../index.jsp";
            }
            if (res == 1) {
                //delete
                alert("Delete Success");
            }
            else if (res == 0) {
                alert("Delete Fail");
            }
        }
    };
}

function showCategory(id) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "../SearchCategoryById?category_id=" + id, true);
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            var res = xhr.response;
            if (res == 0) {
                alert("Fail");
            } else {
                var category = JSON.parse(res);
                document.getElementById("update_category_id").value = category.category_id;
                document.getElementById("update_category_name").value = category.category_name;
            }
        }
    };
}

function updateCategory() {
    var xhr = new XMLHttpRequest();
    var category_id = document.getElementById("update_category_id").value;
    var category_name = document.getElementById("update_category_name").value;
    if (category_name === "") {
        alert("Category name can't be empty");
    } else {
        xhr.open("POST", "../UpdateCategory?category_id=" + category_id + "&category_name=" + category_name, true);
        xhr.send();
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                var res = xhr.response;
                if (res == -1) {
                    window.location.href = "../index.jsp";
                }
                if (res == 1) {
                    alert("Update success");
                }
                else if (res == 0) {
                    alert("Update Fail");
                }
            }
        };
    }
}

function addCustomer() {
    var xhr = new XMLHttpRequest();
    var customer_name = document.getElementById("add_customer_name").value;
    var street = document.getElementById("add_street").value;
    var city = document.getElementById("add_city").value;
    var state = document.getElementById("add_state").value;
    var zipCode = document.getElementById("add_zipcode").value;
    var type = document.getElementById("home").checked;
    if (type) {
        var m = document.getElementById("add_marriage_status");
        var marriage_status = m.options[m.selectedIndex].value;
        var g = document.getElementById("add_gender");
        var gender = g.options[g.selectedIndex].value;
        var age = document.getElementById("add_age").value;
        var income = document.getElementById("add_income").value;
        if (customer_name === "") {
            alert("category name can't be empty");
        } else if (street === "") {
            alert("street can't be empty");
        } else if (city === "") {
            alert("city can't be empty");
        } else if (state === "") {
            alert("state can't be empty");
        } else if (zipCode === "") {
            alert("zipCode can't be empty");
        } else if (marriage_status === "") {
            alert("marriage_status can't be empty");
        } else if (gender === "") {
            alert("gender can't be empty");
        } else if (age === "") {
            alert("age can't be empty");
        } else if (income === "") {
            alert("income can't be empty");
        } else {
            xhr.open("POST", "../AddCustomer?customer_name=" + customer_name + "&street=" + street +
                    "&city=" + city + "&state=" + state + "&zipCode=" + zipCode + "&type=2" + "&marriage_status=" + marriage_status
                    + "&gender=" + gender + "&age=" + age + "&income=" + income, true);
            xhr.send();
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4) {
                    var res = xhr.response;
                    if (res == -1) {
                        window.location.href = "../index.jsp";
                    }
                    if (res == 1) {
                        //alert(res);
                        alert("Add Success. Please reload page");
                    }
                    else if (res == 0) {
                        alert("Add Fail");
                    }
                }
            };
        }
    } else {
        var business_category = document.getElementById("add_business_category").value;
        var income = document.getElementById("add_company_gross_income").value;
        if (customer_name === "") {
            alert("category name can't be empty");
        } else if (street === "") {
            alert("street can't be empty");
        } else if (city === "") {
            alert("city can't be empty");
        } else if (state === "") {
            alert("state can't be empty");
        } else if (zipCode === "") {
            alert("zipCode can't be empty");
        } else if (business_category === "") {
            alert("business category can't be empty");
        } else if (income === "") {
            alert("company gross income can't be empty");
        } else {
            xhr.open("POST", "../AddCustomer?customer_name=" + customer_name + "&street=" + street +
                    "&city=" + city + "&state=" + state + "&zipCode=" + zipCode + "&type=1" + "&business_category=" + business_category
                    + "&income=" + income, true);
            xhr.send();
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4) {
                    var res = xhr.response;
                    //alert(res);
                    if (res == -1) {
                        window.location.href = "../index.jsp";
                    }
                    if (res == 1) {
                        //alert(res);
                        alert("Add sucess. Please reload");
                    }
                    else if (res == 0) {
                        alert("Add Fail");
                    }
                }
            };
        }
    }
}

function showCustomer(id, type) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "../SearchCustomerById?customer_id=" + id + "&type=" + type, true);
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            var res = xhr.response;
            if (res == 0) {
                alert("Fail");
            } else {
                var customer = JSON.parse(res);
                if (customer.type == "1") {
                    $('#myModal_business').modal();
                    document.getElementById("update_customer_id").value = customer.customer_id;
                    document.getElementById("update_name").value = customer.customer_name;
                    document.getElementById("update_street").value = customer.address.street;
                    document.getElementById("update_city").value = customer.address.city;
                    document.getElementById("update_state").value = customer.address.state_;
                    document.getElementById("update_zipcode").value = customer.address.zipCode;
                    document.getElementById("update_business_category").value = customer.business_category;
                    document.getElementById("update_company_gross_income").value = customer.company_gross_income;
                    document.getElementById("update_type").value = "Busniess";
                }
                if (customer.type == "2") {
                    $('#myModal_home').modal();
                    document.getElementById("home_customer_id").value = customer.customer_id;
                    document.getElementById("home_name").value = customer.customer_name;
                    document.getElementById("home_street").value = customer.address.street;
                    document.getElementById("home_city").value = customer.address.city;
                    document.getElementById("home_state").value = customer.address.state_;
                    document.getElementById("home_zipcode").value = customer.address.zipCode;
                    document.getElementById("home_marriage_status").value = customer.marriage_status;
                    document.getElementById("home_gender").value = customer.gender;
                    document.getElementById("home_age").value = customer.age;
                    document.getElementById("home_income").value = customer.income;
                    document.getElementById("home_type").value = "Home";
                }
            }
        }
    };
}

function searchProduct(bag) {
    var xhr = new XMLHttpRequest();
    var product_id = document.getElementById("product_id").value;
    var product_name = document.getElementById("product_name").value;
    var p = document.getElementById("product_category");
    var product_category = p.options[p.selectedIndex].value;
    var price_from = document.getElementById("price_from").value;
    var price_to = document.getElementById("price_to").value;
    var str = "";
    if (product_id != "") {
        searchProductById(product_id, bag);
        return;
    }
    if (product_name != "") {
        str = str + "product_name=" + product_name + "&";
    }
    if (product_category != -1) {
        str = str + "category_id=" + product_category + "&";
    }
    if (price_from != "") {
        str = str + "up_price=" + price_from + "&";
    }
    if (price_to != "") {
        str = str + "down_price=" + price_to + "&";
    }
    if (str === "") {
        alert("You should enter one condition at least");
    } else {
        xhr.open("POST", "../SearchProduct?" + str, true);
        xhr.send();
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                var res = xhr.response;
                //alert(res);
                if (res == 0) {
                    document.getElementById("displayProductArea").innerHTML = "No results";
                    return;
                }
                var products = JSON.parse(res);
                document.getElementById("displayProductArea").innerHTML = "";
                for (var j = 0; j < products.length; j++) {
                    var product = products[j];
                    displayProduct(product, bag);
                }
            }
        };
    }
}

function searchProductById(id, bag) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "../SearchProductById?product_id=" + id, true);
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            var res = xhr.response;
            if (res == 0) {
                document.getElementById("displayProductArea").innerHTML = "No results";
                return;
            }
            //alert(res);
            var product = JSON.parse(res);
            if (product.product_id != null) {
                document.getElementById("displayProductArea").innerHTML = "";
                displayProduct(product, bag);
            }
        }
    };
}

function displayProduct(res, bag) {
    var tr = document.createElement("tr");
    var product_id = document.createElement("td");
    var node = document.createTextNode(res.product_id);
    product_id.appendChild(node);
    tr.appendChild(product_id);
    var product_name = document.createElement("td");
    var node = document.createTextNode(res.product_name);
    product_name.appendChild(node);
    tr.appendChild(product_name);
    var product_price = document.createElement("td");
    var node = document.createTextNode(res.price);
    product_price.appendChild(node);
    tr.appendChild(product_price);
    var product_category = document.createElement("td");
    var node = document.createTextNode(res.category.category_name);
    product_category.appendChild(node);
    tr.appendChild(product_category);
    var product_amount = document.createElement("td");
    var node = document.createTextNode(res.inventory_amount);
    product_amount.appendChild(node);
    tr.appendChild(product_amount);
    if (bag == 1) {
        var addbag = document.createElement("td");
        addbag.insertAdjacentHTML("beforeend", "<button type='button' class='btn btn-primary btn-sm' onclick='addToBag(" + res.product_id + ")'>" +
                "<span class='glyphicon glyphicon-plus'></span>Add to Bag</button>")
        tr.appendChild(addbag);
    }
    if (bag == 2) {
        var product_price = document.createElement("td");
        var node = document.createTextNode(res.buying_price);
        product_price.appendChild(node);
        tr.appendChild(product_price);
        tr.insertAdjacentHTML("beforeend", "<td>" +
                "<button type = 'button' class = 'btn btn-primary btn-sm' data-toggle='modal' data-target = '#myModal' onclick = 'showProduct(" + res.product_id + ")' >" +
                "<span class = 'glyphicon glyphicon-wrench' > </span>" +
                "</button>&nbsp" +
                "<button type = 'button' class = 'btn btn-primary btn-sm' onclick='deleteProduct(" + res.product_id + ")' >" +
                "<span class = 'glyphicon glyphicon-remove' > </span>" +
                "</button>" +
                "</td>")
    }
    document.getElementById("displayProductArea").appendChild(tr);
}

function searchCustomer() {
    var xhr = new XMLHttpRequest();
    var customer_id = document.getElementById("customer_id").value;
    var customer_name = document.getElementById("customer_name").value;
    var induvidual = document.getElementById("customer_type_individual");
    var business = document.getElementById("customer_type_business");
    var customer_type = -1;
    if (induvidual.checked) {
        customer_type = 2;
    }
    if (business.checked) {
        customer_type = 1;
    }
    var str = "";
    if (customer_id != "") {
        searchCustomerById(customer_id);
        return;
    }
    if (customer_type != -1) {
        str = str + "type=" + customer_type + "&";
    }
    if (customer_name != "") {
        str = str + "customer_name=" + customer_name + "&";
    }
    if (str === "") {
        alert("You should enter one condition at least");
    } else {
        xhr.open("POST", "../SearchCustomer?" + str, true);
        xhr.send();
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                var res = xhr.response;
                //alert(res);
                if (res == 0) {
                    document.getElementById("displayCustomerArea").innerHTML = "No results";
                    return;
                }
                var customers = JSON.parse(res);
                document.getElementById("displayCustomerArea").innerHTML = "";
                for (var j = 0; j < customers.length; j++) {
                    var customer = customers[j];
                    displayCustomer(customer);
                }
            }
        };
    }
}

function searchCustomerById(id) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "../SearchCustomerById?customer_id=" + id, true);
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            var res = xhr.response;
            //alert(res);
            if (res == 0) {
                document.getElementById("displayCustomerArea").innerHTML = "No results";
                return;
            }
            var customer = JSON.parse(res);
            if (customer.customer_id != null) {
                document.getElementById("displayCustomerArea").innerHTML = "";
                displayCustomer(customer);
            }
        }
    };
}

function displayCustomer(res) {
    var tr = document.createElement("tr");
    var customer_id_td = document.createElement("td");
    var node = document.createTextNode(res.customer_id);
    customer_id_td.appendChild(node);
    tr.appendChild(customer_id_td);
    var customer_name = document.createElement("td");
    var node = document.createTextNode(res.customer_name);
    customer_name.appendChild(node);
    tr.appendChild(customer_name);
    var node;
    var customer_type = document.createElement("td");
    if (res.type == 1) {
        node = document.createTextNode("Business");
    } else {
        node = document.createTextNode("Individual");
    }
    customer_type.appendChild(node);
    tr.appendChild(customer_type);
    tr.insertAdjacentHTML("beforeend", "<td><button type='button' class='btn btn-primary btn-sm' onclick='showCustomer(" + res.customer_id + "," + res.type + ")'>" +
            "<span class='glyphicon glyphicon-eye-open'></span>" +
            "</button></td>");
    document.getElementById("displayCustomerArea").appendChild(tr);
}

// add products into shopping bag
function addToBag(id) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "../SearchProductById?product_id=" + id, true);
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            var res = xhr.response;
            //alert(res);
            if (res == 0) {
                alert("Fail");
            } else {
                var s = sessionStorage.getItem("bag");
                //alert(s);
                var np = JSON.parse(res);
                //alert(np.product_id);
                if (s == null | s == "") {
                    sessionStorage.setItem("bag", "[" + res + "]");
                    alert("Add to Bag Success!");
                } else {
                    var bag = JSON.parse(s);
                    for (var i = 0; i < bag.length; i++) {
                        if (bag[i].product_id == np.product_id) {
                            alert("You already have this product in your bag");
                            return;
                        }
                    }
                    bag.push(np);
                    alert("Add to Bag Success!");
                    sessionStorage.setItem("bag", JSON.stringify(bag));
                }
            }
        }
        ;
    }
}

function showBag() {
    var bag = JSON.parse(sessionStorage.getItem("bag"));
    var tbady = document.getElementById("shoppingbagarea");
    if (bag != null) {
        for (var i = 0; i < bag.length; i++) {
            var p = bag[i];
            tbady.insertAdjacentHTML("beforeend", "<tr id='product_" + p.product_id + "'><td>" + p.product_id + "</td><td>" + p.product_name + "</td><td>" + p.price + "</td><td>" + p.category.category_name + "</td><td>" +
                    "<input type='button' value='-' onclick='modifyAmount(\"del\", " + p.product_id + ")'/>" +
                    "<input id='amount_box_" + p.product_id + "' type='text' value='1' size='1px'/>" +
                    "<input type='button' value='+' onclick='modifyAmount(\"add\", " + p.product_id + ")'/>" +
                    "</td><td><button type='button' class='btn btn-primary btn-sm' onclick='removeProductFromBag(" + p.product_id + ")'>" +
                    "<span class='glyphicon glyphicon-remove'></span></button></td></tr>");
        }
    }
    calculateTotalMoney();
}

function removeProductFromBag(id) {
    var bag = JSON.parse(sessionStorage.getItem("bag"));
    for (var i = 0; i < bag.length; i++) {
        var p = bag[i];
        if (p.product_id == id) {
            bag.splice(i, 1);
            var pr = document.getElementById("product_" + id);
            pr.parentNode.removeChild(pr);
        }
    }
    sessionStorage.setItem("bag", JSON.stringify(bag));
    calculateTotalMoney();
}

function checkout() {
    var xhr = new XMLHttpRequest();
    var customer_id = document.getElementById("customer_id").value;
    var salesperson_id = document.getElementById("salesperson_id").value;
    var bag = JSON.parse(sessionStorage.getItem("bag"));
    if (customer_id == "") {
        alert("Enter customer id first");
        return;
    }
    var s = "[";
    for (var i = 0; i < bag.length; i++) {
        var p = bag[i];
        var amount = document.getElementById("amount_box_" + p.product_id).value;
        s = s + "'" + p.product_id + "','" + amount + "','" + p.price + "',";
    }
    xhr.open("POST", "../AddTransaction?record_list=" + s + "]&customer_id=" + customer_id + "&salesperson_id=" + salesperson_id, true);
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            var res = xhr.response;
            //alert(res);
            if (res == -1) {
                window.location.href = "../index.jsp";
            }
            else if (res == -2) {
                alert("No enough inventory amount");
            }
            else if (res == -3) {
                alert("No such Customer");
            }
            else if (res == 0) {
                alert("Add Fail");
            } else {
                alert("amout = " + res);
                sessionStorage.setItem("bag", "");
                var tbady = document.getElementById("shoppingbagarea");
                tbady.innerHTML = "";
                calculateTotalMoney();
            }
        }
    };
}

function calculateTotalMoney() {
    var bag = JSON.parse(sessionStorage.getItem("bag"));
    var total = 0;
    //alert(1);
    for (var i = 0; i < bag.length; i++) {
        var p = bag[i];
        var amount = document.getElementById("amount_box_" + bag[i].product_id).value;
        //alert(amount);
        total += p.price * amount;
    }
    var totalDisplay = document.getElementById("totle_money");
    totalDisplay.value = total;
}

//add or minus the amount of products in shopping bag
function modifyAmount(str, id) {
    var amount = null;
    var amount_box_id = "amount_box_" + id;
    if (str == "add") {
        var t = document.getElementById(amount_box_id);
        var amount = parseInt(t.value);
        t.value = amount + 1;
        calculateTotalMoney();
    }
    if (str == "del") {
        var t = document.getElementById(amount_box_id);
        var amount = parseInt(t.value);
        if (amount > 1)
            t.value = amount - 1;
        calculateTotalMoney();
    }
}


function showTransaction(id) {
    var xhr = new XMLHttpRequest();
    var recordDisplay = document.getElementById("recordDisplay");
    recordDisplay.innerHTML = "";
    xhr.open("POST", "../SearchRecordByTransactionID?transaction_id=" + id, true);
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            var res = xhr.response;
            if (res == 0) {
                alert("Fail");
            } else {
                var records = JSON.parse(res);
                //alert(res);
                if (records != null) {
                    for (var i = 0; i < records.length; i++) {
                        var record = records[i];
                        recordDisplay.insertAdjacentHTML("beforeend", "<tr><td>" + record.product_id + "</td>\n\
                                <td>" + record.product.product_name + "</td>\n\
                                <td>" + record.amount + "</td>\n\
                                <td>" + record.price + "</td></tr>")
                    }
                }
            }
        }
    };
}

function searchEmployeeById() {
    var employee_id = document.getElementById("search_employee_id").value;
    if (employee_id == "") {
        alert("enter employee id");
        return;
    }
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "../SearchEmployeeById?employee_id=" + employee_id, true);
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            var res = xhr.response;
            //alert(res);
            if (res == 0) {
                document.getElementById("displayEmployeeArea").innerHTML = "No results";
                return;
            }
            var employee = JSON.parse(res);
            if (employee.employee_id != null) {
                document.getElementById("displayEmployeeArea").innerHTML = "";
                displayEmployee(res);
            }
        }
    };
}


function bestSellerbyStores() {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "../BestSellerByStore", true);
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            var res = xhr.response;
            //alert(res);
            if (res == -1) {
                window.location.href = "../index.jsp";
            }
            if (res == 0) {
                alert("No results");
                return;
            }
            else {
                var records = JSON.parse(res);
                //alert(res);
                var recordDisplay = document.getElementById("storeRankingModalbody");
                recordDisplay.innerHTML = "";
                for (var i = 0; i < records.length; i++) {
                    var record = records[i];
                    if (record != null) {
                        recordDisplay.insertAdjacentHTML("beforeend", "<tr><td>" + (i + 1) + "</td>"
                                + "<td>No." + record.product_id + "</td>"
                                + "<td>$" + record.product_name + "</td></tr>");
                    }
                }
                $("#storeRankingModal").modal();
            }
        }
    };
}

function bestSellerByRegion() {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "../BestSellerByRegion", true);
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            var res = xhr.response;
            //alert(res);
            if (res == -1) {
                window.location.href = "../index.jsp";
            }
            if (res == 0) {
                alert("No results");
                return;
            }
            else {
                var records = JSON.parse(res);
                //alert(res);
                var recordDisplay = document.getElementById("bestSellerByRegionbody");
                recordDisplay.innerHTML = "";
                for (var i = 0; i < records.length; i++) {
                    var record = records[i];
                    if (record != null) {
                        recordDisplay.insertAdjacentHTML("beforeend", "<tr><td>" + (i + 1) + "</td>"
                                + "<td>No." + record.product_id + "</td>"
                                + "<td>$" + record.product_name + "</td></tr>");
                    }
                }             
                $("#regionRankingModal").modal();
            }
        }
    };
}

function getCustomerWhobuyGivenProductMost() {
    var xhr = new XMLHttpRequest();
    var product_id = document.getElementById("productID").value;
    var top = document.getElementById("sssssssss");
    var type = top.options[top.selectedIndex].value;
    if (product_id == "") {
        alert("enter a product id");
        return;
    }
    xhr.open("POST", "../GetCustomerWhobuyGivenProductMost?product_id=" + product_id + "&type=" + type, true);
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            var res = xhr.response;
            //alert(res);
            if (res == -1) {
                window.location.href = "../index.jsp";
            }
            if (res == 0) {
                alert("No result");
                return;
            }
            else {
                var records = JSON.parse(res);
                //alert(res);
                var recordDisplay = document.getElementById("getCustomerWhobuyGivenProductMostBody");
                recordDisplay.innerHTML = "";
                for (var i = 0; i < records.length; i++) {
                    var record = records[i];
                    if (record != null) {
                        recordDisplay.insertAdjacentHTML("beforeend", "<tr><td>" + (i + 1) + "</td>"
                                + "<td>" + record.product_id + "</td>"
                                + "<td>" + record.product_name + "</td>"
                                + "<td>" + record.amount + "</td></tr>");
                    }
                }
                $('#givenProductModal').modal();
            }
        }
    };
}