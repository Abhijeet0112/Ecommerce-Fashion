<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Commerce Fashion</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <style>
        /* Custom CSS for animations and hover effects */
        .hero-carousel img {
            height: 70vh;
            object-fit: cover;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }
        .scroll-animation {
            opacity: 0;
            transform: translateY(50px);
            transition: all 0.5s ease-in-out;
        }
        .scroll-visible {
            opacity: 1;
            transform: translateY(0);
        }
        .carousel-caption {
		    background: rgba(0, 0, 0, 0.5);
		    padding: 20px;
		    border-radius: 10px;
		}
		.carousel img {
		    height: 600px; /* Adjust as needed */
		    object-fit: cover;
		}
		
		.carousel img {
		    width: 1584px;
		    height: 396px;
		    object-fit: cover;
		}
		.carousel-caption {
		    background: rgba(0, 0, 0, 0.5);
		    padding: 10px;
		    border-radius: 5px;
		}
		
		        
    </style>
    <script>
        // JavaScript for scroll animations
        document.addEventListener("DOMContentLoaded", function () {
            const animatedElements = document.querySelectorAll('.scroll-animation');
            const observer = new IntersectionObserver(
                entries => {
                    entries.forEach(entry => {
                        if (entry.isIntersecting) {
                            entry.target.classList.add('scroll-visible');
                        }
                    });
                },
                { threshold: 0.2 }
            );
            animatedElements.forEach(element => observer.observe(element));
        });
    </script>
</head>
<body>
    <jsp:include page="header.jsp" />

    <!-- Hero Section with Carousel -->
    <div id="heroCarousel" class="carousel slide hero-carousel" data-bs-ride="carousel">
        <div class="carousel-inner">
            <c:forEach var="banner" items="${banners}">
                <div class="carousel-item ${banner.first ? 'active' : ''}">
                    <img src="${banner.imageUrl}" class="d-block w-100" alt="${banner.title}">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>${banner.title}</h5>
                        <p>${banner.description}</p>
                    </div>
                </div>
            </c:forEach>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

		   <!-- Full-Width Photo Slider with Fixed Size -->
		<div id="fashionCarousel" class="carousel slide" data-bs-ride="carousel">
		    <div class="carousel-inner">
		        <!-- Slide 1 -->
		        <div class="carousel-item active">
		            <img src="https://images.unsplash.com/photo-1483985988355-763728e1935b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" class="d-block w-100" alt="Fashion Trends 1" style="height: 396px; width: 1584px; object-fit: cover;">
		            <div class="carousel-caption d-none d-md-block">
		                <h3>Discover Latest Fashion</h3>
		                <p>Shop the trendiest collections of the season!</p>
		            </div>
		        </div>
		        <!-- Slide 2 -->
		        <div class="carousel-item">
		            <img src="https://images.unsplash.com/photo-1534452203293-494d7ddbf7e0?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" class="d-block w-100" alt="Fashion Trends 2" style="height: 396px; width: 1584px; object-fit: cover;">
		            <div class="carousel-caption d-none d-md-block">
		                <h3>Summer Collection</h3>
		                <p>Cool, comfy, and stylish clothing for all!</p>
		            </div>
		        </div>
		        <!-- Slide 3 -->
		        <div class="carousel-item">
		            <img src="https://images.unsplash.com/photo-1520006403909-838d6b92c22e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" class="d-block w-100" alt="Fashion Trends 3" style="height: 396px; width: 1584px; object-fit: cover;">
		            <div class="carousel-caption d-none d-md-block">
		                <h3>Exclusive Deals</h3>
		                <p>Upgrade your wardrobe with premium styles.</p>
		            </div>
		        </div>
		        <!-- Slide 4 -->
		        <div class="carousel-item">
		            <img src="https://images.unsplash.com/photo-1563013544-824ae1b704d3?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" class="d-block w-100" alt="Fashion Trends 4" style="height: 396px; width: 1584px; object-fit: cover;">
		            <div class="carousel-caption d-none d-md-block">
		                <h3>Shop by Category</h3>
		                <p>Explore men's, women's, and kids' collections!</p>
		            </div>
		        </div>
		    </div>
		    <!-- Carousel Controls -->
		    <button class="carousel-control-prev" type="button" data-bs-target="#fashionCarousel" data-bs-slide="prev">
		        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		        <span class="visually-hidden">Previous</span>
		    </button>
		    <button class="carousel-control-next" type="button" data-bs-target="#fashionCarousel" data-bs-slide="next">
		        <span class="carousel-control-next-icon" aria-hidden="true"></span>
		        <span class="visually-hidden">Next</span>
		    </button>
		</div>
   
   

    <!-- Featured Products Section -->
    <div class="container my-5">
        <div class="row">
            <c:forEach var="product" items="${products}">
                <div class="col-md-4 mb-4 scroll-animation">
                    <div class="card shadow-sm h-100">
                        <img src="${product.imageUrl}" class="card-img-top" alt="${product.title}" style="height: 200px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title">
                                <a href="productDetails?id=${product.id}" class="text-dark font-weight-bold" style="text-decoration: none;">
                                    ${product.title}
                                </a>
                            </h5>
                            <p class="card-text text-muted">${product.description}</p>
                            <p class="card-text"><strong>Type:</strong> ${product.type}</p>
                            <p class="card-text"><strong>Price:</strong> ₹${product.price}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
