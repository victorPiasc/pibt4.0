function validateDollar(args) {
    return checkRange(args, 0, 1000000) && !hasLetter(args) && matchesDollarReg(args);
}

function validateDollarDep(args) {
    return !hasLetter(args) && matchesDollarReg(args);
}

function validatePercentEE(args) {
    return checkRange(args, 50, 100) && !hasLetter(args) && matchesPercentReg(args);
}

function validatePercentDep(args) {
    return !hasLetter(args) && args=="" || matchesPercentReg(args);
}

function checkRange(tmp, min, max) {
    return tmp >= min && tmp <= max;
}

function hasLetter(tmp) {
    return tmp.match(/[a-z]/i);
}

function matchesPercentReg(tmp) {
    var reg = /(^100(\.0{1,2})?$)|(^([1-9]([0-9])?|0)(\.[0-9]{1,2})?$)/;
    return reg.test(tmp);
}

function matchesDollarReg(tmp) {
    var reg = /^(?:\d{1,5}(?:\.\d{1,2})?)$/;
    return reg.test(tmp);
}

function validateEmail(source, args) {
    var reg = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    args.IsValid = reg.test(args.Value);
}