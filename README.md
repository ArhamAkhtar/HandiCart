# HandiCart

**Domain:** A web applicatiion to sell handicraft items.

* Technologies used : 
  * Frontend : HTML, CSS, Bootstrap
  * Server : Apache Tomcat 9
  * Database : MySQl 8.0
  * Programming Language : java version "1.8.0_281"
  * IDE : Eclipse 12
  * Web Application : JSP,Servlet,JDBC

* Modules:
  * Admin -
	  * add products
	  * view products
	  * edit products(name,price,category,status)
	  * view orders received
	  * view messages received
	  * edit About
  * user-
	  * view products
    
    * add products to cart
	  * increase/decrease quantity of products in cart
	  * remove product from cart
	  * view profile
	  * edit profile(mobile number,address,security question,change password)
	  * view cart
	  * view orders
	  * message admin
	  * see about
	  * search products with name or category
	  * view bill
	  * logout
* My SQL Tables-
	 * user
	 * products
	 * cart
	 * message

* Instructions to run this project - 
  * One must install Eclipse IDE for enterprise developers, My SQl and jdk 1.8 first of all. 
  * Open the project by clicking on File->Open project from system->..
  * My Sql connector should be downloaded and added to the project. To add, go to :(on Eclipse inside the project)
  * WebContent->WEB-INF->lib->copy path of mysql connector 
  * Apache Tomcat server is downloaded and added to run the files. To add, go to :(on Eclipse)
   Window->Preferences->Server->Runtime Environment->Add(Apache Tomcat)->Apply and close	
  * commons-io.jar and commons-fileupload.jar should also be added to upload pictures of products in the database and retreive them.
  * Open the index.html page and right click->Run as->Run on server->next->finish. 
  *  There you go!

