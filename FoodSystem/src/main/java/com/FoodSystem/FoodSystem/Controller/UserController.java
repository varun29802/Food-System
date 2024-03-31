package com.FoodSystem.FoodSystem.Controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.FoodSystem.FoodSystem.Model.FoodProduct;
import com.FoodSystem.FoodSystem.Model.OrderData;
import com.FoodSystem.FoodSystem.Model.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Controller
public class UserController {
	
	@Autowired
	SessionFactory sf;

	@RequestMapping("/")
	public ModelAndView userLogIn() 
	{
		return new ModelAndView("userLogin");
	}
	
	
	
	
	@RequestMapping("/userIndex")
	public ModelAndView userIndex() 
	{
		return new ModelAndView("index");
	}
	
	
	@RequestMapping("/payment")
	 public ModelAndView paymentP() 
	 {
		 return new ModelAndView("payment");
	 }
	
	@RequestMapping("/userContactUs")
	 public ModelAndView userContactUs() 
	 {
		 return new ModelAndView("usercontactUs");
	 }
	@RequestMapping("/helpP")
	public ModelAndView payP() 
	{
		return new ModelAndView("help");
		
	}
	@RequestMapping("/registerUser")
	public ModelAndView registerUser(@ModelAttribute User user) 
	{  
			Session ss=sf.openSession();
			User user1=ss.get(User.class, user.getEmail());
			if (user1!=null) {
				return new ModelAndView("userLogin");
				
			} else {
				Session session=sf.openSession();
				Transaction tx=session.beginTransaction();
				session.save(user);
				tx.commit();
				return new ModelAndView("index");

			}
		}

		
	
	
		
		
	
	
	@RequestMapping("/userLogin")
	public ModelAndView engSignIn(@ModelAttribute User user,HttpServletRequest request) 
	{
        ModelAndView andView = new ModelAndView();
		
		Session session = sf.openSession();
		User user1 = session.get(User.class,user.getEmail());
		
		if(user1 != null &&user1.getEmail().equals(user.getEmail()) && user1.getPassword().equals(user.getPassword()))
		{
			andView.setViewName("index");
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("name", user1.getUserName());
			httpSession.setAttribute("useremail", user1.getEmail());
			andView.addObject("message","You have login successfull");
		}
		else
		{
			andView.setViewName("userLogin");
			andView.addObject("message","Wrong User Id Or Password");
		}
		
		return andView;
	}
	 @RequestMapping("/userLogOut")
     public ModelAndView engLogOut(HttpServletRequest request) 
     {
		 HttpSession ss=request.getSession(false);
		 if (ss!=null) {
			ss.invalidate();
		}
		 ModelAndView mv=new ModelAndView();
		 mv.setViewName("userLogin");
		 mv.addObject("message","log out Succesfully...");
		 return mv;
    	 
     }
	 
