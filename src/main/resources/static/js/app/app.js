var app = angular.module('crudApp',['ui.router','ngStorage', 'ngMaterial']);

app.constant('urls', {
    BASE: 'http://localhost:8080/SpringBootCRUDApp',
    USER_SERVICE_API : 'http://localhost:8080/SpringBootCRUDApp/api/customer/',
    PRODUCT_SERVICE_API : 'http://localhost:8080/SpringBootCRUDApp/api/product/',
    PRODUCTCUSTOMER_SERVICE_API : 'http://localhost:8080/SpringBootCRUDApp/api/productCustomer/'
});

app.config(['$stateProvider', '$urlRouterProvider',
    function($stateProvider, $urlRouterProvider) {

        $stateProvider

            .state('home', {
                url: '/home',
                templateUrl: 'partials/home',
            })
            .state('sell', {
                url: '/sell',
                templateUrl: 'partials/productCustomerList',
                controller:'ProductCustomerController',
                controllerAs:'ctrl',
                resolve: {
                    customers: function ($q, ProductCustomerService) {
                        console.log('Load all customers');
                        var deferred = $q.defer();
                        ProductCustomerService.loadAllProductCustomers().then(deferred.resolve, deferred.resolve);
                        return deferred.promise;
                    }
                }
            })
            .state('product', {
                url: '/product',
                templateUrl: 'partials/productList',
                controller:'ProductController',
                controllerAs:'ctrl',
                resolve: {
                    customers: function ($q, ProductService) {
                        console.log('Load all product');
                        var deferred = $q.defer();
                        ProductService.loadAllProducts().then(deferred.resolve, deferred.resolve);
                        return deferred.promise;
                    }
                }
            })
            .state('customer', {
                url: '/customer',
                templateUrl: 'partials/customerList',
                controller:'CustomerController',
                controllerAs:'ctrl',
                resolve: {
                    customers: function ($q, CustomerService) {
                        console.log('Load all customers');
                        var deferred = $q.defer();
                        CustomerService.loadAllCustomers().then(deferred.resolve, deferred.resolve);
                        return deferred.promise;
                    }
                }
            });
            
        $urlRouterProvider.otherwise('/home');
    }]);

