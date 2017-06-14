
function passwordcheck(objClientId) {
    var password = document.getElementById(objClientId).value;

    var noofchar = /^.*(?=.{6,}).*$/;
    var best = /^.*(?=.{6,})(?=.*[A-Z])(?=.*[\d])(?=.*[\W]).*$/;
    var strong = /^[a-zA-Z\d\W_]*(?=[a-zA-Z\d\W_]{6,})(((?=[a-zA-Z\d\W_]*[A-Z])(?=[a-zA-Z\d\W_]*[\d]))|((?=[a-zA-Z\d\W_]*[A-Z])(?=[a-zA-Z\d\W_]*[\W_]))|((?=[a-zA-Z\d\W_]*[\d])(?=[a-zA-Z\d\W_]*[\W_])))[a-zA-Z\d\W_]*$/;
    var weak = /^[a-zA-Z\d\W_]*(?=[a-zA-Z\d\W_]{6,})(?=[a-zA-Z\d\W_]*[A-Z]|[a-zA-Z\d\W_]*[\d]|[a-zA-Z\d\W_]*[\W_])[a-zA-Z\d\W_]*$/;
    var bad = /^((^[a-z]{6,}$)|(^[A-Z]{6,}$)|(^[\d]{6,}$)|(^[\W_]{6,}$))$/;

    if (!noofchar.test(password)) {
        tdWeak.bgColor = "transparent";
        tdStrong.bgColor = "transparent";
        tdBest.bgColor = "transparent";
        tdBad.bgColor = "transparent"
        tdPwdStrength.innerHTML = "must be 6 char";
    }
    else if (best.test(password)) {
        tdBad.bgColor = "green";
        tdWeak.bgColor = "green";
        tdStrong.bgColor = "green";
        tdBest.bgColor = "green";
        tdPwdStrength.innerHTML = "Strong";
    }
    else if (strong.test(password) || weak.test(password) && !bad.test(password)) {
        tdBad.bgColor = "yellow";
        tdWeak.bgColor = "yellow";
        tdStrong.bgColor = "yellow";
        tdBest.bgColor = "transparent"
        tdPwdStrength.innerHTML = "Weak";
    }    
    else if (bad.test(password)) {
        tdWeak.bgColor = "transparent";
        tdStrong.bgColor = "transparent";
        tdBest.bgColor = "transparent";
        tdBad.bgColor = "red";
        tdPwdStrength.innerHTML = "Bad";
    }
}
