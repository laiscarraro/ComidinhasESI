const { param } = require("jquery");

window.addEventListener("load", function() {
    var user = document.getElementById("login-user-text");

    if(user) {
        user.addEventListener("focus", addClassLoginUserHighlight);
        user.addEventListener("blur", removeClassLoginUserHighlight);
    }

    var password = document.getElementById("login-password-text")

    if(password) {
        password.addEventListener("focus", addClassLoginPasswordHighlight);
        password.addEventListener("blur", removeClassLoginPasswordHighlight);
    }

    var submit = document.getElementById("login-submit-btn")

    if(submit) {
        submit.addEventListener("click", checkSubmit(user)(password));
    }
});

function addClassLoginUserHighlight() {
    document.getElementById("login-user").classList.add("login-border");
    document.getElementById("login-user-label").classList.add("login-label-float");
    document.getElementById("user-check").classList.remove("user-check-draw");
    document.getElementById("invalid-user").style.visibility = "hidden";
}

function removeClassLoginUserHighlight() {
    document.getElementById("login-user").classList.remove("login-border");

    if(document.getElementById("login-user-text").value == "") {
        document.getElementById("login-user-label").classList.remove("login-label-float");
    }
    else {
        checkUserExists("/login/user_exists").then(function() {
            document.getElementById("user-check").classList.add("user-check-draw");
        }, function() {
            document.getElementById("invalid-user").style.visibility = "visible";
        });
    }
}

const checkSubmit = (user) => (password) => {
    return function(e) {
        if(user.value == "" || password.value == "") {
            alert("Preencha os campos de Usuário e Senha!");
            e.preventDefault();
        }
    }
}

function checkUserExists(url) {
    return new Promise(function(resolve, reject) {
        var params = '?user='.concat(document.getElementById("login-user-text").value);
        var xhr = new XMLHttpRequest();
        xhr.open("GET", url.concat(params), true);
        xhr.onreadystatechange = function() {
            if(xhr.readyState == 4 && xhr.status == 200) {
                var response = JSON.parse(xhr.responseText);
                if(response.message == "true")
                    resolve();
                else
                    reject();
            }
        };
        xhr.send();
    });
}

function addClassLoginPasswordHighlight() {
    document.getElementById("login-password").classList.add("login-border");
    document.getElementById("login-password-label").classList.add("login-label-float");
}

function removeClassLoginPasswordHighlight() {
    document.getElementById("login-password").classList.remove("login-border");

    if(document.getElementById("login-password-text").value == "") {
        document.getElementById("login-password-label").classList.remove("login-label-float");
    }
}