// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
 //=require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
var currencyApp = angular.module('myApp', []);
currencyApp.controller('currencyCtrl', function($scope, $http){
	$http.get('home/list').success(function(data){
	$scope.currencies = data;
	});
}).$inject = ['$scope', '$http'];


$('document').ready(function(){
	$('#currencies_select').bind('change', function(){
		var selIndex = document.getElementById("currencies_select").selectedIndex;
		var selValue = document.getElementById("currencies_select").options[selIndex].text;
		$('#currency_form_country_name').attr('value', selValue);
		$('#currency_form_country_currency').attr('value', $(this).val());
		$('#contry_currency').text("Country of currency is " + $(this).val());
	});
})