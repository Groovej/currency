//=require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
var currencyApp = angular.module('myApp', []);
currencyApp.controller('currencyCtrl', ['$scope', '$http', function($scope, $http){
	$http.get('initial_data').success(function(data){
	$scope.currencies = data;
	});
}]);


$('document').ready(function(){
	$('#currencies_select').bind('change', function(){
		var selIndex = document.getElementById("currencies_select").selectedIndex;
		var selValue = document.getElementById("currencies_select").options[selIndex].text;
		$('#currency_form_country_name').attr('value', selValue);
		$('#currency_form_country_currency').attr('value', $(this).val());
		$('#contry_currency').text("Country of currency is " + $(this).val());
	});
})
