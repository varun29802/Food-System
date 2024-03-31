package com.FoodSystem.FoodSystem.ManagerController;



import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.FoodSystem.FoodSystem.Model.FoodProduct;
import com.FoodSystem.FoodSystem.Model.Manager;
import com.FoodSystem.FoodSystem.Model.OrderData;
import com.FoodSystem.FoodSystem.Model.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Controller
public class ManagerController {

	
	@Autowired
	SessionFactory sf;
	
	@RequestMapping("/managerLog")
	public ModelAndView managerLog() 
	{
		return new ModelAndView("managerLog");
	}
	
	@RequestMapping("/managerIndex")
	public ModelAndView managerIndex() 
	{
		return new ModelAndView("managerIndex");
	}
	@RequestMapping("/orderStatus")
	public ModelAndView orderSatatus() 
	{
		return new ModelAndView("orderStatus");
	}
	@RequestMapping("/addproduct")
	public ModelAndView addProduct() 
	{
		return new ModelAndView("addproduct");
	}
	
	
	
	
	
	
	@RequestMapping("/registerManager")
	public ModelAndView registerManager(@ModelAttribute Manager manager) 
	{  
			Session ss=sf.openSession();
			Manager manager1=ss.get(Manager.class, manager.getManagerEmail());
			if (manager1!=null) {
				return new ModelAndView("managerLog");
				
			} else {
				Session session=sf.openSession();
				Transaction tx=session.beginTransaction();
				session.save(manager);
				tx.commit();
				return new ModelAndView("managerIndex");

			}
		}
	@RequestMapping("/managerLogin")
	public ModelAndView managerLogIn(@ModelAttribute Manager manager,HttpServletRequest request) 
	{
        ModelAndView andView = new ModelAndView();
		
		Session session = sf.openSession();
		Manager manager1 = session.get(Manager.class,manager.getManagerEmail());
		
		if(manager1 != null &&manager1.getManagerEmail().equals(manager.getManagerEmail()) && manager1.getManagerPassword().equals(manager.getManagerPassword()))
		{
			andView.setViewName("managerIndex");
			HttpSession httpSession = request.getSession();
			//httpSession.setAttribute("name", manager1.getUserName());
			httpSession.setAttribute("manageremail", manager1.getManagerEmail());
			andView.addObject("message","You have login successfull");
		}
		else
		{
			andView.setViewName("managerLog");
			andView.addObject("message","Wrong User Id Or Password");
		}
		
		return andView;
	}
	 @RequestMapping("/managerLogOut")
     public ModelAndView managerLogOut(HttpServletRequest request) 
     {
		 HttpSession ss=request.getSession(false);
		 if (ss!=null) {
			ss.invalidate();
		}
		 ModelAndView mv=new ModelAndView();
		 mv.setViewName("managerLog");
		 mv.addObject("message","log out Succesfully...");
		 return mv;
    	 
     }
	 // 1 button
	 @RequestMapping("/orderdData")
	 @Transactional
	 public ModelAndView fetchOrderedCusData() {
	     ModelAndView modelAndView = new ModelAndView();
	     try (Session session = sf.openSession()) {
	         Query<OrderData> query = session.createQuery("from OrderData where orderStatus = :status", OrderData.class);
	         query.setParameter("status", "ORDERED");
	         List<OrderData> orderedOrderDataList = query.list();
	         for (OrderData orderData : orderedOrderDataList) {
	             // Initialize any lazy-loaded properties within the session
	             Hibernate.initialize(orderData.getProductIds());
	             Hibernate.initialize(orderData.getProductName());
	             Hibernate.initialize(orderData.getQuantity());
	             // Add more initializations for other lazy-loaded properties if needed
	         }
	         modelAndView.addObject("orderDataList", orderedOrderDataList);
	     } catch (Exception e) {
	         e.printStackTrace();
	         modelAndView.addObject("errorMessage", "An error occurred while fetching ordered customer data.");
	     }
	     modelAndView.setViewName("orderStatus");
	     return modelAndView;
	 }
	 @RequestMapping("/customerLoginData")
	    public ModelAndView customerLoginData() {
	        ModelAndView modelAndView = new ModelAndView();
	        try (Session session = sf.openSession()) {
	            Query<User> query = session.createQuery("FROM User", User.class);
	            List<User> userList = query.list();
	            modelAndView.addObject("userData", userList);
	            modelAndView.setViewName("userDataP");
	        } catch (Exception ex) {
	            ex.printStackTrace();
	            // Handle exception
	            modelAndView.setViewName("errorPage"); // Set an error view if an exception occurs
	        }
	        return modelAndView;
	    }
	