	 @RequestMapping("/viewFoodProduct")
		public ModelAndView idetails() {
		    // Open session
		    try (Session session = sf.openSession()) {
		        // Retrieve list of DeviceInfo objects
		        List<FoodProduct> indexList = session.createQuery("from FoodProduct", FoodProduct.class).list();

		        // Construct base URL for bill receipt
		        String baseUrl = "http://localhost:8080/ProductImages/";

		        // Iterate through the DeviceInfo list and update bill receipt paths
		        for (FoodProduct indexEntity : indexList) {
		            String billRFileName = indexEntity.getPimagepath(); // Assuming getBillReciptPath() returns file name

		            // Extract file name from bill receipt path
		            int index = billRFileName.lastIndexOf("/");
		            String result = billRFileName.substring(index + 1);
		            
		            //System.out.println("hiii "+result);

		            // Construct complete bill receipt URL
		            String billReURL = baseUrl + result;

		            // Update bill receipt path
		            indexEntity.setPimagepath(billReURL);
		           // System.out.println(billReURL);
		        }

		        // Create ModelAndView object
		        ModelAndView modelAndView = new ModelAndView();

		        // Set view name
		        modelAndView.setViewName("usermenu");

		        // Add indexList to ModelAndView
		        modelAndView.addObject("indexList", indexList);

		        // Return ModelAndView
		        return modelAndView;
		    } catch (Exception e) {
		        // Handle any exceptions
		        e.printStackTrace();
		        return null; // Or handle the exception gracefully and return an appropriate ModelAndView
		    }


	 }
	 
	 
	 @RequestMapping("/viewPizza")
	 public ModelAndView pizzaP() {
	     try (Session session = sf.openSession()) {
	         // Retrieve list of FoodProduct objects
	         List<FoodProduct> indexList = session.createQuery("from FoodProduct", FoodProduct.class).list();
	         
	         // Filter the list to include only the images with names containing "pizza"
	         List<FoodProduct> pizzaImages = indexList.stream()
	                 .filter(product -> product.getPname().toLowerCase().contains("pizza"))
	                 .collect(Collectors.toList());

	         // Construct base URL for the images
	         String baseUrl = "http://localhost:8080/ProductImages/";

	         // Update image paths to include the base URL
	         for (FoodProduct pizzaImage : pizzaImages) {
	             String imageName = pizzaImage.getPimagepath();
	             int index = imageName.lastIndexOf("/");
	             String fileName = imageName.substring(index + 1);
	             String imageUrl = baseUrl + fileName;
	             pizzaImage.setPimagepath(imageUrl);
	         }

	         // Create ModelAndView object
	         ModelAndView modelAndView = new ModelAndView();

	         // Set view name
	         modelAndView.setViewName("usermenu");

	         // Add pizzaImages to ModelAndView
	         modelAndView.addObject("indexList", pizzaImages);

	         // Return ModelAndView
	         return modelAndView;
	     } catch (Exception e) {
	         // Handle any exceptions
	         e.printStackTrace();
	         return null; // Or handle the exception gracefully and return an appropriate ModelAndView
	     }
	 }

	 
	 @RequestMapping("/viewBurger")
	 public ModelAndView showBurgerImages() {
	     try (Session session = sf.openSession()) {
	         // Retrieve list of FoodProduct objects
	         List<FoodProduct> indexList = session.createQuery("from FoodProduct", FoodProduct.class).list();
	         
	         // Filter the list to include only the images with names containing "burger"
	         List<FoodProduct> burgerImages = indexList.stream()
	                 .filter(product -> product.getPname().toLowerCase().contains("burger"))
	                 .collect(Collectors.toList());

	         // Construct base URL for the images
	         String baseUrl = "http://localhost:8080/ProductImages/";

	         // Update image paths to include the base URL
	         for (FoodProduct burgerImage : burgerImages) {
	             String imageName = burgerImage.getPimagepath();
	             int index = imageName.lastIndexOf("/");
	             String fileName = imageName.substring(index + 1);
	             String imageUrl = baseUrl + fileName;
	             burgerImage.setPimagepath(imageUrl);
	         }

	         // Create ModelAndView object
	         ModelAndView modelAndView = new ModelAndView();

	         // Set view name to burgerP.jsp
	         modelAndView.setViewName("usermenu");

	         // Add burgerImages to the ModelAndView
	         modelAndView.addObject("indexList", burgerImages);

	         // Return the ModelAndView
	         return modelAndView;
	     } catch (Exception e) {
	         // Handle any exceptions
	         e.printStackTrace();
	         return null; // Or handle the exception gracefully and return an appropriate ModelAndView
	     }
	 }

	 @RequestMapping("/viewIceCream")
	 public ModelAndView showIceCreamImages() {
	     try (Session session = sf.openSession()) {
	         // Retrieve list of FoodProduct objects
	         List<FoodProduct> indexList = session.createQuery("from FoodProduct", FoodProduct.class).list();
	         
	         // Filter the list to include only the images with names containing "ice cream"
	         List<FoodProduct> iceCreamImages = indexList.stream()
	                 .filter(product -> product.getPname().toLowerCase().contains("ice cream"))
	                 .collect(Collectors.toList());

	         // Construct base URL for the images
	         String baseUrl = "http://localhost:8080/ProductImages/";

	         // Update image paths to include the base URL
	         for (FoodProduct iceCreamImage : iceCreamImages) {
	             String imageName = iceCreamImage.getPimagepath();
	             int index = imageName.lastIndexOf("/");
	             String fileName = imageName.substring(index + 1);
	             String imageUrl = baseUrl + fileName;
	             iceCreamImage.setPimagepath(imageUrl);
	         }

	         // Create ModelAndView object
	         ModelAndView modelAndView = new ModelAndView();

	         // Set view name to iceCream.jsp
	         modelAndView.setViewName("usermenu");

	         // Add iceCreamImages to the ModelAndView
	         modelAndView.addObject("indexList", iceCreamImages);

	         // Return the ModelAndView
	         return modelAndView;
	     } catch (Exception e) {
	         // Handle any exceptions
	         e.printStackTrace();
	         return null; // Or handle the exception gracefully and return an appropriate ModelAndView
	     }
	 }

