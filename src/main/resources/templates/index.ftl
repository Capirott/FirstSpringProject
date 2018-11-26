<!DOCTYPE html>

<html lang="en" ng-app="crudApp">
    <head>
     	<meta name="viewport" content="width=device-width, initial-scale=1">
        <title>${title}</title>
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	    <link href="css/app.css" rel="stylesheet"/>
		<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/angular-material/1.1.10/angular-material.min.css">
    </head>
    <body>
		<nav class="navbar navbar-inverse navbar-light">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>                        
		      </button>
		      <a class="navbar-brand" href="#">Spring Application</a>
		    </div>
		    <div class="collapse navbar-collapse" id="myNavbar">
		      <ul class="nav navbar-nav">
		        <li><a class="nav-item nav-link" ui-sref="home">Home <span class="sr-only">(current)</span></a></li>
		        <li><a class="nav-item nav-link" ui-sref="customer">Customer</a></li>
		        <li><a class="nav-item nav-link" ui-sref="product">Product</a></li>
		        <li><a class="nav-item nav-link" ui-sref="sell">Sell</a></li>
		      </ul>
		      </div>
		  </div>
		</nav>
		
        <div ui-view></div>
        
        
		<script src="//cdnjs.cloudflare.com/ajax/libs/angular.js/1.6.9/angular.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/angular.js/1.6.9/angular-animate.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/angular.js/1.6.9/angular-aria.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/angular-material/1.1.10/angular-material.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/angular-ui-router/0.4.2/angular-ui-router.js"></script>
		<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-messages.js"></script>
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		    
		
        <script src="js/lib/localforage.min.js" ></script>
        <script src="js/lib/ngStorage.min.js"></script>
        <script src="js/app/app.js"></script>
        <script src="js/app/CustomerService.js"></script>
		<script src="js/app/CustomerController.js"></script>
        <script src="js/app/ProductService.js"></script>
		<script src="js/app/ProductController.js"></script>
        <script src="js/app/ProductCustomerService.js"></script>
		<script src="js/app/ProductCustomerController.js"></script>
    </body>
</html>