	// 2 button
	 @RequestMapping("/cancelledCustomersData")
	 @Transactional
	 public ModelAndView fetchCancelledCusData() {
	     ModelAndView modelAndView = new ModelAndView();
	     try (Session session = sf.openSession()) {
	         Query<OrderData> query = session.createQuery("from OrderData where orderStatus = :status", OrderData.class);
	         query.setParameter("status", "CANCELLED");
	         List<OrderData> cancelledOrderDataList = query.list();
	         for (OrderData orderData : cancelledOrderDataList) {
	             // Initialize any lazy-loaded properties within the session
	             Hibernate.initialize(orderData.getProductIds());
	             Hibernate.initialize(orderData.getProductName());
	             Hibernate.initialize(orderData.getQuantity());
	             // Add more initializations for other lazy-loaded properties if needed
	         }
	         modelAndView.addObject("orderDataList", cancelledOrderDataList);
	     } catch (Exception e) {
	         e.printStackTrace();
	         modelAndView.addObject("errorMessage", "An error occurred while fetching cancelled customer data.");
	     }
	     modelAndView.setViewName("orderScancel_deliver");
	     return modelAndView;
	 }
	 
	 
	 // 3.button
	 @RequestMapping("/deliveredCustomersData")
	 @Transactional
	 public ModelAndView fetchDeliveredCusData() {
	     ModelAndView modelAndView = new ModelAndView();
	     try (Session session = sf.openSession()) {
	         Query<OrderData> query = session.createQuery("from OrderData where orderStatus = :status", OrderData.class);
	         query.setParameter("status", "DELIVERED");
	         List<OrderData> deliveredOrderDataList = query.list();
	         for (OrderData orderData : deliveredOrderDataList) {
	             // Initialize any lazy-loaded properties within the session
	             Hibernate.initialize(orderData.getProductIds());
	             Hibernate.initialize(orderData.getProductName());
	             Hibernate.initialize(orderData.getQuantity());
	             // Add more initializations for other lazy-loaded properties if needed
	         }
	         modelAndView.addObject("orderDataList", deliveredOrderDataList);
	     } catch (Exception e) {
	         e.printStackTrace();
	         modelAndView.addObject("errorMessage", "An error occurred while fetching delivered customer data.");
	     }
	     modelAndView.setViewName("orderScancel_deliver");
	     return modelAndView;
	 }
	 
	 
	 
	 // 4 button
	 //add product details
	 @RequestMapping("/productDetailForm")
		public ModelAndView productDetailForm(@ModelAttribute FoodProduct product,
				@RequestParam("pimage") MultipartFile pimage) {
			ModelAndView view = new ModelAndView();
			view.setViewName("addproduct");

			if (!pimage.isEmpty()) {
				try {
					String uploadsDir = "C:/Users/Vaibhav/Downloads/FoodSystem/FoodSystem/src/main/webapp/ProductImages";

					// Create the uploads directory if it doesn't exist
					File directory = new File(uploadsDir);
					if (!directory.exists()) {
						boolean created = directory.mkdirs();
						if (!created) {
							System.out.println("Failed to create directory: " + uploadsDir);
							return view;
						}
					}

					String fileName = pimage.getOriginalFilename();
					String filePath = uploadsDir + "/" + fileName;
					System.out.println("File Path:- " + filePath);
					FileCopyUtils.copy(pimage.getBytes(), new File(filePath));

					product.setPimagepath(filePath);

					Session ss = sf.openSession();
					Transaction tx = ss.beginTransaction();
					ss.save(product);
					tx.commit();
				} catch (IOException e) {
					e.printStackTrace();
					System.out.println("Error saving image: " + e.getMessage()); // Log exception
				}
			} else {
				System.out.println("Uploaded image is empty."); // Debug statement
			}

			return view;
		}
	 