	 @RequestMapping("/viewMomos")
	 public ModelAndView showMomosImages() {
	     try (Session session = sf.openSession()) {
	         // Retrieve list of FoodProduct objects
	         List<FoodProduct> indexList = session.createQuery("from FoodProduct", FoodProduct.class).list();
	         
	         // Filter the list to include only the images with names containing "momos"
	         List<FoodProduct> momosImages = indexList.stream()
	                 .filter(product -> product.getPname().toLowerCase().contains("momos"))
	                 .collect(Collectors.toList());

	         // Construct base URL for the images
	         String baseUrl = "http://localhost:8080/ProductImages/";

	         // Update image paths to include the base URL
	         for (FoodProduct momosImage : momosImages) {
	             String imageName = momosImage.getPimagepath();
	             int index = imageName.lastIndexOf("/");
	             String fileName = imageName.substring(index + 1);
	             String imageUrl = baseUrl + fileName;
	             momosImage.setPimagepath(imageUrl);
	         }

	         // Create ModelAndView object
	         ModelAndView modelAndView = new ModelAndView();

	         // Set view name to momos.jsp
	         modelAndView.setViewName("usermenu");

	         // Add momosImages to the ModelAndView
	         modelAndView.addObject("indexList", momosImages);

	         // Return the ModelAndView
	         return modelAndView;
	     } catch (Exception e) {
	         // Handle any exceptions
	         e.printStackTrace();
	         return null; // Or handle the exception gracefully and return an appropriate ModelAndView
	     }
	 }
	 @RequestMapping("/viewBiryaani")
	 public ModelAndView showBiryaaniImages() {
	     try (Session session = sf.openSession()) {
	         // Retrieve list of FoodProduct objects
	         List<FoodProduct> indexList = session.createQuery("from FoodProduct", FoodProduct.class).list();
	         
	         // Filter the list to include only the images with names containing "biryaani"
	         List<FoodProduct> biryaaniImages = indexList.stream()
	                 .filter(product -> product.getPname().toLowerCase().contains("biryaani"))
	                 .collect(Collectors.toList());

	         // Construct base URL for the images
	         String baseUrl = "http://localhost:8080/ProductImages/";

	         // Update image paths to include the base URL
	         for (FoodProduct biryaaniImage : biryaaniImages) {
	             String imageName = biryaaniImage.getPimagepath();
	             int index = imageName.lastIndexOf("/");
	             String fileName = imageName.substring(index + 1);
	             String imageUrl = baseUrl + fileName;
	             biryaaniImage.setPimagepath(imageUrl);
	         }

	         // Create ModelAndView object
	         ModelAndView modelAndView = new ModelAndView();

	         // Set view name to biryaani.jsp
	         modelAndView.setViewName("usermenu");

	         // Add biryaaniImages to the ModelAndView
	         modelAndView.addObject("indexList", biryaaniImages);

	         // Return the ModelAndView
	         return modelAndView;
	     } catch (Exception e) {
	         // Handle any exceptions
	         e.printStackTrace();
	         return null; // Or handle the exception gracefully and return an appropriate ModelAndView
	     }
	 }

	 @RequestMapping("/viewCakes")
	 public ModelAndView showCakesImages() {
	     try (Session session = sf.openSession()) {
	         // Retrieve list of FoodProduct objects
	         List<FoodProduct> indexList = session.createQuery("from FoodProduct", FoodProduct.class).list();
	         
	         // Filter the list to include only the images with names containing "cakes"
	         List<FoodProduct> cakeImages = indexList.stream()
	                 .filter(product -> product.getPname().toLowerCase().contains("cake"))
	                 .collect(Collectors.toList());

	         // Construct base URL for the images
	         String baseUrl = "http://localhost:8080/ProductImages/";

	         // Update image paths to include the base URL
	         for (FoodProduct cakeImage : cakeImages) {
	             String imageName = cakeImage.getPimagepath();
	             int index = imageName.lastIndexOf("/");
	             String fileName = imageName.substring(index + 1);
	             String imageUrl = baseUrl + fileName;
	             cakeImage.setPimagepath(imageUrl);
	         }

	         // Create ModelAndView object
	         ModelAndView modelAndView = new ModelAndView();

	         // Set view name to cake.jsp
	         modelAndView.setViewName("usermenu");

	         // Add cakeImages to the ModelAndView
	         modelAndView.addObject("indexList", cakeImages);

	         // Return the ModelAndView
	         return modelAndView;
	     } catch (Exception e) {
	         // Handle any exceptions
	         e.printStackTrace();
	         return null; // Or handle the exception gracefully and return an appropriate ModelAndView
	     }
	 }

