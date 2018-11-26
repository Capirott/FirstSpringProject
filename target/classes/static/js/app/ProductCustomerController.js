'use strict';

angular.module('crudApp').controller('ProductCustomerController',
    ['ProductCustomerService', 'CustomerService', 'ProductService', '$scope', function(ProductCustomerService, CustomerService, ProductService, $scope) {

        var self = this;
        self.productCustomer = {};
        self.productCustomers= [];

        self.submit = submit;
        self.getAllProductCustomers = getAllProductCustomers;
        self.createProductCustomer = createProductCustomer;
        self.updateProductCustomer = updateProductCustomer;
        self.removeProductCustomer = removeProductCustomer;
        self.editProductCustomer = editProductCustomer;
        self.reset = reset;

        self.successMessage = '';
        self.errorMessage = '';
        self.done = false;
    
        self.onlyIntegers = /^\d+$/;
        self.onlyNumbers = /^[0-9]+(\.[0-9]{1,2})?$/;

        $scope.customerList = CustomerService.getAllCustomers();
        $scope.productList = ProductService.getAllProducts();


        $scope.completeCustomer = function(string){
			
            var output=[];
            
			angular.forEach($scope.customerList,function(customer){
				if(customer.name.toLowerCase().indexOf(string.toLowerCase())>=0){
					output.push(customer);
				}
			});
			$scope.filterCustomers=output;
        }

        $scope.completeProduct = function(string){
			
            var output=[];
            
			angular.forEach($scope.productList,function(product){
				if(product.name.toLowerCase().indexOf(string.toLowerCase())>=0){
					output.push(product);
				}
			});
			$scope.filterProducts=output;
        }
        
		$scope.fillCustomer = function(customer){
            $scope.customerName = customer.name;
            $scope.ctrl.productCustomer.customer = customer;
			$scope.filterCustomers = null;
		}
		$scope.fillProduct = function(product){
            $scope.productName = product.name;
            $scope.ctrl.productCustomer.product = product;
			$scope.filterProducts = null;
		}

        function submit() {
            console.log('Submitting');
            if (self.productCustomer.id === undefined || self.productCustomer.id === null) {
                console.log('Saving New ProductCustomer', self.productCustomer);
                createProductCustomer(self.productCustomer);
            } else {
                updateProductCustomer(self.productCustomer, self.productCustomer.id);
                console.log('ProductCustomer updated with id ', self.productCustomer.id);
            }
        }

        function createProductCustomer(productCustomer) {
            console.log('About to create productCustomer');
            ProductCustomerService.createProductCustomer(productCustomer)
                .then(
                    function (response) {
                        console.log('ProductCustomer created successfully');
                        self.successMessage = 'ProductCustomer created successfully';
                        self.errorMessage='';
                        self.done = true;
                        self.productCustomer={};
                        $scope.myForm.$setPristine();
                    },
                    function (errResponse) {
                        console.error('Error while creating ProductCustomer');
                        self.errorMessage = 'Error while creating ProductCustomer: ' + errResponse.data.errorMessage;
                        self.successMessage='';
                    }
                );
        }


        function updateProductCustomer(productCustomer, id){
            console.log('About to update productCustomer');
            ProductCustomerService.updateProductCustomer(productCustomer, id)
                .then(
                    function (response){
                        console.log('ProductCustomer updated successfully');
                        self.successMessage='ProductCustomer updated successfully';
                        self.errorMessage='';
                        self.done = true;
                        $scope.myForm.$setPristine();
                    },
                    function(errResponse){
                        console.error('Error while updating ProductCustomer');
                        self.errorMessage='Error while updating ProductCustomer '+errResponse.data;
                        self.successMessage='';
                    }
                );
        }


        function removeProductCustomer(id){
            console.log('About to remove ProductCustomer with id '+id);
            ProductCustomerService.removeProductCustomer(id)
                .then(
                    function(){
                        console.log('ProductCustomer '+id + ' removed successfully');
                    },
                    function(errResponse){
                        console.error('Error while removing productCustomer '+id +', Error :'+errResponse.errorMessage);
                    }
                );
        }


        function getAllProductCustomers(){
            return ProductCustomerService.getAllProductCustomers();
        }

        function editProductCustomer(id) {
            self.successMessage='';
            self.errorMessage='';
            ProductCustomerService.getProductCustomer(id).then(
                function (productCustomer) {
                    self.productCustomer = productCustomer;
                    $scope.customerName = self.productCustomer.customer.name;
                    $scope.productName = self.productCustomer.product.name;
                },
                function (errResponse) {
                    console.error('Error while removing productCustomer ' + id + ', Error :' + errResponse.data.errorMessage);
                }
            );
        }
        function reset(){
            self.successMessage='';
            self.errorMessage='';
            self.productCustomer={};
            $scope.customerName = null;
            $scope.productName = null;
            $scope.myForm.$setPristine(); //reset Form
        }
        
    }


    ]);