	 @RequestMapping("upPage")
	 public ModelAndView upF()
	 {
		 return new ModelAndView("updateProduct");
	 }
	 
	 
	 // 5. button update product
	 @RequestMapping(value = "/update-product", method = RequestMethod.POST)
	    public ModelAndView updateProduct(@RequestParam("pid") Long pid,
	                                      @RequestParam("pname") String pname,
	                                      @RequestParam("pprice") int pprice,
	                                      @RequestParam("pdesc") String pdesc) {
	        ModelAndView modelAndView = new ModelAndView();
	        modelAndView.setViewName("updateProduct"); // Set view name to display after form submission

	        try (Session session = sf.openSession()) {
	            Transaction tx = session.beginTransaction();

	            // Retrieve the product to update
	            FoodProduct product = session.get(FoodProduct.class, pid);
	            if (product != null) {
	                // Update product details
	                product.setPname(pname);
	                product.setPprice(pprice);
	                product.setPdesc(pdesc);

	                // Update the product in the database
	                session.update(product);

	                // Commit the transaction
	                tx.commit();

	                // Add success message
	                modelAndView.addObject("message", "Product updated successfully.");
	            } else {
	                // Add error message if product not found
	                modelAndView.addObject("errorMessage", "Product with ID " + pid + " not found.");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            // Add error message
	            modelAndView.addObject("errorMessage", "Error updating product: " + e.getMessage());
	        }

	        return modelAndView;
	    }
	 
	  // 6 . button delete product
	 @RequestMapping("/deleteProduct")
	 public ModelAndView deleteProductDetails(@RequestParam("pid") int pid) {
	     ModelAndView modelAndView = new ModelAndView();
	     Session session = sf.openSession();
	     Transaction tx = null;
	     try {
	         tx = session.beginTransaction();
	         FoodProduct product = session.get(FoodProduct.class, pid);
	         if (product != null) {
	             session.delete(product);
	             tx.commit();
	             modelAndView.addObject("message", "Product deleted successfully");
	         } else {
	             modelAndView.addObject("errorMessage", "Product with ID " + pid + " not found");
	         }
	     } catch (HibernateException e) {
	         if (tx != null) {
	             tx.rollback();
	         }
	         modelAndView.addObject("errorMessage", "Error deleting product: " + e.getMessage());
	     } finally {
	         session.close();
	     }
	     modelAndView.setViewName("managerIndex");
	     return modelAndView;
	 }

	 
	 
	  @RequestMapping(value = "/cancelOrder", method = RequestMethod.POST)
	  public String cancelOrder(@RequestParam int orderId, RedirectAttributes redirectAttributes) {
		    ModelAndView modelAndView = new ModelAndView();
		    Map<String, String> response = new HashMap<>();
		    Session session = sf.openSession();
		    try {
		        Transaction tx = session.beginTransaction();
		        // Fetch the order by orderId
		        OrderData order = session.get(OrderData.class, orderId);
		        if (order == null) {
		            // Return to the orderStatus page if the order does not exist
		        	return "redirect:/orderStatus";
		            
		        }
		        // Update the order status to CANCELLED
		        order.setOrderStatus("CANCELLED");
		        session.update(order);
		        tx.commit();
		        // Redirect to the orderStatus page after successful cancellation
		        return "redirect:/orderdData";
		       
		    } catch (Exception e) {
		        e.printStackTrace();
		        // Redirect to the orderStatus page if an error occurs
		        return "redirect:/orderStatus";
		    } finally {
		        session.close();
		    }
		}

	  @RequestMapping(value = "/deliverOrder", method = RequestMethod.POST)
	  public String deliverOrder(@RequestParam int orderId,RedirectAttributes redirectAttributes) {
	      ModelAndView modelAndView = new ModelAndView();
	      Map<String, String> response = new HashMap<>();
	      Session session = sf.openSession();
	      try {
	          Transaction tx = session.beginTransaction();
	          // Fetch the order by orderId
	          OrderData order = session.get(OrderData.class, orderId);
	          if (order == null) {
	              // Return to the orderStatus page if the order does not exist
	        	  return "redirect:/orderStatus";
		            
	          }
	          // Update the order status to DELIVERED
	          order.setOrderStatus("DELIVERED");
	          session.update(order);
	          tx.commit();
	          // Redirect to the orderStatus page after successful delivery
	          return "redirect:/orderdData";
	      } catch (Exception e) {
	          e.printStackTrace();
	          // Redirect to the orderStatus page if an error occurs
	          return "redirect:/orderStatus";
	      } finally {
	          session.close();
	      }
	  }
	  
	  @RequestMapping("/delete-user")
	  public ModelAndView deleteUser(@RequestParam("email") String email) {
	      try (Session session = sf.openSession()) {
	          Transaction tx = session.beginTransaction();
	          Query query = session.createQuery("DELETE FROM User WHERE email = :email");
	          query.setParameter("email", email);
	          int rowsAffected = query.executeUpdate();
	          tx.commit();
	          
	          if (rowsAffected > 0) {
	              System.out.println("User with email " + email + " deleted successfully.");
	          } else {
	              System.out.println("No user found with email " + email + ".");
	          }
	      } catch (Exception e) {
	          System.out.println("Error deleting user: " + e.getMessage());
	      }
	      return new ModelAndView("managerIndex");
	  }

	
}
