
document.addEventListener("DOMContentLoaded", function () {
    const loginForm = document.getElementById("login-form");
    const signupForm = document.getElementById("signup-form");

    if (loginForm) {
        loginForm.addEventListener("submit", function (event) {
            event.preventDefault();
            validateLogin();
        });
    }

    if (signupForm) {
        signupForm.addEventListener("submit", function (event) {
            event.preventDefault();
            validateSignup();
        });
    }
});

function validateLogin() {
    const username = document.getElementById("login-username").value.trim();
    const password = document.getElementById("login-password").value.trim();
    const errorMessage = document.getElementById("login-error");

    if (username === "" || password === "") {
        errorMessage.textContent = "⚠ Username और Password दोनों भरना जरूरी है!";
        return false;
    }
    
    if (password.length < 6) {
        errorMessage.textContent = "⚠ Password कम से कम 6 अक्षरों का होना चाहिए!";
        return false;
    }

    errorMessage.textContent = "";
    alert("✅ Login Successful!");
    window.location.href = "dashboard.html"; // Login Success पर Redirect
}

function validateSignup() {
    const username = document.getElementById("signup-username").value.trim();
    const password = document.getElementById("signup-password").value.trim();
    const role = document.getElementById("signup-role").value;
    const errorMessage = document.getElementById("signup-error");

    if (username === "" || password === "" || role === "") {
        errorMessage.textContent = "⚠ सभी Fields भरना जरूरी है!";
        return false;
    }

    if (password.length < 6) {
        errorMessage.textContent = "⚠ Password कम से कम 6 अक्षरों का होना चाहिए!";
        return false;
    }

    errorMessage.textContent = "";
    alert("✅ Signup Successful!");
    window.location.href = "login.html"; // Signup के बाद Login Page पर Redirect
}