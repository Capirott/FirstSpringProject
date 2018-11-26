<div class="generic-container">
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading"><span class="lead"> Whaddaya sellin'? </span></div>
		<div class="panel-body">
	        <div class="formcontainer">
	            <div class="alert alert-success" role="alert" ng-if="ctrl.successMessage">{{ctrl.successMessage}}</div>
	            <div class="alert alert-danger" role="alert" ng-if="ctrl.errorMessage">{{ctrl.errorMessage}}</div>
	            <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
	                <input type="hidden" ng-model="ctrl.productCustomer.id" />
	                <div class="row">
	                    <div class="form-group col-md-12">
	                        <label class="col-md-2 control-lable" for="name">Customer</label>
	                        <div class="col-md-7">
	                            <input type="text" ng-model="customerName" name="customerName" id="customerName" autocomplete="off" class="form-control input-sm" placeholder="Enter the customer name" ng-keyup="completeCustomer(customerName)"/>
	                            <input type="text" ng-show="!filterCustomers || filterCustomers.length == 0" ng-model="ctrl.productCustomer.customer.name" class="form-control input-sm" placeholder="No customer selected" disabled/>
                                <ul class="list-group">
									<li class="list-group-item" ng-repeat="customer in filterCustomers" ng-click="fillCustomer(customer)">{{customer.name}}</li>
								</ul>
	                        </div>
	                    </div>
	                </div>
	                
	                 <div class="row">
	                    <div class="form-group col-md-12">
	                        <label class="col-md-2 control-lable" for="name">Product</label>
	                        <div class="col-md-7">
	                            <input type="text" ng-model="productName" name="productName" id="productName" autocomplete="off" class="form-control input-sm" placeholder="Enter the product name" ng-keyup="completeProduct(productName)"/>
	                            <input type="text" ng-show="!filterProducts || filterProducts.length == 0" ng-model="ctrl.productCustomer.product.name" class="form-control input-sm" placeholder="No product selected" disabled/>
                            	<div ng-show="filterProducts && filterProducts.length > 0">Got a selection of good things on sale, stranger.</div>
                                <ul class="list-group">
									<li class="list-group-item" ng-repeat="product in filterProducts" ng-click="fillProduct(product)">{{product.name}}</li>
								</ul>
	                        </div>
	                    </div>
	                </div>
	                
	                <div class="row">
	                    <div class="form-group col-md-12">
	                        <label class="col-md-2 control-lable" for="amount">Amount</label>
	                        <div class="col-md-7">
	                            <input type="number" class="form-control" name="amount" placeholder="Enter the amount sold." ng-model="ctrl.productCustomer.amount" ng-pattern="onlyNumbers" step="0.01" required />
	                        </div>
	                    </div>
	                </div>
	
	                <div class="row  float-right">
	                    <div class="form-actions">
	                        <input type="submit"  value="{{!ctrl.productCustomer.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid || myForm.$pristine">
	                        <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>
	                    </div>
	                </div>
	            </form>
    	    </div>
		</div>	
    </div>
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading"><span class="lead">List of products sold </span></div>
		<div class="panel-body">
			<div class="table-responsive">
				
		        <table class="table table-hover">
		            <thead>
		            <tr>
		                <th>ID</th>
		                <th>CUSTOMER NAME</th>
		                <th>PRODUCT NAME</th>
		                <th>PRODUCT PRICE</th>
		                <th>AMOUNT</th>
		                <th>TOTAL</th>
		                <th></th>
		                <th></th>
		            </tr>
		            </thead>
		            <tbody>
		            <tr ng-repeat="u in ctrl.getAllProductCustomers()">
		                <td>{{u.id}}</td>
		                <td>{{u.customer.name}}</td>
		                <td>{{u.product.name}}</td>
		                <td>{{u.product.price}}</td>
		                <td>{{u.amount}}</td>
		                <td>{{u.amount * u.product.price}}</td>
		                <td><button type="button" ng-click="ctrl.editProductCustomer(u.id)" class="btn btn-success custom-width">Edit</button></td>
		                <td><button type="button" ng-click="ctrl.removeProductCustomer(u.id)" class="btn btn-danger custom-width">Remove</button></td>
		            </tr>
		            </tbody>
		        </table>		
			</div>
		</div>
    </div>
</div>