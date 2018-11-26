'use strict';

angular.module('crudApp').factory('ProductCustomerService',
    ['$localStorage', '$http', '$q', 'urls',
        function ($localStorage, $http, $q, urls) {

            var factory = {
                loadAllProductCustomers: loadAllProductCustomers,
                getAllProductCustomers: getAllProductCustomers,
                getProductCustomer: getProductCustomer,
                createProductCustomer: createProductCustomer,
                updateProductCustomer: updateProductCustomer,
                removeProductCustomer: removeProductCustomer
            };

            return factory;

            function loadAllProductCustomers() {
                console.log('Fetching all productCustomers');
                var deferred = $q.defer();
                $http.get(urls.PRODUCTCUSTOMER_SERVICE_API)
                    .then(
                        function (response) {
                            console.log('Fetched successfully all productCustomers');
                            $localStorage.productCustomers = response.data;
                            deferred.resolve(response);
                        },
                        function (errResponse) {
                            console.error('Error while loading productCustomers');
                            deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }

            function getAllProductCustomers(){
                return $localStorage.productCustomers;
            }

            function getProductCustomer(id) {
                console.log('Fetching ProductCustomer with id :'+id);
                var deferred = $q.defer();
                $http.get(urls.PRODUCTCUSTOMER_SERVICE_API + id)
                    .then(
                        function (response) {
                            console.log('Fetched successfully ProductCustomer with id :'+id);
                            deferred.resolve(response.data);
                        },
                        function (errResponse) {
                            console.error('Error while loading productCustomer with id :'+id);
                            deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }

            function createProductCustomer(productCustomer) {
                console.log('Creating ProductCustomer');
                var deferred = $q.defer();
                $http.post(urls.PRODUCTCUSTOMER_SERVICE_API, productCustomer)
                    .then(
                        function (response) {
                            loadAllProductCustomers();
                            deferred.resolve(response.data);
                        },
                        function (errResponse) {
                           console.error('Error while creating ProductCustomer : '+errResponse.data.errorMessage);
                           deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }

            function updateProductCustomer(productCustomer, id) {
                console.log('Updating ProductCustomer with id '+id);
                var deferred = $q.defer();
                $http.put(urls.PRODUCTCUSTOMER_SERVICE_API + id, productCustomer)
                    .then(
                        function (response) {
                            loadAllProductCustomers();
                            deferred.resolve(response.data);
                        },
                        function (errResponse) {
                            console.error('Error while updating ProductCustomer with id :'+id);
                            deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }

            function removeProductCustomer(id) {
                console.log('Removing ProductCustomer with id '+id);
                var deferred = $q.defer();
                $http.delete(urls.PRODUCTCUSTOMER_SERVICE_API + id)
                    .then(
                        function (response) {
                            loadAllProductCustomers();
                            deferred.resolve(response.data);
                        },
                        function (errResponse) {
                            console.error('Error while removing ProductCustomer with id :'+id);
                            deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }

        }
    ]);