	 @RequestMapping("/searchImages")
	 public ModelAndView searchImages(@RequestParam String query) {
	     try (Session session = sf.openSession()) {
	         // Retrieve list of FoodProduct objects
	         List<FoodProduct> indexList = session.createQuery("from FoodProduct", FoodProduct.class).list();

	         // Filter the list to include only the images with names containing the search query
	         List<FoodProduct> searchResult = indexList.stream()
	                 .filter(product -> product.getPname().toLowerCase().contains(query.toLowerCase()))
	                 .collect(Collectors.toList());

	         // Construct base URL for the images
	         String baseUrl = "http://localhost:8080/ProductImages/";

	         // Update image paths to include the base URL
	         for (FoodProduct product : searchResult) {
	             String imageName = product.getPimagepath();
	             int index = imageName.lastIndexOf("/");
	             String fileName = imageName.substring(index + 1);
	             String imageUrl = baseUrl + fileName;
	             product.setPimagepath(imageUrl);
	         }

	         // Create ModelAndView object
	         ModelAndView modelAndView = new ModelAndView();

	         // Set view name to the page where you want to display the search results
	         modelAndView.setViewName("usermenu");

	         // Add searchResult to the ModelAndView
	         modelAndView.addObject("indexList", searchResult);

	         // Return the ModelAndView
	         return modelAndView;
	     } catch (Exception e) {
	         // Handle any exceptions
	         e.printStackTrace();
	         return null; // Or handle the exception gracefully and return an appropriate ModelAndView
	     }
	 }

	 
	 @PostMapping("/submitOrder")
	 public ModelAndView submitOrder(
	         @RequestParam(name = "finalPrice") double finalPrice,
	         @RequestParam(name = "email") String email,
	         @RequestParam(name="address") String shippingAddress,
	         @RequestParam(name = "name") String name,
	         @RequestParam(name = "productId") List<Integer> productIds,
	         @RequestParam(name = "productName") List<String> productNames,
	         @RequestParam(name = "productPrice") List<Integer> productPrices,
	         @RequestParam(name = "quantity") List<Integer> quantities,
	         @RequestParam(name = "totalPrice") List<Integer> totalPrices,
	         Model model) {

	     // Capture the current date and time
	  
	     // Create and populate OrderData object
	     OrderData orderData = new OrderData();
	     orderData.setName(name);
	     orderData.setEmail(email);
	     orderData.setFinalPrice(finalPrice);
	     orderData.setProductName(productNames);
	     orderData.setQuantity(quantities);
	     orderData.setProductIds(productIds);
	     orderData.setShippingaddress(shippingAddress);
	   
	     // Save OrderData to the database
	     Session session = sf.openSession();
	     Transaction tx = session.beginTransaction();
	     session.save(orderData);
	     tx.commit();

	     return new ModelAndView("payment");
	 }
	 
	 
	 @RequestMapping(value = "/cancel", method = RequestMethod.POST)
	    public ResponseEntity<Map<String, String>> cancelOrder(@RequestParam String email, @RequestParam int productId) {
		 System.out.println(1);
	        Map<String, String> response = new HashMap<>();
	        Session session = sf.openSession();
	        System.out.println(2);
	        Query query = session.createQuery("from OrderData where email = :email and :productId member of productIds");
	        query.setParameter("email", email);
	        query.setParameter("productId", productId);
	        List<OrderData> orders = query.list();
	        if (orders.isEmpty()) {
	            session.close();
	            System.out.println(3);
	            response.put("errorMessage", "Order with provided email and productId does not exist.");
	            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
	        }
	        System.out.println(4);
	        Transaction tx = session.beginTransaction();
	        for (OrderData orderData : orders) {
	            orderData.setOrderStatus("CANCELLED");
	            session.update(orderData);
	        }
	        tx.commit();
	        session.close();
	        response.put("success", "Order cancellation request received");
	        return new ResponseEntity<>(response, HttpStatus.OK);
	    }
	
	 
	
}
