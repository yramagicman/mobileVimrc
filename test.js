var csrf = document.getElementsByName('csrfmiddlewaretoken')[0];
var input = document.getElementsByName('t')[0];
var url = 'http://127.0.0.1:8000/search/results/?' + csrf.name + '=' + csrf.value + '&' + input.name + '=' + input.value;


function reqListener() {
    'use strict';
    var results_display = document.getElementById('results');
    results_display.innerHTML = this.responseText;
}
var oReq = new XMLHttpRequest();
oReq.onload = reqListener;
oReq.open('get', url, true);
oReq.send();
