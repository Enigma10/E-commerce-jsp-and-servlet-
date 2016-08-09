/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//for adding customers
$(document).ready(function () {
    $("#judge_business_category").hide();
    $("#judge_company_gross_income").hide();
    $("#judge_marriage_status").hide();
    $("#judge_gender").hide();
    $("#judge_age").hide();
    $("#judge_income").hide();
    $("#home").click(function () {
        $("#judge_business_category").hide();
        $("#judge_company_gross_income").hide();
        $("#judge_marriage_status").show();
        $("#judge_gender").show();
        $("#judge_age").show();
        $("#judge_income").show();
    });
    $("#business").click(function () {
        $("#judge_business_category").show();
        $("#judge_company_gross_income").show();
        $("#judge_marriage_status").hide();
        $("#judge_gender").hide();
        $("#judge_age").hide();
        $("#judge_income").hide();
    });
});
//for updating customers
$(document).ready(function () {
    $("#judge2_business_category").hide();
    $("#judge2_company_gross_income").hide();
    $("#judge2_marriage_status").hide();
    $("#judge2_gender").hide();
    $("#judge2_age").hide();
    $("#judge2_income").hide();
    $("#home2").click(function () {
        $("#judge2_business_category").hide();
        $("#judge2_company_gross_income").hide();
        $("#judge2_marriage_status").show();
        $("#judge2_gender").show();
        $("#judge2_age").show();
        $("#judge2_income").show();
    });
    $("#business2").click(function () {
        $("#judge2_business_category").show();
        $("#judge2_company_gross_income").show();
        $("#judge2_marriage_status").hide();
        $("#judge2_gender").hide();
        $("#judge2_age").hide();
        $("#judge2_income").hide();
    });
});

$(document).ready(function () {

    $(".aMonth").click(function () {
        $("#month0").show();
        $("#month1").show();
        $("#month2").show();
    });
    $(".bMonth").click(function () {
        $("#month0").show();
        $("#month1").show();
        $("#month2").hide();
    });
    $(".cMonth").click(function () {
        $("#month0").hide();
        $("#month1").hide();
        $("#month2").hide();
    });
});

function bestSeller() {
    var xhr = new XMLHttpRequest();
    var top = document.getElementById("s1");
    var n = top.options[top.selectedIndex].value;
    if (n === "") {
        alert("Please select an option!");
    } else {
        xhr.open("POST", "../BestSeller?n=" + n, true);
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
                    var recordDisplay = document.getElementById("ss1");
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
                    $('#bestSellerModal').modal();
                }
            }
        };
    }
}

function salesAndProfit() {
    var xhr = new XMLHttpRequest();
    var product_id = document.getElementById("product_id").value;
    var product_name = document.getElementById("product_name").value;
    if (product_id === "" && product_name == "") {
        alert("Please fill the product ID or name!");
    } else {
        xhr.open("POST", "../SalesAndProfit?product_id=" + product_id + "&product_name=" + product_name, true);
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
                    var recordDisplay = document.getElementById("ss2");
                    recordDisplay.innerHTML = "";
                    for (var i = 0; i < records.length; i++) {
                        var record = records[i];
                        if (record != null) {
                            recordDisplay.insertAdjacentHTML("beforeend", "<tr>"
                                    + "<td>" + record.product_id + "</td>"
                                    + "<td>" + record.product_name + "</td>"
                                    + "<td>$" + record.price + "</td>"
                                    + "<td>$" + record.buying_price + "</td>"
                                    + "<td>" + record.amount + "</td>"
                                    + "<td>$" + record.total_profit + "</td></tr>");
                        }
                    }
                    $('#salesProfitModal').modal();
                }
            }
        };
    }
}

function bestSellerbyStore() {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "../BestSellerByStore" + n, true);
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            var res = xhr.response;
            //alert(res);
            if (res == -1) {
                window.location.href = "../index.jsp";
            }
            if (res == 0) {
                alert("Generate Fail");
                return;
            }
            else {
                var records = JSON.parse(res);
                //alert(res);
                var recordDisplay = document.getElementById("ss1");
                recordDisplay.innerHTML = "";
                for (var i = 0; i < records.length; i++) {
                    var record = records[i];
                    if (record != null) {
                        recordDisplay.insertAdjacentHTML("beforeend", "<tr><td>" + (i + 1) + "</td>"
                                + "<td>" + record.product_id + "</td>"
                                + "<td>" + record.product_name + "</td></tr>");
                    }
                }
            }
        }
    };
}

function bestProductCategory() {
    var xhr = new XMLHttpRequest();
    var top = document.getElementById("s3");
    var n = top.options[top.selectedIndex].value;
    //alert(n);
    if (n === "") {
        alert("Please select an option!");
    } else {
        xhr.open("POST", "../BestProductCategory?n=" + n, true);
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
                    var recordDisplay = document.getElementById("ss3");
                    recordDisplay.innerHTML = "";
                    for (var i = 0; i < records.length; i++) {
                        var record = records[i];
                        if (record != null) {
                            recordDisplay.insertAdjacentHTML("beforeend", "<tr><td>" + (i + 1) + "</td>"
                                    + "<td>" + record.category_id + "</td>"
                                    + "<td>" + record.category_name + "</td>"
                                    + "<td>" + record.amount + "</td></tr>");
                        }
                    }
                    $('#topCategoryModal').modal();
                }
            }
        };
    }
}

function purchaseRanking() {
    var xhr = new XMLHttpRequest();
    var type = document.getElementById("s4");
    var m = type.options[type.selectedIndex].value;
    var time = document.getElementById("s5");
    var n = time.options[time.selectedIndex].value;

    xhr.open("POST", "../PurchaseRanking?type=" + m + "&time=" + n, true);
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
                var recordDisplay = document.getElementById("ss4");
                recordDisplay.innerHTML = "";
                for (var i = 0; i < records.length; i++) {
                    var record = records[i];
                    if (record != null) {
                        recordDisplay.insertAdjacentHTML("beforeend", "<tr><td>" + (i + 1) + "</td>"
                                + "<td>" + record.product_id + "</td>"
                                + "<td>" + record.product_name + "</td>"
                                + "<td>$" + record.amount + "</td>");
                    }
                }
                $('#purchasingVolumeModal').modal();
            }
        }
    };

}

function transactionData() {
    var xhr = new XMLHttpRequest();
    var m = document.getElementById("s6");
    var year = m.options[m.selectedIndex].value;
    var n = document.getElementById("s7");
    var quarter = n.options[n.selectedIndex].value;

    xhr.open("POST", "../TransactionData?year=" + year + "&quarter=" + quarter, true);
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
                var recordDisplay = document.getElementById("ss6");
                recordDisplay.innerHTML = "";
                for (var i = 0; i < records.length; i++) {
                    var record = records[i];
                    if (record != null) {
                        recordDisplay.insertAdjacentHTML("beforeend", "<tr>"
                                + "<td>" + record.product_id + "</td>"
                                + "<td>" + record.product_name + "</td>"
                                + "<td>$" + record.amount + "</td>");
                    }
                }
                $('#tradingVolumeModal').modal();
            }
        }
    };

}