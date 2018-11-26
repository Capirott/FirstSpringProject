
<div class="generic-container">
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading"><span class="lead">Product </span></div>
		<div class="panel-body">
	        <div class="formcontainer">
	            <div class="alert alert-success" role="alert" ng-if="ctrl.successMessage">{{ctrl.successMessage}}</div>
	            <div class="alert alert-danger" role="alert" ng-if="ctrl.errorMessage">{{ctrl.errorMessage}}</div>
	            <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
	                <input type="hidden" ng-model="ctrl.product.id" />
	                <div class="row">
	                    <div class="form-group col-md-12">
	                        <label class="col-md-2 control-lable" for="name">Name</label>
	                        <div class="col-md-7">
	                            <input type="text" name="name" ng-model="ctrl.product.name" id="name" class="productname form-control input-sm" placeholder="Enter the product name" required ng-minlength="3"/>
                                <p class= "text-danger" ng-show="myForm.name.$invalid && !myForm.name.$pristine" class="help-block">Enter a valid name.</p>
	                        </div>
	                    </div>
	                </div>

	                <div class="row">
	                    <div class="form-group col-md-12">
	                        <label class="col-md-2 control-lable" for="price">Price</label>
	                        <div class="col-md-7">
	                            <input type="number" class="form-control" name="price" placeholder="Enter the product price." ng-model="ctrl.product.price" ng-pattern="onlyNumbers" step="0.01" required />
                                <p class= "text-danger" ng-show="myForm.price.$invalid && !myForm.price.$pristine" class="help-block">Enter a valid price.</p>
	                        </div>
	                    </div>
	                </div>
	
	                <div class="row  float-right">
	                    <div class="form-actions">
	                        <input type="submit"  value="{{!ctrl.product.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid || myForm.$pristine">
	                        <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>
	                    </div>
	                </div>
	            </form>
    	    </div>
		</div>	
    </div>
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading"><span class="lead">List of Products </span></div>
		<div class="panel-body">
			<div class="table-responsive">
		        <table class="table table-hover">
		            <thead>
		            <tr>
		                <th>ID</th>
		                <th>NAME</th>
		                <th>PRICE</th>
		                <th width="100"></th>
		                <th width="100"></th>
		                <th width="100"></th>
		            </tr>
		            </thead>
		            <tbody>
		            <tr ng-repeat="u in ctrl.getAllProducts()">
		                <td>{{u.id}}</td>
		                <td>{{u.name}}</td>
		                <td>{{u.price}}</td>
		                <td></td>
		                <td><button type="button" ng-click="ctrl.editProduct(u.id)" class="btn btn-success custom-width">Edit</button></td>
		                <td><button type="button" ng-click="ctrl.removeProduct(u.id)" class="btn btn-danger custom-width">Remove</button></td>
		            </tr>
		            </tbody>
		        </table>		
			</div>
		</div>
    </div>
</div>